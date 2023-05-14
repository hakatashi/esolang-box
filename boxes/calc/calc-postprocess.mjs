import { readFile } from 'node:fs/promises';
import { parse } from 'csv-parse/sync';

if (process.argv.length < 3) {
	process.stderr.write(`Usage: node ${process.argv[1]} <outputfile>`);
	process.exit(1);
}

const output = await readFile(process.argv[2], 'utf-8');

const data = parse(output, {
	relax_column_count: true,
});

process.stdout.write(data[1][0]);
