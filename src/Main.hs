{-# LANGUAGE OverloadedStrings #-}
module Main where
import Network.HTTP.Simple    

main :: IO ()
main = do
    testUrl
   


-- main :: IO ()
-- main = do
--  let url = "https://www.comparethemarket.com/"   
--  let statusCode = testUrl url
--  handleStatusCode statusCode

--testUrl :: String -> Response a
testUrl = do
    response <- httpLbs "https://www.comparethemarket.com/"
    putStrLn $ show (getResponseStatusCode response)

handleStatusCode :: Int -> IO()
handleStatusCode statusCode
 | statusCode >= 500 = putStrLn "Server Error"
 | statusCode >= 400 = putStrLn "Client Error"
 | statusCode >= 300 = putStrLn "Redirection"
 | statusCode >= 200 = putStrLn "Success"
 | statusCode >= 100 = putStrLn "Information"
 | otherwise = putStrLn "Unknown Status Code" 
