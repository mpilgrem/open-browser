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
openBrowserWithExitCode =
  -- Operation never succeeds
  error "openBrowser: Unsupported operating system."
