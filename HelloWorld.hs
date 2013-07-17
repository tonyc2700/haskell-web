module Main where

import Control.Monad
import Happstack.Server (nullConf, simpleHTTP, ok, dir, dirs, path)
  
main :: IO ()
main = simpleHTTP nullConf $ msum [mzero
                                  , dir "hello" $ path $ \s -> ok $ "Hello, " ++ s
                                  , dirs "hello/world" $ ok hText
                                  , dir "goodbye" $ ok bText
                                  , dir "hello" $ path $ \s -> ok $ "Hello, " ++ s
                                  ]

hText :: String
hText = "Hello, this is some text...."
bText :: String
bText = "Goodbye, this some text...."