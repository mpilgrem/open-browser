{-# LANGUAGE ForeignFunctionInterface #-}

--------------------------------------------------------------------------------
-- For Windows operating systems, making use of the Win32 API.
--------------------------------------------------------------------------------

module Web.Browser
  ( openBrowser
  ) where

import System.Win32.Types
         ( HANDLE, HINSTANCE, INT, LPCTSTR, handleToWord, nullPtr, withTString )

#include "common-include.hs"

openBrowser url =
  withTString "open" $ \openStr ->
    withTString url $ \urlStr -> exitCodeToBool <$>
      c_ShellExecute nullPtr openStr urlStr nullPtr nullPtr 1
 where
  exitCodeToBool hinst = handleToWord hinst > 32

-- https://learn.microsoft.com/en-us/windows/win32/api/shellapi/nf-shellapi-shellexecutew
foreign import ccall unsafe "windows.h ShellExecuteW"
  c_ShellExecute ::
       HANDLE  -- _In_opt_
    -> LPCTSTR -- _In_opt_
    -> LPCTSTR -- _In_
    -> LPCTSTR -- _In_opt_
    -> LPCTSTR -- _In_opt_
    -> INT     -- _In_
    -> IO HINSTANCE
