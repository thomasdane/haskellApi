{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_api (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\dev\\haskellApi\\.stack-work\\install\\5600629f\\bin"
libdir     = "C:\\dev\\haskellApi\\.stack-work\\install\\5600629f\\lib\\x86_64-windows-ghc-8.0.2\\api-0.1.0.0"
dynlibdir  = "C:\\dev\\haskellApi\\.stack-work\\install\\5600629f\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\dev\\haskellApi\\.stack-work\\install\\5600629f\\share\\x86_64-windows-ghc-8.0.2\\api-0.1.0.0"
libexecdir = "C:\\dev\\haskellApi\\.stack-work\\install\\5600629f\\libexec"
sysconfdir = "C:\\dev\\haskellApi\\.stack-work\\install\\5600629f\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "api_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "api_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "api_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "api_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "api_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "api_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
