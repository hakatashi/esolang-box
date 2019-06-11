const {Script} = require('vm');
const fs = require('fs');
const path = require('path');

const {JSDOM} = require('jsdom');

if (process.argv.length < 4) {
	process.stderr.write(`Usage: node ${process.argv[1]} [file] [inputfile]`);
	process.exit(1);
}

const code = fs.readFileSync(process.argv[2]).toString();
const input = fs.readFileSync(process.argv[3]).toString().split(/\r?\n/);

const dom = new JSDOM(`<div id="wrapper">${code}</div>`, {
	runScripts: 'outside-only',
});

const files = [
	'wysiscript/src/util.js',
	'wysiscript/src/font.js',
	'wysiscript/src/color.js',
	'wysiscript/src/value.js',
	'wysiscript/src/interpreter.js',
];

for (const file of files) {
	const scriptData = fs.readFileSync(path.join(__dirname, file));
	const script = new Script(scriptData);
	dom.runVMScript(script);
}

const interpreter = new dom.window.Interpreter();
dom.window.fontList = {
	monospace: Object.assign({}, ...dom.window.FontList.testFonts.map((font) => ({[font.toLowerCase()]: 1}))),
};

dom.window.alert = (data) => {
	process.stdout.write(data);
};

dom.window.prompt = () => input.shift() || null;

const root = dom.window.document.getElementById('wrapper');
const versionEl = root.querySelector('.version')
if (versionEl) {
	root.removeChild(versionEl);
}

interpreter.interpret(root);
