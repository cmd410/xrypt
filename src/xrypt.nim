import std/os

import argparse
import termui

type
  Action = enum
    Encrypt
    Decrypt

proc createPassword(): string =
  while true:
    result = termuiAskPassword("Enter password")
    if result.len == 0:
      echo "Password cannot be empty!"
      continue
    if termuiAskPassword("Repeat password") == result:
      break
    echo "Passwords don't match! Try again."


proc main(infile, outfile: string, action: static[Action]) = 
  if not fileExists(infile):
    echo "File '" & infile & "' does not exist!"
    quit(1)
  
  when action == Encrypt:
    let password = createPassword()
  else:
    let password = termuiAskPassword("Enter password")
  
  let text = readFile(infile)
  var newText = newStringOfCap(text.len)

  for i in 0..text.high:
    let passChar = password[i mod password.len]
    newText.add (text[i].uint8 xor passChar.uint8).char
  
  writeFile outfile, newText
  echo "Done!"


var p = newParser:
  help "A simple XOR encryption tool"
  
  
  command("e"):
    help "Encrypt file"
    arg("infile")
    arg("outfile")
    run:
      main(opts.infile, opts.outfile, Encrypt)

  command("d"):
    help "Decrypt file"
    arg("infile")
    arg("outfile")
    run:
      main(opts.infile, opts.outfile, Decrypt)

try:
  p.run(commandLineParams())
except UsageError:
  stderr.writeLine getCurrentExceptionMsg()
  quit(1)
