//Compile with
// ldc2 mem_1.d -O3 -of=mem_1
// cat input.txt | ./mem_1

import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

int[] redis(int[] intArr){
	int max = to!int(intArr.maxElement());
	int idx = to!int(intArr.maxIndex);
	intArr[idx] = 0;
	while(max > 0){
		idx++;
		if(idx > intArr.length){
			idx = 0;
		}
		intArr[idx]++;
		max--;
	}
	
	return intArr;
}

int redistLoop(int[] mem){
	int iters = 0;
	int[int[]] seen;
	int[] current = mem;
	seen[mem.idup] = 1;
	
	writeln(maxIndex(mem));
	do{
		current = redis(current);
		seen[current.idup] = 1;
		iters++;
	}while(seen[current] != 1);
	return iters;
}

void main(string[] args){
	string line = stdin.readln();
	float sum = 0;
	int[] numbers = to!(int[])(split(line));
	writeln(redistLoop(numbers));
}
