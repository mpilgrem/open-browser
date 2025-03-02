--------------------------------------------------------------------------------
-- For unsupported operating systems
--------------------------------------------------------------------------------

module Web.Browser
  ( openBrowser
  ) where

#include "common-include.hs"

openBrowser = const (pure False) -- Operation never succeeds
