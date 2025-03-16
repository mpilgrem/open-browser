--------------------------------------------------------------------------------
-- For Unix-like operating systems that provide the xdg-open application on the
-- PATH.
--------------------------------------------------------------------------------

module Web.Browser.OS
  ( openBrowser
  ) where

import Utils ( openBrowserWith )

-- https://ss64.com/bash/xdg-open.html
openBrowser ::
     String
     -- ^ URL
  -> IO Bool
openBrowser url =
  -- sh -c '...'
  --
  -- tells the shell (sh) to execute the given string as a command, and
  -- the following argument (url) is passed as a positional argument $0.
  --
  -- xdg-open "$0" 2>&1 > /dev/null
  --
  -- The $0 is expanded and the double quotes ensures it is treated as a single
  -- argument to xdg-open.
  --
  -- 2>&1 redirects standard error to standard output.
  --
  -- > /dev/null discards standard output.
  openBrowserWith "sh" ["-c", "xdg-open \"$0\" 2>&1 > /dev/null", url]
