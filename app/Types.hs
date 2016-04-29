module Types where


-- import           AdiumGM.Types


data Actions
        = ImportAction
        { importConfigFile  :: !FilePath
        }
        deriving (Show, Eq)
