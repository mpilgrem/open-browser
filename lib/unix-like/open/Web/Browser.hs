--------------------------------------------------------------------------------
-- For Unix-like operating systems, such as macOS, that provide the open
-- application on the PATH.
--------------------------------------------------------------------------------

module Web.Browser
  ( openBrowser
  ) where

import Utils ( openBrowserWith )

#include "common-include.hs"

openBrowser url = openBrowserWith "open" [url]
