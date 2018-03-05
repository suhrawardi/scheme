module Parser
    ( readExpr
    ) where

import Text.ParserCombinators.Parsec hiding (spaces)

readExpr :: String -> String
readExpr input = case parse (spaces >> symbol) "lisp" input of
  Left err -> "No match: " ++ show err
  Right val -> "Found value " ++ show val

spaces :: Parser ()
spaces = skipMany1 space

symbol :: Parser Char
symbol = oneOf "!$%&|*+-/:<=?>@^_~#"
