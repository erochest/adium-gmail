{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TemplateHaskell    #-}
{-# LANGUAGE OverloadedStrings          #-}

-- {-# LANGUAGE DeriveFunctor              #-}
-- {-# LANGUAGE DeriveTraversable          #-}
-- {-# LANGUAGE GeneralizedNewtypeDeriving #-}
-- {-# LANGUAGE OverloadedLists            #-}
-- {-# LANGUAGE RankNTypes                 #-}


module AdiumGM.Types
    ( IrcNick
    , EmailAddress
    , Config
    , configAdiumLogDir
    , configGMail
    , configAccessToken
    , configContactMap
    , configLastImport
    , AdiumM
    , runAdiumM
    , liftIO
    ) where


import           Control.Error
import           Control.Exception
import           Control.Lens
import           Control.Monad
import           Control.Monad.IO.Class (liftIO)
import qualified Data.HashMap.Strict    as M
import qualified Data.Text              as T
import           Data.Time
import           Data.Yaml.Aeson
import           GHC.Generics           hiding (to)
import           Network.OAuth.OAuth2


type IrcNick      = T.Text
type EmailAddress = T.Text

data Config
    = Config
    { _configAdiumLogDir :: !FilePath
    , _configGMail       :: !T.Text
    , _configAccessToken :: !(Maybe AccessToken)
    , _configContactMap  :: !(M.HashMap IrcNick EmailAddress)
    , _configLastImport  :: !(Maybe UTCTime)
    } deriving (Show, Generic)
$(makeLenses ''Config)

type AdiumM = ExceptT SomeException IO

runAdiumM :: AdiumM a -> IO a
runAdiumM a = either (error . displayException) return =<< runExceptT a

instance FromJSON Config where
    parseJSON (Object o) =   Config
                         <$> o .: "adium_log_dir"
                         <*> o .: "gmail_account"
                         <*> (_ =<< o .:? "access_token")
                         <*> (undefined <$> o .:? "contact_map")
                         <*> o .:? "last_import"
                         where
                             accessToken = undefined
                             contactMap  = undefined
    parseJSON _          =   mzero

instance ToJSON Config where
    toJSON Config{..} = undefined
