module Cat where

cat :: IO()
cat = do
 filePath <- getLine
 fileContents <- readFile filePath
 putStrLn fileContents