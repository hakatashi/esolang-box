const fs = require('fs');
const cubix = require('./cubix/cubix.js');

if (process.argv.length < 4) {
	process.stderr.write(`Usage: node ${process.argv[1]} <file> <input>`);
	process.exit(1);
}

const code = fs.readFileSync(process.argv[2]);

cubix.run(code.toString(), process.argv[3]);
