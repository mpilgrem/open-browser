--------------------------------------------------------------------------------
-- For Unix-like operating systems, such as macOS, that provide the open
-- application on the PATH.
--------------------------------------------------------------------------------

module Web.Browser.OS
  ( openBrowser
  ) where

import Utils ( openBrowserWith )

-- https://ss64.com/mac/open.html
openBrowser url = openBrowserWith "open" [url]
