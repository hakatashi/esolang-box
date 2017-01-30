#include <stdio.h>

int main() {
	char buf[256];

	while (fgets(buf, sizeof(buf), stdin) != NULL) {
		fprintf(stdout, "%s", buf);
	}

	return 0;
}