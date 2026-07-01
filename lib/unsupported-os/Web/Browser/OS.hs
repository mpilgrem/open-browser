--------------------------------------------------------------------------------
-- For unsupported operating systems
--------------------------------------------------------------------------------

module Web.Browser.OS
  ( openBrowser
  ) where

openBrowser ::
     String
     -- ^ URL or other item to try to open.
  -> IO ()
openBrowser _ =
  -- Operation never succeeds
  error "openBrowser: Unsupported operating system."
