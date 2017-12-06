
-- ~ higherSquareByTwo :: Integer -> Integer -> Integer

--returns the number whose square is higher than the input
--If input is eve/odd output will be the same
higherSquareByTwo n sq = if n > sq * sq
  then higherSquareByTwo n (sq+2)
  else sq

sideLoc n = sideLoc' n (higherSquareByTwo n 1)
sideLoc' n side = case side of
  1 -> 0
  _ -> (mod (side*side-n) (side-1))

sqToDist n = (n-1) `div` 2

sideOf :: RealFrac a => a -> Integer
sideOf i = case i of
  1 -> 1
  _ -> toInteger (abs ((ceiling ((i - ((higherSquareByTwo i 1) - 2)^2)/((higherSquareByTwo i 1)-1))) - 4))

getNeighbors :: Integer -> [Integer]
getNeighbors i
  | i == 1 = []
  | i == 2 = [1]
  | i == 3 = [1,1]
  | i == 8 = [7,6,2,1]
  -- look back
  | sideLoc i  == (higherSquareByTwo i 1) - 2 && sideOf (fromIntegral i) /= 3 = 
    i - 1 : i - 2 : (getInners i (higherSquareByTwo i 1))
  -- look forward
  | (sideLoc i  == 0 || sideLoc i == 1) && sideOf (fromIntegral i) == 0 =  
    i - 1 : 1 + ((higherSquareByTwo i 1) - 2)^2 : (getInners i (higherSquareByTwo i 1))
  --First after new side
  | sideLoc i  == (higherSquareByTwo i 1) - 2 && sideOf (fromIntegral i) == 3 =  (getInners i (higherSquareByTwo i 1))
  | otherwise = i - 1 : (getInners i (higherSquareByTwo i 1))

inCorner :: Integer -> Integer -> Integer
inCorner i side = (side - 2)^2 - (side - 3) * sideOf (fromIntegral i)

getInners :: Integer -> Integer -> [Integer]
getInners i side
  | side == 3 = [1]
  -- first after a new side
  | sideLoc i == side - 2 && sideOf (fromIntegral i) == 3 = case side of 
      3 -> [1]
      _ -> [(side - 4)^2 + 1, (side-2)^2]
  -- is a corner
  | sideLoc i == 0 = [(inCorner (i-1) side)]
  --  or right after
  | sideLoc i == side - 2 = [((inCorner (i-1) side) + 1),(inCorner (i-1) side)]
  -- or right before
  | sideLoc i == 1 = [((inCorner (i) side) - sideLoc i),
                      ((inCorner (i) side) - sideLoc i + 1)]
  
  | sideLoc i == side - 3 && sideOf (fromIntegral i) == 3 =
     [((inCorner (i) side) - sideLoc i + 2),
      ((inCorner (i) side) - sideLoc i + 1),
      (side-2)^2]
  | otherwise = [((inCorner (i) side) - sideLoc i + 2),
                 ((inCorner (i) side) - sideLoc i + 1),
                 (inCorner (i) side) - sideLoc i]

sumNeighbors :: [Integer] -> [Integer] -> Integer
sumNeighbors _ [] = 1
sumNeighbors xs ys = sum [xs!!(fromIntegral i - 1)|i<-ys]

calcNext :: [Integer] -> Integer
calcNext [] = 1
calcNext xs = sumNeighbors (reverseList xs) (getNeighbors (toInteger (1 + length xs)))

findHigher :: Integer -> [Integer]
findHigher n = findHigher' n []

findHigher' :: Integer -> [Integer] -> [Integer]
findHigher' n [] = findHigher' n ((calcNext []) : [])
findHigher' n xs = if head xs > n
  then xs
  else findHigher' n ((calcNext xs) : xs)

reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

main = do
  let input = 347991
  print (show (head (findHigher input)))
