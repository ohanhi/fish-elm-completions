# From the npm completions that shipped with fish

function __fish_elm_package_needs_command
    set cmd (commandline -opc)

    if [ (count $cmd) -eq 1 ]
        return 0
    end

    return 1
end

function __fish_elm_package_using_command
    set cmd (commandline -opc)

    if [ (count $cmd) -gt 1 ]
        if [ $argv[1] = $cmd[2] ]
            return 0
        end
    end

    return 1
end


# Install
complete -f -c elm-package -n '__fish_elm_package_needs_command' -a 'install' -d 'Install packages to use locally'
complete -f -c elm-package -n "__fish_elm_package_using_command install" -s y -l yes -d "Reply 'yes' to all automated prompts."
complete -f -c elm-package -n "__fish_elm_package_using_command install" -s h -l help -d "Show this help text"


# If $XDG_CACHE_HOME is set, use that directory to save packages cache, otherwise use ~/.cache
set -q XDG_CACHE_HOME
and set __fish_elm_package_list_path $XDG_CACHE_HOME/elm-packages.txt
or set __fish_elm_package_list_path ~/.cache/elm-packages.txt
mkdir -p (dirname $__fish_elm_package_list_path)

# Based on https://github.com/eeue56/elm-bash-completion/
function __fish_fetch_elm_package_list
    set _week_in_secs 604800
    set _current_time (date +%s)

    find $__fish_elm_package_list_path 2>/dev/null
    and set _package_list_time (date -r $__fish_elm_package_list_path +%s)
    or set _package_list_time 0

    if math "$_current_time > $_package_list_time + $_week_in_secs"
        curl 'http://package.elm-lang.org/new-packages' -sS | tr '\n' ' ' | sed -E 's/\s//g' | sed -E 's/"//g' | sed -E 's/,/ /g' | sed -E 's/\[//' | sed -E 's/]//' >$__fish_elm_package_list_path
    end
end

__fish_fetch_elm_package_list
set __fish_elm_package_packages (cat $__fish_elm_package_list_path)

for package in $__fish_elm_package_packages
    echo $package
    complete -f -c elm-package -n "__fish_elm_package_using_command install" -a "$package"
end

# Publish
complete -f -c elm-package -n '__fish_elm_package_needs_command' -a 'publish' -d 'Publish your package to the central catalog'
complete -f -c elm-package -n "__fish_elm_package_needs_command publish" -s h -l help -d "Show this help text"

# Bump
complete -f -c elm-package -n '__fish_elm_package_needs_command' -a 'bump' -d 'Bump version numbers based on API changes'
complete -f -c elm-package -n "__fish_elm_package_needs_command bump" -s h -l help -d "Show this help text"

# Diff
complete -f -c elm-package -n '__fish_elm_package_needs_command' -a 'diff' -d 'Get differences between two APIs'
complete -f -c elm-package -n "__fish_elm_package_needs_command diff" -s h -l help -d "Show this help text"
