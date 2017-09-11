{-# LANGUAGE OverloadedStrings #-}
module Main where
import Network.HTTP.Simple    

main :: IO ()
main = do
    response <- httpLBS "http://httpbin.org/get"
    let statusCode = show $ getResponseStatusCode response
    putStrLn statusCode

-- main :: IO ()
-- main = do
--  let url = "http://httpbin.org/get"   
--  let statusCode = show $ getStatusCode url
--  putStrLn statusCode

--getStatusCode :: Request -> IO()
getStatusCode url = do
 response <- httpLBS url
 let statusCode = show $ getResponseStatusCode response
 putStrLn statusCode



handleStatusCode :: Int -> IO()
handleStatusCode statusCode
 | statusCode >= 500 = putStrLn "Server Error"
 | statusCode >= 400 = putStrLn "Client Error"
 | statusCode >= 300 = putStrLn "Redirection"
 | statusCode >= 200 = putStrLn "Success"
 | statusCode >= 100 = putStrLn "Information"
 | otherwise = putStrLn "Unknown Status Code" 
