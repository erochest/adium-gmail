{-# LANGUAGE OverloadedStrings #-}


module Main where


import           AdiumGM.Types

import           Actions
import           Opts


main :: IO ()
main = runAdiumM . action =<< parseOpts
