.PHONY: all clean

all: clean
	flex scanner.lex
	bison -Wcounterexamples --verbose -d parser.ypp
	g++ -std=c++17 -o hw2 *.c *.cpp
clean:
	rm -f lex.yy.c
	rm -f parser.tab.*pp
	rm -f hw2

run: all
	./hw2 < hw2-tests/t1.in > hw2-tests/t1.my
	./hw2 < hw2-tests/t2.in > hw2-tests/t2.my
	./hw2 < input_files/t3.in > input_files/t3.my
	./hw2 < input_files/t4.in > input_files/t4.my
	./hw2 < input_files/t5.in > input_files/t5.my
	./hw2 < input_files/t6.in > input_files/t6.my
	./hw2 < input_files/t7.in > input_files/t7.my
	./hw2 < input_files/t8.in > input_files/t8.my
	./hw2 < input_files/t9.in > input_files/t9.my
	./hw2 < input_files/t10.in > input_files/t10.my
	./hw2 < input_files/t11.in > input_files/t11.my

check: run
	diff -s hw2-tests/t1.out hw2-tests/t1.my
	diff -s hw2-tests/t2.out hw2-tests/t2.my
	diff -s input_files/t3.my input_files/t3.res
	diff -s input_files/t3.my input_files/t3.res
	diff -s input_files/t4.my input_files/t4.res
	diff -s input_files/t5.my input_files/t5.res
	diff -s input_files/t6.my input_files/t6.res
	diff -s input_files/t7.my input_files/t7.res
	diff -s input_files/t8.my input_files/t8.res
	diff -s input_files/t9.my input_files/t9.res
	diff -s input_files/t10.my input_files/t10.res
