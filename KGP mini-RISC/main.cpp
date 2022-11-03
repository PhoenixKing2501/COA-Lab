// #include <format>
#include <bitset>
#include <cstring>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <unordered_map>

struct Opcode
{
	int32_t op{}, fn{};
	char op_s[7]{}, fn_s[7]{};

	Opcode() = default;
	Opcode(const Opcode &) = default;
	Opcode &operator=(const Opcode &) = default;
	Opcode(Opcode &&) = default;
	Opcode &operator=(Opcode &&) = default;
	~Opcode() = default;

	Opcode(int32_t o, int32_t f) : op{o}, fn{f}
	{
		strcpy_s(op_s, std::bitset<6>(o)
						   .to_string()
						   .c_str());
		strcpy_s(fn_s, std::bitset<6>(fn)
						   .to_string()
						   .c_str());
	}
};

void parse_labels(
	std::istream &file,
	std::unordered_map<std::string, std::size_t> &labels)
{
	file.seekg(0, std::ios::beg);

	std::string line{}, word{};
	std::istringstream sstr{};

	std::size_t pc{};

	while (not file.eof())
	{
		getline(file, line, '\n');
		if (line == "")
		{
			continue;
		}

		line.erase(0, line.find_first_not_of(" \t\n\r"));
		line.erase(line.find_last_not_of(" \t\n\r") + 1);

		sstr.str(line);

		sstr >> word;

		if (word.back() == ':')
		{
			word.pop_back();
			labels[word] = pc;
		}
		else
		{
			pc += 1;
		}

		sstr.clear();
	}

	file.clear();
}

template <uint8_t T>
bool check_range(int32_t num, bool unsign = true)
{
	if (unsign)
	{
		uint32_t temp = num;
		return temp >= 0 and temp <= ((1 << T) - 1);
	}
	else
	{
		return num >= -(1 << (T - 1)) and num <= ((1 << (T - 1)) - 1);
	}
}

int main(int argc, char *argv[])
{
	if (argc < 3)
	{
		// std::fprintf(stderr, "Usage {} {} {}",
		// 						 argv[0],
		// 						 "<Input File>",
		// 						 "<Output File>");

		std::fprintf(stderr, "Usage %s %s %s",
					 argv[0],
					 "<Input File>",
					 "<Output File>");

		return EXIT_FAILURE;
	}

	freopen(argv[1], "r", stdin);
	freopen(argv[2], "w", stdout);

	int32_t op{}, fn{};
	char name[10]{};

	std::ifstream table{"./table.txt"};

	std::unordered_map<std::string, Opcode> code_map{};

	while (not table.eof())
	{
		table >> op >> fn >> name;

		code_map[name] = {op, fn};
	}
	table.close();

	int32_t rs{}, rt{}, imm{};
	std::string name1{}, label{};
	std::unordered_map<std::string, std::size_t> labels{};

	std::ifstream file_in{argv[1]};

	parse_labels(file_in, labels);
	file_in.close();

	std::cout << "memory_initialization_radix=2;\n";
	std::cout << "memory_initialization_vector=\n";

	while (std::cin >> std::ws >> name1)
	{
		if (name1.back() == ':')
		{
			continue;
		}

		Opcode &temp{code_map[name1]};

		switch (temp.op)
		{
		case 0:
		case 10:
		case 21:
		case 50:
		{
			std::scanf(" $%i, $%i", &rs, &rt);

			if (not check_range<5>(rs))
			{
				std::fprintf(stderr, "ERROR: Invalid Register `%i`\n", rs);
				return EXIT_FAILURE;
			}

			if (not check_range<5>(rt))
			{
				std::fprintf(stderr, "ERROR: Invalid Register `%i`\n", rt);
				return EXIT_FAILURE;
			}

			// std::cout << std::format("{} {} {} {} {},\n",
			// std::cout << std::format("{}{}{}{}{},\n",
			// 						 temp.op_s,
			// 						 std::bitset<5>(rs).to_string(),
			// 						 std::bitset<5>(rt).to_string(),
			// 						 std::string(10, '0'),
			// 						 temp.fn_s);

			std::printf("%s%s%s%s%s,\n",
						temp.op_s,
						std::bitset<5>(rs)
							.to_string()
							.c_str(),
						std::bitset<5>(rt)
							.to_string()
							.c_str(),
						std::string(10, '0')
							.c_str(),
						temp.fn_s);
		}

		break;

		case 20:
		{
			std::scanf(" $%i, %i", &rs, &imm);

			if (not check_range<5>(rs))
			{
				std::fprintf(stderr, "ERROR: Invalid Register `%i`\n", rs);
				return EXIT_FAILURE;
			}

			if (not check_range<10>(imm, false))
			{
				std::fprintf(stderr, "ERROR: Value `%i` out of range\n", imm);
				return EXIT_FAILURE;
			}

			// std::cout << std::format("{} {} {} {} {},\n",
			// std::cout << std::format("{}{}{}{}{},\n",
			// 						 temp.op_s,
			// 						 std::bitset<5>(rs).to_string(),
			// 						 std::string(5, '0'),
			// 						 std::bitset<10>(imm).to_string(),
			// 						 temp.fn_s);

			std::printf("%s%s%s%s%s,\n",
						temp.op_s,
						std::bitset<5>(rs)
							.to_string()
							.c_str(),
						std::string(5, '0')
							.c_str(),
						std::bitset<10>(imm)
							.to_string()
							.c_str(),
						temp.fn_s);
		}

		break;

		case 1:
		{
			std::scanf(" $%i, %i", &rs, &imm);

			if (not check_range<5>(rs))
			{
				std::fprintf(stderr, "ERROR: Invalid Register `%i`\n", rs);
				return EXIT_FAILURE;
			}

			if (not check_range<15>(imm, false))
			{
				std::fprintf(stderr, "ERROR: Value `%i` out of range\n", imm);
				return EXIT_FAILURE;
			}

			// std::cout << std::format("{} {} {} {},\n",
			// std::cout << std::format("{}{}{}{},\n",
			// 						 temp.op_s,
			// 						 std::bitset<5>(rs).to_string(),
			// 						 std::bitset<15>(imm).to_string(),
			// 						 temp.fn_s);

			std::printf("%s%s%s%s,\n",
						temp.op_s,
						std::bitset<5>(rs)
							.to_string()
							.c_str(),
						std::bitset<15>(imm)
							.to_string()
							.c_str(),
						temp.fn_s);
		}

		break;

		case 30:
		case 31:
		{
			std::scanf(" $%i, %i($%i)", &rt, &imm, &rs);

			if (not check_range<5>(rt))
			{
				std::fprintf(stderr, "ERROR: Invalid Register `%i`\n", rt);
				return EXIT_FAILURE;
			}

			if (not check_range<16>(imm, false))
			{
				std::fprintf(stderr, "ERROR: Value `%i` out of range\n", imm);
				return EXIT_FAILURE;
			}

			if (not check_range<5>(rs))
			{
				std::fprintf(stderr, "ERROR: Invalid Register `%i`\n", rs);
				return EXIT_FAILURE;
			}

			// std::cout << std::format("{} {} {} {},\n",
			// std::cout << std::format("{}{}{}{},\n",
			// 						 temp.op_s,
			// 						 std::bitset<5>(rs).to_string(),
			// 						 std::bitset<5>(rt).to_string(),
			// 						 std::bitset<16>(imm).to_string());

			std::printf("%s%s%s%s,\n",
						temp.op_s,
						std::bitset<5>(rs)
							.to_string()
							.c_str(),
						std::bitset<5>(rt)
							.to_string()
							.c_str(),
						std::bitset<16>(imm)
							.to_string()
							.c_str());
		}

		break;

		case 40:
		case 41:
		case 42:
		case 43:
		{
			std::cin >> label;

			if (not labels.contains(label))
			{
				std::fprintf(stderr, "ERROR: Undeclared Label `%s`\n", label.c_str());
				return EXIT_FAILURE;
			}

			// std::cout << std::format("{} {},\n",
			// std::cout << std::format("{}{},\n",
			// 						 temp.op_s,
			// 						 std::bitset<26>(labels[label]).to_string());

			std::printf("%s%s,\n",
						temp.op_s,
						std::bitset<26>(labels[label])
							.to_string()
							.c_str());
		}

		break;

		case 44:
		{
			std::scanf(" $%i", &rs);

			if (not check_range<5>(rs))
			{
				std::fprintf(stderr, "ERROR: Invalid Register `%i`\n", rs);
				return EXIT_FAILURE;
			}

			// std::cout << std::format("{} {} {},\n",
			// std::cout << std::format("{}{}{},\n",
			// 						 temp.op_s,
			// 						 std::bitset<5>(rs).to_string(),
			// 						 std::string(21, '0'));

			std::printf("%s%s%s,\n",
						temp.op_s,
						std::bitset<5>(rs)
							.to_string()
							.c_str(),
						std::string(21, '0')
							.c_str());
		}

		break;

		case 45:
		case 46:
		case 47:
		{
			std::scanf(" $%i,", &rs);
			std::cin >> label;

			if (not check_range<5>(rs))
			{
				std::fprintf(stderr, "ERROR: Invalid Register `%i`\n", rs);
				return EXIT_FAILURE;
			}

			if (not labels.contains(label))
			{
				std::fprintf(stderr, "ERROR: Undeclared Label `%s`\n", label.c_str());
				return EXIT_FAILURE;
			}

			// std::cout << std::format("{} {} {},\n",
			// std::cout << std::format("{}{}{},\n",
			// 						 temp.op_s,
			// 						 std::bitset<5>(rs).to_string(),
			// 						 std::bitset<21>(labels[label]).to_string());

			std::printf("%s%s%s,\n",
						temp.op_s,
						std::bitset<5>(rs)
							.to_string()
							.c_str(),
						std::bitset<21>(labels[label])
							.to_string()
							.c_str());
		}

		break;

		default:
			break;
		}
	}

	std::cout.seekp(-3, std::ios::end);
	std::cout << ";\n";
}
