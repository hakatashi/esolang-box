const fs = require('fs');
const createRuntime = require('./nuts.js');

if (process.argv.length < 4) {
	process.stderr.write(`Usage: node ${process.argv[1]} [file] [inputfile]`);
	process.exit(1);
}

const code = fs.readFileSync(process.argv[2]);
const input = Array.from(fs.readFileSync(process.argv[3]).toString());

const runtime = createRuntime({
	putChar(char) {
		process.stdout.write(char);
	},
	async getChar() {
		if (input.length === 0) {
			return '';
		}
		return input.shift();
	},
	randByte() {
		return Math.floor(Math.random() * 256);
	},
	log(text) {
		console.error(text);
	},
	error(text) {
		console.error(text);
	},
	async sleep() {},
});

runtime.load(code.toString());
runtime.run();
