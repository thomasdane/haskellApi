module Main where
import System.IO (readFile)

main :: IO ()
main = do
 putStrLn "What is your name"
 input <- getLine
 putStrLn $ greet input

greet :: String -> String
greet name = "Hello " ++ name

printConfig = do
	contents <- readFile "stack.yaml"
	putStrLn contents