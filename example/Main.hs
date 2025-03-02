{-# LANGUAGE LambdaCase #-}

module Main
  ( main
  ) where

import Web.Browser ( openBrowser )

main :: IO ()
main = openBrowser "https://haskell.org/" >>= \case
  True -> putStrLn "The operation succeeded!"
  False -> putStrLn "The operation failed!"
