{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE RecordWildCards #-}

module Handler.Note where

import Text.Hamlet (hamletFile)

import Import

notelikeLayout :: Widget -> Handler Html
notelikeLayout widget = do
    pc <- widgetToPageContent $ do
        $(widgetFile "notelike-layout")
    withUrlRenderer $(hamletFile "templates/notelike-layout-wrapper.hamlet")


getNoteR :: Handler Html
getNoteR = notelikeLayout [whamlet|Hello World!|]

getNewNoteR :: Handler Html
getNewNoteR = do
    redirect NoteR

getHomeNoteR = notelikeLayout [whamlet|quick-pad:
dead-simple collaborative notepad
---

Click (+) to create a new note.
Send the link to share.

Notes expire after 30 days of disuse.
|]
