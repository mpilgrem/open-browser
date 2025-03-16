--------------------------------------------------------------------------------
-- For unsupported operating systems
--------------------------------------------------------------------------------

module Web.Browser.OS
  ( openBrowser
  ) where

openBrowser ::
     String
     -- ^ URL
  -> IO Bool
openBrowser = const (pure False) -- Operation never succeeds
