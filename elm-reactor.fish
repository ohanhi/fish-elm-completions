function __fish_elm_space_or_hyphen_reactor
    set cmd (commandline -opc)

    [ "$cmd[1]" =  'elm-reactor' ]; or [ "$cmd[1..2]" =  'elm reactor' ]; and return 0

    return 1
end


complete -fc elm -c elm-reactor -n '__fish_elm_space_or_hyphen_reactor' -s a -l address -a 0.0.0.0 -d 'set the address of the server'
complete -fc elm -c elm-reactor -n '__fish_elm_space_or_hyphen_reactor' -s p -l port -a 8000 -d 'set the port of the reactor'
complete -fc elm -c elm-reactor -n '__fish_elm_space_or_hyphen_reactor' -s h -l help -d 'Display help message'
complete -fc elm -c elm-reactor -n '__fish_elm_space_or_hyphen_reactor' -s v -l version -d 'Print version information'
complete -fc elm -c elm-reactor -n '__fish_elm_space_or_hyphen_reactor' -l 'numeric-version' -d 'Print just the version number'
