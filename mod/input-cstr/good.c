#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void ekatN(const char *str, int n) {
	for (size_t i = 0; i < n; i += 1) {
		printf("%c", str[i]);
	}
	printf("%c", '\n');
}

int main(int argc, char *argv[]) {
	int n;
	char *buf;

	printf("%s", "Syötä merkkijono: ");
	scanf("%ms", &buf);

	for (;;) {
		printf("%s", "Syötä kokonaisluku: ");
		scanf("%d", &n);
		if (n > strlen(buf)) {
			printf("%s\n", "Tarkista syöte!");
			continue;
		}
		break;
	}

	ekatN(buf, n);

	free(buf);
	return 0;
}
