data OperatingSystem =
      GnuPlusLinux
    | OpenBSDPlusNevermindJustBSLStill
    | Mac
    | Windows
    deriving (Eq, Show)

data ProgLang =
      Haskell
    | Agda
    | Idris
    | PureScript
    deriving (Eq, Show)

data Programmer =
    Programmer { os   :: OperatingSystem
               , lang :: ProgLang }
    deriving (Eq, Show)

allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
    [ GnuPlusLinux
    , OpenBSDPlusNevermindJustBSLStill
    , Mac
    , Windows
    ]

allLanguages :: [ProgLang]
allLanguages =
    [ Haskell
    , Agda
    , Idris
    , PureScript
    ]

allProgrammers :: [Programmer]
allProgrammers = [ Programmer x y | x <- allOperatingSystems,
                                    y <- allLanguages]
