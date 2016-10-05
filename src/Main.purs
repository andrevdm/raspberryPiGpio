module Main where
import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Exception (EXCEPTION)
import Node.FS (FS)
import Gpio (Direction(Out)) as R
import RiPi (setValue, setDirection, getValue, open) as R
import PinoutABR2 (GpioPin(GpioPin24), toPin) as R

main :: forall e. Eff (console :: CONSOLE, fs :: FS, err :: EXCEPTION | e) Unit
main = do
  let pin = R.toPin R.GpioPin24
  
  R.open pin 

  v <- R.getValue pin

  R.setDirection pin R.Out
  R.setValue pin $ not v