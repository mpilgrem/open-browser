--------------------------------------------------------------------------------
-- For unsupported operating systems
--------------------------------------------------------------------------------

module Web.Browser.OS
  ( openBrowser
  ) where

openBrowser = const (pure False) -- Operation never succeeds
