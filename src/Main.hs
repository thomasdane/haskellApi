module Main where
import System.IO (readFile)
import Data.Time (getCurrentTime)
import Data.Aeson

main :: IO ()
main = do
 putStrLn "What is your name"
 input <- getLine
 putStrLn $ greet input

greet :: String -> String
greet name = "Hello " ++ name

printConfig :: IO ()
printConfig = do
	contents <- readFile "stack.yaml"
	putStrLn contents

printTime :: IO ()
printTime = do
	time <- getCurrentTime
	putStrLn $ show time

numbers :: [Int]
numbers = [1,2,3,4]

encodeToJson = do
	encode numbers


