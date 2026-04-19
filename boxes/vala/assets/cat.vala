void main() {
    string? line;
    while ((line = stdin.read_line()) != null) {
        stdout.printf("%s\n", line);
    }
}
