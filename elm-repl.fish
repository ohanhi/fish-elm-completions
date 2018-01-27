function __fish_elm_space_or_hyphen_repl
    set cmd (commandline -opc)

    [ "$cmd[1]" =  'elm-repl' ]; or [ "$cmd[1..2]" =  'elm repl' ]; and return 0

    return 1
end

complete -fc elm -c elm-repl -n '__fish_elm_space_or_hyphen_repl' -s c -l compiler -a FILE -d 'Provide a path to a specific version of elm-make.'
complete -fc elm -c elm-repl -n '__fish_elm_space_or_hyphen_repl' -s i -l interpreter -a node -d 'Provide a path to a specific JavaScript interpreter'
complete -fc elm -c elm-repl -n '__fish_elm_space_or_hyphen_repl' -s h -l help -d 'Display help message'
complete -fc elm -c elm-repl -n '__fish_elm_space_or_hyphen_repl' -s v -l version -d 'Print version information'
complete -fc elm -c elm-repl -n '__fish_elm_space_or_hyphen_repl' -l 'numeric-version' -d 'Print just the version number'
