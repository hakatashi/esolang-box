import { readFile } from 'node:fs/promises';
import { parse } from 'csv-parse/sync';
import { stringify } from 'csv-stringify/sync';

if (process.argv.length < 4) {
	process.stderr.write(`Usage: node ${process.argv[1]} <inputfile> <csvfile>`);
	process.exit(1);
}

const input = await readFile(process.argv[2], 'utf-8');
const csv = await readFile(process.argv[3], 'utf-8');

const data = parse(csv, {
	relax_column_count: true,
});

process.stdout.write(stringify([
	[input],
	...data,
]));
