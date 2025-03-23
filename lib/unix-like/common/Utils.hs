--------------------------------------------------------------------------------
-- For operating systems that use an application or a script on the PATH to open
-- the URL.
--------------------------------------------------------------------------------

module Utils
  ( openBrowserWith
  ) where

import System.Exit ( ExitCode (..) )
import System.Process ( proc, waitForProcess, withCreateProcess )

openBrowserWith ::
     String
     -- ^ Name of relevant executable on the PATH.
  -> [String]
     -- ^ Arguments for executable.
  -> IO Bool
openBrowserWith cmd args =
  withCreateProcess (proc cmd args) $ \_ _ _ p ->
    (== ExitSuccess) <$> waitForProcess p
