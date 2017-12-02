//Compile with
// ldc2 chksum_1.d -O3 -of=chksum_1
// cat input.txt | ./chksum_1

import std.stdio;
import std.string;
import std.conv;

void main(string[] args){
	string line;
	float sum = 0;
	while ((line = stdin.readln()) !is null){
		string[] pieces = line.split;
		
		float max;
		max = max.infinity * -1;
		float min;
		min = min.infinity;
		
		foreach(piece; pieces){
			float pnum = to!float(piece);
			if(pnum > max){
				max = pnum;
			}
			if(pnum < min){
				min = pnum;
			}
		}
		sum = sum + max - min;
	}
	writeln(sum);
}
