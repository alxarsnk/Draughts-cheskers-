{-# LANGUAGE DeriveGeneric #-}

module Types.Board where

import Data.Aeson
import GHC.Generics

data Role =
  Pawn | 
  Queen | 
  King |
  Camel
  -- Pawn - шашка
  -- Queen - ферзь
  -- King - король
  -- Camel - верблюд
  deriving (Eq,Show,Read,Generic)

instance FromJSON Role
instance ToJSON Role

data Color = Black | White
  deriving (Eq, Enum, Show, Read, Generic)

instance FromJSON Color
instance ToJSON Color

newtype Checker = Checker 
  {
    role :: Role
  }
  deriving (Eq,Show,Read,Generic)

makeChecker :: Role -> Maybe Checker
makeChecker r = Just (Checker { role = r })

instance FromJSON Checker
instance ToJSON Checker