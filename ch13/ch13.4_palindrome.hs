import Control.Monad (forever)
import Data.Char (isAlpha, toLower)
import System.Exit (exitSuccess)

palindrome :: IO ()
palindrome = forever $ do
    line1 <- getLine
    let alphaLine = map toLower $ filter isAlpha line1
    case (alphaLine == reverse alphaLine) of
        True -> putStrLn "It's a palindrome!"
        False -> do
            putStrLn "Nope!"
            exitSuccess
            