const fs = require('fs');
const path = require('path');
const {JSDOM, VirtualConsole} = require('jsdom');

if (process.argv.length < 4) {
	process.stderr.write(`Usage: node ${process.argv[1]} <file> <inputfile>`);
	process.exit(1);
}

const code = fs.readFileSync(process.argv[2]).toString();
const input = fs.readFileSync(process.argv[3]).toString();

const virtualConsole = new VirtualConsole();
virtualConsole.sendTo(console);

const {window} = new JSDOM('', {runScripts: 'outside-only', virtualConsole});

for (const scriptPath of [
	'qlb/public/qlb/qlb.js',
	'qlb/public/qlb/parser.js',
	'qlb/public/qlb/primitives.js',
]) {
	const script = fs.readFileSync(path.resolve(__dirname, scriptPath)).toString();
	window.eval(script);
}

window.Qlb.globalEnvironment.table['المدخلات'] = input;
window.Qlb.execute(code)
