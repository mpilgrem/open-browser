{-# LANGUAGE LambdaCase #-}

module Main
  ( main
  ) where

import Control.Exception ( Exception (..), SomeException )
import Web.Browser ( openBrowser, openBrowserWithException )

main :: IO ()
main = do
  openBrowser "https://haskell.org/" >>= \case
    True -> putStrLn "The operation succeeded!"
    False -> putStrLn "The operation failed!"
  blankLine
  putStrLn "Help with debugging:"
  putStrLn "Try a good URL:"
  tryOpenGoodUrl >>= reportResult
  blankLine
  putStrLn "Try a bad URL:"
  tryOpenBadUrl >>= reportResult
 where
  tryOpenGoodUrl :: IO (Maybe SomeException)
  tryOpenGoodUrl = openBrowserWithException "https://haskell.org/"
  tryOpenBadUrl :: IO (Maybe SomeException)
  tryOpenBadUrl = openBrowserWithException "example-bad-url"
  reportResult = \case
    Just e -> putStrLn $ "Exception: " <> displayException e
    Nothing -> putStrLn "Nothing to report"
  blankLine = putStrLn ""
