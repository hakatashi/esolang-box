#include <string>
#include <iostream>

struct Hoge {
	std::string msg = "";
	~Hoge() { std::cout << msg << std::endl; }
};

int main() {
	auto [msg] = Hoge();
	msg = "Hello, World!";
	return 0;
}