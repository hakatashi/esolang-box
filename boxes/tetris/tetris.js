const tetriminos = {
    I: { 7: "I", 6: "X", 5: "X", 4: "=" },
    O: { 1: "O", 5: "X", 6: "*", 2: "X" },
    L: { 4: "L", 5: "X", 6: "X", 2: "M" },
    J: { 6: "J", 5: "X", 4: "X", 0: "/" },
    T: { 6: "+", 5: "X", 4: "X", 1: "-" },
    Z: { 0: "Z", 1: "X", 5: "X", 6: "B" },
    S: { 2: "S", 1: "X", 5: "X", 4: "P" },
};
// 0 1 2 3
// 4 5 6 7
// 8 9 a b
// c d e f
const tets = [
    tetriminos,
    {
        I: { 14: "I", 10: "X", 6: "X", 2: "=" },
        O: { 2: "O", 1: "X", 5: "*", 6: "X" },
        L: { 1: "L", 5: "X", 9: "X", 10: "M" },
        J: { 9: "J", 5: "X", 1: "X", 2: "/" },
        T: { 9: "+", 5: "X", 1: "X", 6: "-" },
        Z: { 2: "Z", 6: "X", 5: "X", 9: "B" },
        S: { 10: "S", 6: "X", 5: "X", 1: "P" },
    },
    {
        I: { 8: "I", 9: "X", 10: "X", 11: "=" },
        O: { 6: "O", 2: "X", 1: "*", 5: "X" },
        L: { 6: "L", 5: "X", 4: "X", 8: "M" },
        J: { 4: "J", 5: "X", 6: "X", 10: "/" },
        T: { 4: "+", 5: "X", 6: "X", 9: "-" },
        Z: { 10: "Z", 9: "X", 5: "X", 4: "B" },
        S: { 8: "S", 9: "X", 5: "X", 6: "P" },
    },
    {
        I: { 1: "I", 5: "X", 9: "X", 13: "=" },
        O: { 5: "O", 6: "X", 2: "*", 1: "X" },
        L: { 9: "L", 5: "X", 1: "X", 0: "M" },
        J: { 1: "J", 5: "X", 9: "X", 8: "/" },
        T: { 1: "+", 5: "X", 9: "X", 4: "-" },
        Z: { 8: "Z", 4: "X", 5: "X", 1: "B" },
        S: { 0: "S", 4: "X", 5: "X", 9: "P" },
    },
];
class TetrisInterpreter {
    constructor(code, stdin) {
        this.state = new Array(10);
        this.errorMessage = "";
        this.stateMessage = "";
        this.code = this.parse(code);
        this.stdin = stdin;
        this.counter = 0;
        this.label = Infinity;
        this.store = {};
        this.pointer = 0;
        this.stdinpointer = 0;
        this.finished = false;
        for (let x = 0; x < 10; x++) {
            this.state[x] = new Array(20);
            for (let y = 0; y < 20; y++) {
                this.state[x][y] = "";
            }
        }
    }
    assert(cond, lineNumber, msg) {
        if (!cond)
            this.errorMessage += `Error ${lineNumber}行目:` + msg + "\n";
        console.assert(cond, msg);
    }
    parse(codestr) {
        let result = {};
        let numbers = [Infinity];
        let lineNumber = 0;
        for (let code of codestr.split(/\n/g)) {
            lineNumber++;
            if (code.match(/^#/))
                continue;
            code = code.replace(/#.*/g, "");
            code = code.replace(/\s/g, "");
            if (!code)
                continue;
            let lastNumber = numbers[numbers.length - 1];
            if (!result[lastNumber])
                result[lastNumber] = [];
            if (code.match(/^-?\d+:/)) {
                let parsed = parseInt(code);
                this.assert(parsed !== NaN, lineNumber, `ラベルの数値をパース出来ません`);
                this.assert(result[parsed] === undefined, lineNumber, "ラベルが重複しています");
                numbers.push(parsed);
                continue;
            }
            this.assert(code.length >= 2, lineNumber, `useOrderが空です`);
            this.assert("ILJZSOT".split("").some(x => x === code[0]), lineNumber, "テトリミノはILJZSOTで指定してください");
            this.assert(code[1] === ":" || code[1] === ".", lineNumber, `useOrderが不定です`);
            for (let i = 2; i < code.length; i++) {
                this.assert("><^VAB".split("").some(x => x === code[i]), lineNumber, `操作が不定です`);
            }
            let codeBlock = {
                blockType: code[0],
                useOrder: code[1] === ":",
                operation: code.substring(2)
            };
            for (let num of numbers)
                result[num].push(codeBlock);
        }
        return result;
    }
    execute1Step() {
        if (this.finished)
            return "";
        if (!this.code || !this.code[this.label]) {
            this.finished = true;
            return "";
        }
        let now = this.code[this.label][this.counter];
        if (now === undefined) {
            this.finished = true;
            return "";
        }
        let mino = now.blockType;
        let useOrder = now.useOrder;
        // これが変化する
        let rot = 0;
        let x = 3;
        let y = 0; // WARN: -2 の方が正しい？
        for (let num in tets[rot][mino]) {
            let n = parseInt(num);
            let dx = n % 4;
            let dy = Math.floor(n / 4);
            if (!(this.state[x + dx] instanceof Array) || this.state[x + dx][y + dy] !== "") {
                this.finished = true;
                return "";
            }
        }
        for (let op of (now.operation + "^").replace(/\^/g, "vvvvvvvvvvvvvvvvvvvvvvvvvv")) {
            let nrot = rot;
            let nx = x;
            let ny = y;
            if (op === "A")
                nrot = (rot + 1) % 4;
            else if (op === "B")
                nrot = (rot + 3) % 4;
            else if (op === "<")
                nx = x - 1;
            else if (op === ">")
                nx = x + 1;
            else if (op === "v")
                ny = y + 1;
            else
                console.assert(false, "invalid operation");
            let ok = true;
            for (let num in tets[nrot][mino]) {
                let n = parseInt(num);
                let dx = n % 4;
                let dy = Math.floor(n / 4);
                if (!(this.state[nx + dx] instanceof Array) || this.state[nx + dx][ny + dy] !== "") {
                    ok = false;
                    break;
                }
            }
            if (!ok)
                continue;
            rot = nrot;
            x = nx;
            y = ny;
        }
        for (let num in tets[rot][mino]) {
            let n = parseInt(num);
            let dx = n % 4;
            let dy = Math.floor(n / 4);
            let str = tets[rot][mino][num];
            if (str === "X")
                str = " ";
            this.state[x + dx][y + dy] = useOrder ? str : " ";
        }
        let codes = [];
        let output = "";
        let r = 0;
        for (let y = 19; y >= 0; y--) {
            let ok = true;
            for (let x = 0; x < 10; x++) {
                if (this.state[x][y] === "")
                    ok = false;
            }
            if (!ok)
                continue;
            let code = "";
            r += 100;
            for (let x = 0; x < 10; x++)
                code += this.state[x][y];
            codes.push(code);
            for (let x = 0; x < 10; x++)
                this.state[x][y] = "";
            for (let y2 = y - 1; y2 >= 0; y2--) {
                for (let x = 0; x < 10; x++)
                    this.state[x][y2 + 1] = this.state[x][y2];
            }
            y++;
        }
        let executeCode = codes.reverse().join("").replace(/ /g, "");
        this.counter++;
        this.stateMessage = `execute [${executeCode}]\nP:{`;
        for (let k in this.store)
            this.stateMessage += `${k}:${this.store[k]},`;
        this.stateMessage += `}\nlabel:${this.label === Infinity ? "?" : this.label}\n`;
        for (let c of executeCode) {
            if (c === "I") {
                if (this.stdinpointer >= this.stdin.length)
                    r = -1;
                else
                    r = this.stdin[this.stdinpointer++].charCodeAt(0);
            }
            else if (c === "O") {
                if (r >= 0) output += String.fromCharCode(r);
            }
            else if (c === "J") {
                if (this.code[r]) {
                    this.counter = 0;
                    this.label = r;
                }
            }
            else if (c === "Z") {
                this.pointer = 0;
            }
            else if (c === "P") {
                this.pointer += r;
            }
            else if (c === "L") {
                r = this.store[this.pointer] || 0;
            }
            else if (c === "S") {
                this.store[this.pointer] = r;
            }
            else if (c === "M") {
                r = -r;
            }
            else if (c === "B") {
                for (let x = 0; x < 10; x++) {
                    for (let y = 0; y < 20; y++)
                        this.state[x][y] = "";
                }
                return output;
            }
            else if (c === "+") {
                r = r + (this.store[this.pointer] || 0);
            }
            else if (c === "-") {
                r = r - (this.store[this.pointer] || 0);
            }
            else if (c === "*") {
                r = r * (this.store[this.pointer] || 0);
            }
            else if (c === "/") {
                let d = (this.store[this.pointer] || 0);
                if (d === 0) {
                    this.stateMessage += "devided by zero error\n";
                    this.finished = true;
                    return output;
                }
                r = Math.floor(r / d);
            }
            else if (c === "%") {
                let d = (this.store[this.pointer] || 0);
                if (d === 0) {
                    this.stateMessage += "devided by zero error\n";
                    this.finished = true;
                    return output;
                }
                r = r % d;
            }
            else if (c === "=") {
                let d = (this.store[this.pointer] || 0);
                if (r === d)
                    r = 0;
                else if (r < d)
                    r = -1;
                else
                    r = 1;
            }
            else {
                console.assert(false, "invalid operation reducing");
            }
        }
        return output;
    }
}
if (process.argv.length <= 2) {
    process.stderr.write("ERROR: no input file\n");
    process.exit(1);
}
const fs = require('fs');
const stdin = "" + fs.readFileSync(0);
const code = "" + fs.readFileSync(process.argv[2]);
const tet = new TetrisInterpreter(code, stdin);
while (!tet.finished) {
    process.stdout.write(tet.execute1Step());
}

