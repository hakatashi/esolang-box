const fs = require('fs');
const Beam = require('./beam-js/src/beam.js');

if (process.argv.length < 4) {
	process.stderr.write(`Usage: node ${process.argv[1]} <code> <input>`);
	process.exit(1);
}

const code = fs.readFileSync(process.argv[2]);

Beam.run(code, process.argv[3], 1.6);
