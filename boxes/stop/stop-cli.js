const fs = require('fs');
const vm = require('vm')
const stopLang = require('./stop-lang/umd/stop.js');

if (process.argv.length < 4) {
	process.stderr.write(`Usage: node ${process.argv[1]} <file> <input>`);
	process.exit(1);
}

const code = fs.readFileSync(process.argv[2]).toString();
const instructions = code.split(/\r?\n/).filter((line) => line.length > 0)
const inputs = process.argv[3].split(/\r?\n/);
let inputIndex = 0;

const program = new stopLang(instructions, {
	stdin: () => {
		const input = inputs[inputIndex];
		inputIndex++;
		return JSON.stringify(input);
	},
	stdout: (stdout) => process.stdout.write(vm.runInNewContext(stdout)),
	stderr: (stderr) => process.stderr.write(vm.runInNewContext(stderr)),
});

program.go();
