module Components.Utils exposing (capitalize)

import String exposing (..)

capitalize : String -> String
capitalize str =
  (left 1 >> toUpper) str ++ dropLeft 1 str