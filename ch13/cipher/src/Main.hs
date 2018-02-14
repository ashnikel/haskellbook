module Main where
  
import Control.Monad (forever)
import Data.Char     (ord, chr)
import System.Exit (exitSuccess)
import System.IO

shiftr :: Int -> Char -> Char
shiftr i c
    | (ch + i) <= z = chr (ch + i)
    | otherwise = chr (a + (i - (z - ch)) - 1)
    where ch = ord c
          a  = ord 'a'
          z  = ord 'z'
  
shiftl :: Int -> Char -> Char
shiftl i c
    | (ch - i) >= a = chr (ch - i)
    | otherwise = chr (z - (i - (ch - a)) + 1)
    where ch = ord c
          a  = ord 'a'
          z  = ord 'z'

caesar :: Int -> String -> String
caesar i = map (shiftr (i `mod` 26))

unCaesar :: Int -> String -> String
unCaesar i = map (shiftl (i `mod` 26))

vigenere :: String -> String -> String
vigenere passphrase = zipWith shiftr (concat $ repeat pwd)
    where pwd = map (\x -> ord x - ord 'a') passphrase

unVigenere :: String -> String -> String
unVigenere passphrase  = zipWith shiftl (concat $ repeat pwd)
    where pwd = map (\x -> ord x - ord 'a') passphrase

main :: IO ()
main = forever $ do
    hSetBuffering stdout NoBuffering

    putStrLn "1 - Encode with Caesar cipher"
    putStrLn "2 - Decode with Caesar cipher"
    putStrLn "3 - Encode with Vigenère cipher"
    putStrLn "4 - Decode with Vigenère cipher"
    putStrLn "5 - Exit"
    putStr "Your choice: "
    choice <- getLine
    case choice of
        "1" -> do
            putStr "Enter text to encode: "
            text <- getLine
            putStr "Enter the secret (integer): "
            secret <- getLine
            putStr "Encoded message:"
            putStrLn $ caesar (read secret :: Int) text
        "2" -> do
            putStr "Enter text to decode: "
            text <- getLine
            putStr "Enter the secret (integer): "
            secret <- getLine
            putStr "Decoded message: "
            putStrLn $ unCaesar (read secret :: Int) text
        "3" -> do
            putStr "Enter text to encode: "
            text <- getLine
            putStr "Enter password: "
            secret <- getLine
            putStr "Encoded message:"
            putStrLn $ vigenere secret text
        "4" -> do
            putStr "Enter text to decode: "
            text <- getLine
            putStr "Enter password: "
            secret <- getLine
            putStr "Decoded message: "
            putStrLn $ unVigenere secret text 
        "5" -> exitSuccess
