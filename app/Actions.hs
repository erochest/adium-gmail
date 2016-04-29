{-# LANGUAGE OverloadedLists   #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}


module Actions where


import           Control.Error

import           AdiumGM.Actions.Import

import           Types


action :: Actions -> Script ()

action ImportAction{..} = importAction importConfigFile
