module Logg where

import              Data.Text
import              Data.Time                                           (getCurrentTime)
import              Types
import              Control.Monad.Trans.Class                           (lift)


logE:: String -> IO Text
logE log = do
    time <- getCurrentTime
    let logLine = append (append (pack $ show time) (pack " - ")) (append (pack log) (pack "\n"))
    return logLine

logE':: String -> RWSIO Text
logE' log = do
    time <- lift getCurrentTime
    let logLine = append (append (pack $ show time) (pack " - ")) (append (pack log) (pack "\n"))
    return logLine