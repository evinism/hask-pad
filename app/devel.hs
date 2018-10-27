{-# LANGUAGE PackageImports #-}
import "hask-pad" Application (develMain)
import Prelude (IO, putStrLn)
import Configuration.Dotenv
import Configuration.Dotenv.Types

main :: IO ()
main = do
    loadFile defaultConfig
    develMain
