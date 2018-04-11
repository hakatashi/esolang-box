const fs = require('fs');
const Japt = require('./japt/src/japt-interpreter.js');

if (process.argv.length < 4) {
	process.stderr.write(`Usage: node ${process.argv[1]} <file> <input>`);
	process.exit(1);
}

const code = fs.readFileSync(process.argv[2]).toString();
const input = `"${process.argv[3].replace(/(["\\])/g, '\\$1')}"`;

Japt.run(code, input, false, null, (output) => {
	if (Japt.implicit_output && output !== undefined) {
		process.stdout.write(output.toString());
	}
}, (error) => {
	throw error;
});
