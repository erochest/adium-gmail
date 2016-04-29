{-# LANGUAGE LambdaCase #-}


module Opts
    ( Actions(..)
    , opts
    , execParser
    , parseOpts
    ) where


import           Options.Applicative

import           Types


configOpt :: Parser FilePath
configOpt = strOption (  short 'c' <> long "config" <> metavar "CONFIG_FILE"
                      <> help "The file to keep configuration information in.")

importOpts :: Parser Actions
importOpts = ImportAction <$> configOpt

-- opts' :: Parser Actions
-- opts' = subparser
--       (  command "import" (info (helper <*> importOpts)
--                           (progDesc "Import messages from IRC DMs into GMail."))
--       )

opts :: ParserInfo Actions
opts = info (helper <*> importOpts)
            (  fullDesc
            <> progDesc "A CLI to back up IRC DMs from Adium into GMail."
            <> header "adium-gmail - Backs up IRC DMs from Adium into GMail.")

parseOpts :: IO Actions
parseOpts = execParser opts
