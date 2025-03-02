{-# LANGUAGE CPP #-}
{-# LANGUAGE ForeignFunctionInterface #-}

module Web.Browser.Windows
  ( openBrowserWindows
  ) where

import System.Win32.Types
         ( HANDLE, HINSTANCE, INT, LPCTSTR, handleToWord, nullPtr, withTString )

openBrowserWindows :: String -> IO Bool
openBrowserWindows url =
  withTString "open" $ \openStr ->
    withTString url $ \urlStr ->
      exitCodeToBool `fmap` c_ShellExecute nullPtr
                                           openStr
                                           urlStr
                                           nullPtr
                                           nullPtr
                                           1
 where
  exitCodeToBool hinst
    | handleToWord hinst > 32 = True
    | otherwise               = False

-- https://learn.microsoft.com/en-us/windows/win32/api/shellapi/nf-shellapi-shellexecutew
foreign import WINDOWS_CCONV unsafe "windows.h ShellExecuteW"
  c_ShellExecute ::
       HANDLE  -- _In_opt_
    -> LPCTSTR -- _In_opt_
    -> LPCTSTR -- _In_
    -> LPCTSTR -- _In_opt_
    -> LPCTSTR -- _In_opt_
    -> INT     -- _In_
    -> IO HINSTANCE
