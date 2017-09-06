{-# LANGUAGE OverloadedStrings #-}
module Main where
import Network.HTTP.Simple    
--import Web.Scotty
--import Data.Monoid ((<>))

main :: IO ()
main = do
 response <- httpLbs "https://www.comparethemarket.com/"
 putStrLn $ show (getResponseStatusCode response)
 
{- scotty 3000 $ do
  hello
  index

index :: ScottyM()
index = do
 get "/" homePage   
 
hello :: ScottyM()
hello = do
 get "/hello/:name" helloPage

homePage :: ActionM()
homePage = do
    text "Home Page"   
    
helloPage :: ActionM()
helloPage = do
    name <- param "name"
    text ("hello " <> name)    
-}

