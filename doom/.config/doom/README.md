# Doom Config
This is my config for my Doom Emacs.
It will be updated over time as I continue to add to my configuration.


## FONTS
This uses the Fira Code font a long side the `fira-code-mode` package, as it enables font ligatures.
I also use Ubuntu font as the variable pitch font.

## Packages

### BLAMER
I use blamer to see line blame, so I can see whenever the last change to line was made.

### LSP
I have set some custom configuration on LSP.
Doom Emacs default turns off docs whenever you are writing code, so for this I have turned it on.
I also show modeline diagnostics, and headline breadcrumbs.

LSP lens and completion is also turned on, but can be switched off by using `nil` instead of `t`.

### WAKATIME CONFIG
There is a different solution using the `pass` package to handle this. This is the safer way, as it will be stored within a `.gpg` file.

Otherwise if you don't do this manually you can `M-x wakatime-prompt-api-key` and it will create the file for you with the API key. 

This is the recommended way from my side, if you don't know how to setup a password store. 

Just remember to add the `custom.el` to the .gitignore if you are saving this in a repository. As you do not want to store plain text API keys in your git repository.

I do not recommend doing this as it might break the usage of the `custom.el` file.
In the `custom.el` make sure there is a `custom-set-variables`.
In this add the line `'(wakatime-api-key "<WAKATIME API KEY HERE>")`.
Example of how it can look:

``` emacs-lisp
(custom-set-variables
'(wakatime-api-key "<WAKATIME API <KEY>"))
```

### DOOM MODELINE CONFIG
This section is just turning on a few things I wanted to have shown in my modeline.
This might be removed totally in the case that I can't get it to work.

### MAGIT CONFIG
This section can be ignored as this is turned on by default.

### PROJECTILE CONFIG
This section is where I set Projectile to look for where my projects are stored.

If you want to add to this line simply do this, this will add more paths for Projectile to search in:

``` emacs-lisp
(setq projectile-project-search-path '("~/Projects" "<new path here>"))
```
If you however just want to specify a different path than `~/Projects` then change this to the full path of the projects folder location you use.


### EMACS CONFIG
I have set this to add a newline whenever you are saving a file.
This can be either:

`(setq require-final-newline t)` or `(setq mode-require-final-newline t)`

The other one is just for mode specific and the other one is more global.

### LIGATURES CONFIG
This uses the `fira-code-mode` package to handle my ligatures.
I have set up some custom ligatures that it should ignore.
This is default besides the `":"`, as I experienced getting a different character instead of the normal colon.
