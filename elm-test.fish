function __fish_elm_space_or_hyphen_test_and_not_init
    set cmd (commandline -opc)

    [ "$cmd[1]" =  'elm-test' ]; and [ "$cmd[1..2]" !=  'elm-test init' ]; and return 0
    [ "$cmd[1..2]" =  'elm test' ]; and [ "$cmd[1..3]" !=  'elm test init' ]; and return 0

    return 1
end

function __fish_elm_test_needs_command
    set cmd (commandline -opc)

    [ (count $cmd) -eq 1 ]; and [ "$cmd[1]" = 'elm-test' ]; and return 0
    [ (count $cmd) -eq 2 ]; and [ "$cmd[1..2]" = 'elm test' ]; and return 0

    return 1
end

function __fish_elm_test_using_command
    set cmd (commandline -opc)

    [ "$cmd[1..2]" = "elm-test $argv[1]" ]; and return 0
    [ "$cmd[1..3]" = "elm test $argv[1]" ]; and return 0

    return 1
end

complete -c elm -c elm-test -n '__fish_elm_space_or_hyphen_test_and_not_init' -l compiler -d 'Specify path to compiler'
complete -fc elm -c elm-test -n '__fish_elm_space_or_hyphen_test_and_not_init' -l seed -d 'Run with initial fuzzer seed (an integer)'
complete -fc elm -c elm-test -n '__fish_elm_space_or_hyphen_test_and_not_init' -l fuzz -a '(seq 1 50)' -d 'Run with each fuzz test performing this many interations'
complete -c elm -c elm-test -n '__fish_elm_space_or_hyphen_test_and_not_init' -l add-dependencies -d 'Add missing dependencies from current elm-package.json to destination'
complete -fc elm -c elm-test -n '__fish_elm_space_or_hyphen_test_and_not_init' -l report -a 'json junit console' -d 'Print results to stdout in given format (default: console)'
complete -c elm -c elm-test -n '__fish_elm_space_or_hyphen_test_and_not_init' -l version -d 'Print version string and exit'
complete -c elm -c elm-test -n '__fish_elm_space_or_hyphen_test_and_not_init' -s h -l help -d 'Print elm-test usage'
complete -c elm -c elm-test -n '__fish_elm_space_or_hyphen_test_and_not_init' -l watch -d 'Run tests on file changes'
complete -fc elm -c elm-test -n '__fish_elm_test_needs_command' -a init -d 'Create example tests'
complete -fc elm -c elm-test -n '__fish_elm_test_using_command init' -l yes -d "Reply 'yes' to all automated prompts."
