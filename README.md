# Elm completions for `fish`

## Features

Full completions for `elm-package`, including all available package names. Other commands will likely be added soon enough.

An example journey:

```fish
> elm-pa[TAB] # elm-package
> elm-package i[TAB] # elm-package install
> elm-package install ev[TAB] # elm-package install evancz/
> elm-package install evancz/[TAB] 
[suggestions] evancz/elm-graphics evancz/elm-markdown ...
```

![](elm-package-complete.gif)

## Installation

You need `curl` installed for the interactive package completions.

Install by copying or cloning the files under the directory `~/.config/fish/completions/` on your computer. You can may create it if it doesn't exist yet.
