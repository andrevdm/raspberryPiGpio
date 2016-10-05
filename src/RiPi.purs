module RiPi where

import Prelude
import Data.String as Str
import Node.Encoding as E
import Node.FS.Sync as S
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Node.FS (FS)
import Gpio (Direction (..), Pin (..))

open :: Pin -> forall e. Eff (fs :: FS, err :: EXCEPTION | e) Unit
open (Pin pin) = do
  e <- S.exists $ "/sys/class/gpio/gpio" <> show pin
  if not e 
    then 
      S.writeTextFile E.ASCII "/sys/class/gpio/export" (show pin)
    else
      pure unit

setDirection :: Pin -> Direction -> forall e. Eff (fs :: FS, err :: EXCEPTION | e) Unit
setDirection (Pin pin) dir = do
  let dirStr = case dir of
                  In -> "in"
                  Out -> "out" 
  S.writeTextFile E.ASCII "/sys/class/gpio/gpio18/direction" dirStr

setValue :: Pin -> Boolean -> forall e. Eff (fs :: FS, err :: EXCEPTION | e) Unit
setValue (Pin pin) on = do
  let val = if on then "1" else "0"
  S.writeTextFile E.ASCII ("/sys/class/gpio/gpio" <> (show pin) <> "/value") val

getValue :: Pin -> forall e. Eff (fs :: FS, err :: EXCEPTION | e) Boolean
getValue (Pin pin) = do
  val <- (Str.trim <$> S.readTextFile E.ASCII "/sys/class/gpio/gpio18/value")
  pure $ val /= "0"

toggle :: Pin -> forall e. Eff (fs :: FS, err :: EXCEPTION | e) Unit
toggle pin = do
  val <- getValue pin
  setValue pin (not val)