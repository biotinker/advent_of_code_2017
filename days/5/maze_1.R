maze <- scan("input.txt")
index <- 1
steps <- 0
while(index > 0 & index <= length(maze)){
	mVal <- maze[index]
	maze[index] = maze[index] + 1
	index = index + mVal
	steps <- steps + 1
}
print(steps)
