const fs = require('fs');
const parse = require('csv-parse/lib/sync')

if (process.argv.length < 3) {
	process.stderr.write(`Usage: node ${process.argv[1]} <outputfile>`);
	process.exit(1);
}

const output = fs.readFileSync(process.argv[2]).toString();

const data = parse(output, {
	relax_column_count: true,
});

process.stdout.write(data[1][0]);
