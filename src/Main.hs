{-# LANGUAGE OverloadedStrings #-}
module Main where
import Web.Scotty
import Data.Monoid ((<>))

main :: IO ()
main = do
 putStrLn "Starting server..."
 scotty 3000 $ do
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

