{-# LANGUAGE LambdaCase #-}

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
    -- * Utilities
  , openBrowserWithException
  ) where

import           Control.Exception ( Exception (..), SomeException, try)
import           Data.Maybe ( isNothing )
import qualified Web.Browser.OS as OS

-- | Seeks to open the given item, silently. If the item is a URL or another
-- item associated with a web browser (for example, it represents a local
-- @.html@ file), seeks to open it in the user's preferred web browser. Returns
-- whether or not the operation succeeded.
--
-- No checks are performed on the nature or validity of the given item.
--
-- Implemented using:
--
-- * on Windows, the \'open\' operation provided by the Win32 API. For an item
--   that represents a file, equivalent double-clicking on the file's icon;
--
-- * on macOS, the \'open\' application, if it is on the user's PATH. For an
--   item that represents a file, equivalent to double-clicking on the file's
--   icon; and
--
-- * on Linux, FreeBSD, OpenBSD or NetBSD, the \'xdg-open\' script, if it
--   is on the user's PATH.
--
-- On other operating systems, the operation always fails.
--
-- @since 0.1.0.0
openBrowser ::
     String
     -- ^ URL or other item to try to open.
  -> IO Bool
openBrowser url =
  isNothing <$> (openBrowserWithException url :: IO (Maybe SomeException))

-- | Exported to help with debugging. As for 'openBrowser' but returns 'Nothing'
-- or 'Just' an exception.
--
-- @since 0.5.0.0
openBrowserWithException ::
     Exception e
  => String
     -- ^ URL or other item to try to open.
  -> IO (Maybe e)
openBrowserWithException url = try (OS.openBrowser url) >>= \case
  Left e -> pure $ Just e
  Right () -> pure Nothing
