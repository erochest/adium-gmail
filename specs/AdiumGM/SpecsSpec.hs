{-# LANGUAGE OverloadedStrings #-}


module AdiumGM.SpecsSpec where


import Test.Hspec


spec :: Spec
spec =
    describe "AdiumGM" $ do
        it "should read options from a configuration file." $
            pending
        it "should read chats from an XML file." $
            pending
        it "should associate user names with GMail contacts." $
            pending
        it "should ignore other user names." $
            pending
        it "should connect to the GMail API." $
            pending
        it "should add messages to the user as GMail messages to the user." $
            pending
        it "should add messages from the user as GMail messages from the user." $
            pending
        it "should tag all messages IRC-DM." $
            pending
        it "should track it's last imported messages." $
            pending
        it "should not re-import messages it's already imported." $
            pending
