module Types where


-- import           AdiumGM.Types


data Actions
        = Default { defaultOutput :: !FilePath
                  , defaultInput  :: !FilePath
                  }
        deriving (Show, Eq)