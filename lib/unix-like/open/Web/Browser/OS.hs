--------------------------------------------------------------------------------
-- For Unix-like operating systems, such as macOS, that provide the open
-- application on the PATH.
--------------------------------------------------------------------------------

module Web.Browser.OS
  ( openBrowser
  ) where

import Utils ( openBrowserSilentlyWith )

-- https://ss64.com/mac/open.html
openBrowser ::
     String
     -- ^ URL
  -> IO Bool
openBrowser url = openBrowserSilentlyWith "open" [url]
