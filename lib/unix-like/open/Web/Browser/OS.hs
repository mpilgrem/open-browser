--------------------------------------------------------------------------------
-- For Unix-like operating systems, such as macOS, that provide the open
-- application on the PATH.
--------------------------------------------------------------------------------

module Web.Browser.OS
  ( openBrowser
  ) where

import           Control.Monad ( void )
import           System.Process
                   ( CreateProcess (..), StdStream (..), createProcess, proc )

-- https://ss64.com/mac/open.html
openBrowser ::
     String
     -- ^ URL or other item to try to open.
  -> IO ()
openBrowser url = void $ createProcess (proc "open" [url])
  { std_in = NoStream
  , std_out = NoStream
  , std_err = NoStream
  , close_fds = True
  }
