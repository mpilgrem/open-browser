module Main
  ( main
  ) where

import Web.Browser ( openBrowser )

main :: IO ()
main = openBrowser "https://haskell.org/" >>= print
