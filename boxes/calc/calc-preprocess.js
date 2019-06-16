const fs = require('fs');
const parse = require('csv-parse/lib/sync')
const stringify = require('csv-stringify/lib/sync')

if (process.argv.length < 4) {
	process.stderr.write(`Usage: node ${process.argv[1]} <inputfile> <csvfile>`);
	process.exit(1);
}

const input = fs.readFileSync(process.argv[2]).toString();
const csv = fs.readFileSync(process.argv[3]).toString();

const data = parse(csv, {
	relax_column_count: true,
});

process.stdout.write(stringify([
	[input],
	...data,
]));
