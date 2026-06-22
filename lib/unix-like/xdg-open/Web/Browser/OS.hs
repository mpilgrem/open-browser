--------------------------------------------------------------------------------
-- For Unix-like operating systems that provide the xdg-open script on the PATH.
--------------------------------------------------------------------------------

module Web.Browser.OS
  ( openBrowser
  ) where

import           Control.Monad ( void )
import           System.Process
                   ( CreateProcess (..), StdStream (..), createProcess, proc )

-- https://ss64.com/bash/xdg-open.html
openBrowser ::
     String
     -- ^ URL or other item to try to open.
  -> IO ()
openBrowser url = void $ createProcess (proc "xdg-open" [url])
  { std_in = NoStream
  , std_out = NoStream
  , std_err = NoStream
  , close_fds = True
  }
