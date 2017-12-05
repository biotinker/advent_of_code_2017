
higherSquareByTwo :: Integer -> Integer -> Integer

--returns the number whose square is higher than the input
--If input is eve/odd output will be the same
higherSquareByTwo n sq = if n > sq * sq
  then higherSquareByTwo n (sq+2)
  else sq

sideLoc n side = case side of
  1 -> 0
  _ -> abs ((mod (side*side-n) (side-1)) - side `div` 2)

sqToDist n = (n-1) `div` 2

calcDist input = do
  let side = higherSquareByTwo input 1
  sideLoc input side + sqToDist side

main = do
  let input = 347991
  print (show (calcDist input))
