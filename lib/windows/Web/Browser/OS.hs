{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}

{-# LANGUAGE ForeignFunctionInterface #-}

--------------------------------------------------------------------------------
-- For Windows operating systems, making use of the Win32 API.
--------------------------------------------------------------------------------

module Web.Browser.OS
  ( openBrowser
  ) where

import           Control.Monad ( unless )
import           System.Win32.Types
                   ( HANDLE, HINSTANCE, INT, LPCWSTR, handleToWord, nullPtr
                   , withTString
                   )

type HWND = HANDLE

-- https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-showwindow
-- Activates and displays a window. If the window is minimized, maximized, or
-- arranged, the system restores it to its original size and position. An
-- application should specify this flag when displaying the window for the first
-- time.
sW_SHOWNORMAL :: INT
sW_SHOWNORMAL = 1

openBrowser ::
     String
     -- ^ URL or other item to try to open.
  -> IO ()
openBrowser url = do
  hinst <- withTString "open" $ \openStr ->
    withTString url $ \urlStr ->
      c_ShellExecute nullPtr openStr urlStr nullPtr nullPtr sW_SHOWNORMAL
  let exitcode = fromIntegral (handleToWord hinst) :: Int
  unless (exitcode > 32) $ error $
       "openBrowser: ShellExecuteW \"open\" failed with exit code: "
    <> show exitcode

-- https://learn.microsoft.com/en-us/windows/win32/api/shellapi/nf-shellapi-shellexecutew
foreign import ccall unsafe "windows.h ShellExecuteW"
  c_ShellExecute ::
       HWND         -- [in, optional] hwnd
    -> LPCWSTR      -- [in, optional] lpOperation
    -> LPCWSTR      -- [in]           lpFile
    -> LPCWSTR      -- [in, optional] lpParameters
    -> LPCWSTR      -- [in, optional] lpDirectory
    -> INT          -- [in]           nShowCmd
    -> IO HINSTANCE
