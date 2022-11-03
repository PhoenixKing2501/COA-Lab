./out.txt: ./main ./in.txt
	./main ./in.txt ./out.txt

./main: ./main.cpp
	g++ -O6 -Wall -std=c++2a -o ./main ./main.cpp

clean:
	-rm ./main
	/dev/null > ./out.txt
