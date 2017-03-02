module AdiumGM.Config
    ( readConfig
    ) where


import           Control.Error
import           Control.Exception
import           Data.Bifunctor
import qualified Data.ByteString   as BS
import           Data.Yaml

import           AdiumGM.Types


readConfig :: FilePath -> AdiumM Config
readConfig configFile =
    ExceptT $ first toException . decodeEither' <$> BS.readFile configFile
