--------------------------------------------------------------------------------
-- For Unix-like operating systems that use an application or a script on the
-- PATH to open the URL.
--------------------------------------------------------------------------------

module Utils
  ( openBrowserSilentlyWith
  ) where

import System.Exit ( ExitCode (..) )
import System.IO ( IOMode (..), withFile )
import System.Process
         ( CreateProcess (..), StdStream (..), proc, waitForProcess
         , withCreateProcess
         )

-- | Discards all standard output and standard error from the process.
openBrowserSilentlyWith ::
     String
     -- ^ Name of relevant executable on the PATH.
  -> [String]
     -- ^ Arguments for executable.
  -> IO Bool
openBrowserSilentlyWith cmd args =
  -- /dev/null is specifc to Unix-like operating systems
  withFile "/dev/null" WriteMode $ \nullHandle ->
    withCreateProcess (proc cmd args)
      { std_out = UseHandle nullHandle
      , std_err = UseHandle nullHandle
      } $ \_ _ _ p -> (== ExitSuccess) <$> waitForProcess p
