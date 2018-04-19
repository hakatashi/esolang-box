const fs = require('fs');

if (process.argv.length < 4) {
	process.stderr.write(`Usage: node ${process.argv[1]} <file> <input>`);
	process.exit(1);
}

const wasm = fs.readFileSync(process.argv[2]);
const stdin = process.argv[3];

(async () => {
	const memory = new WebAssembly.Memory({initial: 0x2000});
	const memoryBuffer = Buffer.from(memory.buffer)
	memoryBuffer.write(stdin, 0x1000, 'utf-8');

	const table = new WebAssembly.Table({initial: 0, element: 'anyfunc'});

	const {instance} = await WebAssembly.instantiate(wasm, {
		env: {memory, table},
	});

	const ret = instance.exports.main(0x1000);

	const eosIndex = memoryBuffer.findIndex((byte, index) => index >= ret && byte === 0);
	const result = eosIndex === -1 ? memoryBuffer.slice(ret) : memoryBuffer.slice(ret, eosIndex);
	process.stdout.write(result)
})();
