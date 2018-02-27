function __fish_elm_needs_command
    set cmd (commandline -opc)

    if [ (count $cmd) -eq 1 ]
        return 0
    end

    return 1
end

complete -fc elm -n '__fish_elm_needs_command' -a '(string replace -r "^.*/elm-([^/]*)" \'$1\' $PATH/elm-*)'
complete -fc elm -n '__fish_elm_needs_command' -s v -l version -d 'Print version number'
