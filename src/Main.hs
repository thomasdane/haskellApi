{-# LANGUAGE OverloadedStrings #-}
module Main where
import Network.HTTP.Simple    

--next time
--setup mailgun
-- can make postman request
-- save request
-- do the same request in haskell
 
urls = ["http://httpbin.org/get","http://httpbin.org/get"] 

main :: IO ()
main = do
 mapM_ testUrl urls

testUrl :: Request -> IO ()
testUrl url = do
 statusCode <- getStatusCode url
 handleStatusCode statusCode

makeRequest = do
 response <- httpJSON "POST http://httpbin.org/post" :: IO (Response ())
 putStrLn $ "The status code was: " ++ show (getResponseStatusCode response) 

getStatusCode url = do
 response <- httpLBS url
 let statusCode = getResponseStatusCode response
 return statusCode

handleStatusCode :: Int -> IO()
handleStatusCode statusCode
 | statusCode >= 500 = putStrLn "Server Error"
 | statusCode >= 400 = putStrLn "Client Error"
 | statusCode >= 300 = putStrLn "Redirection"
 | statusCode >= 200 = putStrLn "Success"
 | statusCode >= 100 = putStrLn "Information"
 | otherwise = putStrLn "Unknown Status Code"

 
