{-# LANGUAGE OverloadedStrings #-}
module Main where
import Network.HTTP.Simple    

main :: IO ()
main = do
    let url = "http://httpbin.org/get"
    statusCode <- getStatusCode url
    putStrLn statusCode

getStatusCode :: Control.Monad.IO.Class.MonadIO m => Request -> m String
getStatusCode url = do
    response <- httpLBS url
    let statusCode = show $ getResponseStatusCode response
    return statusCode

handleStatusCode :: Int -> IO()
handleStatusCode statusCode
 | statusCode >= 500 = putStrLn "Server Error"
 | statusCode >= 400 = putStrLn "Client Error"
 | statusCode >= 300 = putStrLn "Redirection"
 | statusCode >= 200 = putStrLn "Success"
 | statusCode >= 100 = putStrLn "Information"
 | otherwise = putStrLn "Unknown Status Code" 
