const fs = require('fs');
const {JSDOM} = require('jsdom');

if (process.argv.length < 4) {
	process.stderr.write(`Usage: node ${process.argv[1]} <file> <input>`);
	process.exit(1);
}

const code = fs.readFileSync(process.argv[2]).toString();
const input = process.argv[3];

const htmsScript = fs.readFileSync('htms.min.js').toString();

const jsdom = new JSDOM(code, {runScripts: 'outside-only'});
jsdom.window.stdin = input;
jsdom.window.eval(htmsScript);
console.log(jsdom.window.htms.default);
