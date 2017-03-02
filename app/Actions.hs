{-# LANGUAGE OverloadedLists   #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}


module Actions where


import           AdiumGM.Actions.Import
import           AdiumGM.Types

import           Types


action :: Actions -> AdiumM ()

action ImportAction{..} = importAction importConfigFile
