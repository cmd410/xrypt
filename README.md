# Xrypt

A stupid simple encryption tool using XOR. Can be used to password protect files containig sensetive data.

No warranty though. XOR should be pretty safe but it all depends on your password entropy.

## Usage

```console
$ xrypt --help
A simple XOR encryption tool

Usage:
   [options] COMMAND

Commands:

  e                Encrypt file
  d                Decrypt file

Options:
  -h, --help
```

### Example

#### Encrypt a file

```console
$ xrypt e README.md README.md.encrypted
> Enter password => •••            
> Repeat password => •••
Done!
```

#### Decrypt file

```console
$ xrypt d README.md.encrypted README.md 
> Enter password => •••            
Done!
```

> Be careful with filenames! There is literally no protection from overwriting existing files.
