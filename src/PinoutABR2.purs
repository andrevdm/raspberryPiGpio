module PinoutABR2 where

import Gpio (Pin (..))

data GpioPin = GpioPin2
             | GpioPin3
             | GpioPin4
             | GpioPin17
             | GpioPin27
             | GpioPin22
             | GpioPin10
             | GpioPin9
             | GpioPin11
             | GpioPin14
             | GpioPin15
             | GpioPin18
             | GpioPin23
             | GpioPin24
             | GpioPin25
             | GpioPin8
             | GpioPin7

toPin :: GpioPin -> Pin
toPin g =
  case g of
    GpioPin2  -> Pin 3
    GpioPin3  -> Pin 4
    GpioPin4  -> Pin 7
    GpioPin17 -> Pin 11
    GpioPin27 -> Pin 13
    GpioPin22 -> Pin 15
    GpioPin10 -> Pin 19
    GpioPin9  -> Pin 21
    GpioPin11 -> Pin 23
    GpioPin14 -> Pin 8
    GpioPin15 -> Pin 10
    GpioPin18 -> Pin 12
    GpioPin23 -> Pin 16
    GpioPin24 -> Pin 18
    GpioPin25 -> Pin 22
    GpioPin8  -> Pin 24
    GpioPin7  -> Pin 26
