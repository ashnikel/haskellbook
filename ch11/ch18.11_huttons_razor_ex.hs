module Razor where

data Expr = Lit Integer
          | Add Expr Expr

-- 1
eval :: Expr -> Integer
eval (Lit i) = i
eval (Add expr1 expr2) = eval expr1 + eval expr2

-- 2
printExpr :: Expr -> String
printExpr (Lit i) = show i
printExpr (Add expr1 expr2) = printExpr expr1 ++ " + " ++ printExpr expr2
