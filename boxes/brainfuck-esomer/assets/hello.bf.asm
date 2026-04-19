tape[pos] += 1;
while(tape[pos]) {
  tape[pos] -= 2;
  tape[pos + 1] -= 1;
  pos += 1;
  while(tape[pos]) {
    tape[pos + 2] += 1;
    tape[pos + 3] -= 5;
    pos += 1;
  }
  tape[pos - 2] -= 3;
  tape[pos - 1] -= 2;
  pos -= 2;
}
tape[pos + 1] -= 1;
printchar(tape[pos + 1]);
tape[pos + 4] += 1;
printchar(tape[pos + 4]);
printchar(tape[pos + 6]);
printchar(tape[pos + 6]);
tape[pos + 6] += 3;
pos += 6;
while(tape[pos]) {
  printchar(tape[pos]);
  pos += 1;
}
printchar(tape[pos - 4]);
tape[pos - 4] += 3;
printchar(tape[pos - 4]);
tape[pos - 4] -= 6;
printchar(tape[pos - 4]);
tape[pos - 6] -= 1;
printchar(tape[pos - 6]);
tape[pos - 2] += 1;
printchar(tape[pos - 2]);
pos -= 2;
