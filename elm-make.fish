function __fish_elm_space_or_hyphen_make
    set cmd (commandline -opc)

    [ "$cmd[1]" =  'elm-make' ]; or [ "$cmd[1..2]" =  'elm make' ]; and return 0

    return 1
end

complete -c elm -c elm-make -n '__fish_elm_space_or_hyphen_make' -l output -d 'Write result to the given .html or .js FILE.'
complete -fc elm -c elm-make -n '__fish_elm_space_or_hyphen_make' -l report -a json -d 'Format of error and warning reports (e.g. --report=json)'
complete -c elm -c elm-make -n '__fish_elm_space_or_hyphen_make' -l docs -a docs.json -d 'Write documentation to FILE as JSON.'
complete -fc elm -c elm-make -n '__fish_elm_space_or_hyphen_make' -l yes -d "Reply 'yes' to all automated prompts."
complete -c elm -c elm-make -n '__fish_elm_space_or_hyphen_make' -l debug -d 'Generate programs in debug mode.'
complete -c elm -c elm-make -n '__fish_elm_space_or_hyphen_make' -l warn -d 'Report warnings to improve code quality.'
complete -fc elm -c elm-make -n '__fish_elm_space_or_hyphen_make' -s h -l help -d 'Display help message'
