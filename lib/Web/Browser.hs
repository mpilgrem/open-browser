{-|
Module      : Web.Browser
Description : Open a web browser from Haskell
Copyright   : (c) rightfold 2015
License     : BSD3
Maintainer  : public@pilgrem.com

Open a web browser from Haskell. Supported operating systems are Windows, macOS,
Linux and BSD.
-}

module Web.Browser
  ( openBrowser
  ) where

import qualified Web.Browser.OS as OS

-- | Seeks to open the given URL in the user's preferred web browser. Returns
-- whether or not the operation succeeded. No checks are performed on the
-- validity of the given URL.
--
-- Implemented using:
--
-- * on Windows, the \'open\' operation provided by the Win32 API;
--
-- * on macOS, the \'open\' application, if it is on the user's PATH; and
--
-- * on Linux, FreeBSD, OpenBSD or NetBSD, the \'xdg-open\' application, if it
--   is on the user's PATH, via \'sh\' to allow the application's output to be
--   silenced.
--
-- On other operating systems, the operation always fails.
openBrowser ::
     String
     -- ^ URL
  -> IO Bool
openBrowser = OS.openBrowser
