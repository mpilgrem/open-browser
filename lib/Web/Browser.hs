{-# LANGUAGE CPP #-}

module Web.Browser
  ( openBrowser
  ) where

#if defined(mingw32_HOST_OS)
import Web.Browser.Windows ( openBrowserWindows )
#else
import Data.List ( isInfixOf )
import System.Info ( os )
import Web.Browser.Linux ( openBrowserLinux )
import Web.Browser.OSX ( openBrowserOSX )
#endif

-- | Seeks to open the given URL in the user's preferred web browser. Returns
-- whether or not the operation succeeded. Throws an 'ErrorCall' exception if
-- the operating system is unsupported.
openBrowser ::
     String
     -- ^ URL
  -> IO Bool
#if defined(mingw32_HOST_OS)
openBrowser = openBrowserWindows
#else
openBrowser
  | any (`isInfixOf` os) ["linux", "bsd"] = openBrowserLinux
  | "darwin" `isInfixOf` os               = openBrowserOSX
  | otherwise                             = error "unsupported platform"
#endif
