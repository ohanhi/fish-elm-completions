function __fish_elm_package_needs_command
    set cmd (commandline -opc)

    [ "$cmd" = 'elm-package' ]; or [ "$cmd" = 'elm package' ]; and return 0
    return 1
end

function __fish_elm_package_using_command
    set cmd (commandline -opc)

    [ "$cmd[1..2]" = "elm-package $argv[1]" ]; and return 0
    [ "$cmd[1..3]" = "elm package $argv[1]" ]; and return 0

    return 1
end


function __fish_elm_package_all_packages
    # If $XDG_CACHE_HOME is set, use that directory to save packages cache, otherwise use ~/.cache
    set -q XDG_CACHE_HOME
    and set __fish_elm_package_list_path $XDG_CACHE_HOME/elm-packages.txt
    or set __fish_elm_package_list_path ~/.cache/elm-packages.txt
    mkdir -p (dirname $__fish_elm_package_list_path)

    # Based on https://github.com/eeue56/elm-bash-completion/
    set _week_in_secs 604800
    set _current_time (date +%s)

    set _package_list_time 0
    find $__fish_elm_package_list_path 2>/dev/null
    and set _package_list_time (date -r $__fish_elm_package_list_path +%s)

    if math "$_current_time > $_package_list_time + $_week_in_secs"
        curl 'http://package.elm-lang.org/new-packages' -sS | tr -d ' []",' >$__fish_elm_package_list_path
    end

    # The pipe to tr is for backward-compatibility with older elm-packages.txt
    cat $__fish_elm_package_list_path | tr ' ' '\n'
end

# Install
complete -fc elm -c elm-package -n '__fish_elm_package_needs_command' -a 'install' -d 'Install packages to use locally'
complete -fc elm -c elm-package -n "__fish_elm_package_using_command install" -s y -l yes -d "Reply 'yes' to all automated prompts."
complete -fc elm -c elm-package -n "__fish_elm_package_using_command install" -s h -l help -d "Show this help text"
complete -fc elm -c elm-package -n "__fish_elm_package_using_command install" -a '(__fish_elm_package_all_packages)'

# Publish
complete -fc elm -c elm-package -n '__fish_elm_package_needs_command' -a 'publish' -d 'Publish your package to the central catalog'
complete -fc elm -c elm-package -n "__fish_elm_package_needs_command publish" -s h -l help -d "Show this help text"

# Bump
complete -fc elm -c elm-package -n '__fish_elm_package_needs_command' -a 'bump' -d 'Bump version numbers based on API changes'
complete -fc elm -c elm-package -n "__fish_elm_package_needs_command bump" -s h -l help -d "Show this help text"

# Diff
complete -fc elm -c elm-package -n '__fish_elm_package_needs_command' -a 'diff' -d 'Get differences between two APIs'
complete -fc elm -c elm-package -n "__fish_elm_package_needs_command diff" -s h -l help -d "Show this help text"
