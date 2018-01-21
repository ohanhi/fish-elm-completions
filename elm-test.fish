function __fish_elm_test_needs_command
    set cmd (commandline -opc)

    if [ (count $cmd) -eq 1 ]
        return 0
    end

    return 1
end

function __fish_elm_test_using_command
    set cmd (commandline -opc)

    if [ (count $cmd) -gt 1 ]
        if [ $argv[1] = $cmd[2] ]
            return 0
        end
    end

    return 1
end

complete -f -c elm-test -l compiler -a /path/to/compiler
complete -f -c elm-test -l seed -a integer -d 'Run with initial fuzzer seed'
complete -f -c elm-test -l report -a 'json chalk' -d 'Print results to stdout in given format'
complete -f -c elm-test -l watch -d 'Run tests on file changes'
complete -f -c elm-test -n '__fish_elm_test_needs_command' -a init -d 'Create example tests'
complete -f -c elm-test -n "__fish_elm_test_using_command init" -l yes -d "Reply 'yes' to all automated prompts."
