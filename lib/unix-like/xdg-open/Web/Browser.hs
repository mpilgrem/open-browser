--------------------------------------------------------------------------------
-- For Unix-like operating systems that provide the xdg-open application on the
-- PATH.
--------------------------------------------------------------------------------

module Web.Browser
  ( openBrowser
  ) where

import Utils ( openBrowserWith )

#include "common-include.hs"

openBrowser url =
  openBrowserWith "sh" ["-c", "xdg-open \"$0\" 2>&1 > /dev/null", url]
