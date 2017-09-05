module RepeatMessage where
import Control.Monad

repeatMessageMonad :: IO ()
repeatMessageMonad = do
 putStrLn "Enter the message"
 message <- getLine
 putStrLn "Enter number of times to repeat"
 numberInput <- readLn
 replicateM_ numberInput (putStrLn message)

repeatMessage :: IO ()
repeatMessage = do
  putStrLn "Enter the message"
  message <- getLine
  putStrLn "Enter number of times to repeat"
  number <- readLn
  let output = take number $ repeat message
  putStrLn $ unwords output