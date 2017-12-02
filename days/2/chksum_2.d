//Compile with
// ldc2 chksum_2.d -O3 -of=chksum_2
// cat input.txt | ./chksum_2

import std.stdio;
import std.string;
import std.conv;

void main(string[] args){
	string line;
	float sum = 0;
	while ((line = stdin.readln()) !is null){
		string[] pieces = line.split;
		
		bool found = false;
		foreach(i; 0..pieces.length){
			if(found){
				break;
			}
			foreach(j; 0..pieces.length){
				if(i == j){
					continue;
				}
				float i_f = to!float(pieces[i]);
				float j_f = to!float(pieces[j]);
				if(i_f % j_f == 0){
					sum += i_f/j_f;
					found = true;
					break;
				}
			}
		}
	}
	writeln(sum);
}
