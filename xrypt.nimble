# Package

version       = "0.1.0"
author        = "CMD"
description   = "A simple XOR encryption tool"
license       = "MIT"
srcDir        = "src"
bin           = @["xrypt"]
binDir        = "bin"


# Dependencies

requires "nim >= 1.6.12"
requires "argparse == 4.0.1"
requires "termui == 0.1.9"