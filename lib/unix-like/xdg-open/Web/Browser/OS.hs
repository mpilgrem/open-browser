--------------------------------------------------------------------------------
-- For Unix-like operating systems that provide the xdg-open script on the PATH.
--------------------------------------------------------------------------------

module Web.Browser.OS
  ( openBrowser
  ) where

import Utils ( openBrowserSilentlyWith )

-- https://ss64.com/bash/xdg-open.html
openBrowser ::
     String
     -- ^ URL
  -> IO Bool
openBrowser url = openBrowserSilentlyWith "xdg-open" [url]
