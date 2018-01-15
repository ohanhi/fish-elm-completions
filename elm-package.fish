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
complete -f -c elm-package -n "__fish_elm_package_needs_command install" -s y -l yes -d "Reply 'yes' to all automated prompts."
complete -f -c elm-package -n "__fish_elm_package_needs_command install" -s h -l help -d "Show this help text"

# Based on https://github.com/eeue56/elm-bash-completion/
set __fish_elm_package_packages (curl http://package.elm-lang.org/new-packages -sS | sed -E 's/"//' | sed -E 's/"//' | sed -E 's/\[//' | sed -E 's/]//' | awk '{$1=$1};1' | sed -E 's/,//' | tr '\n' ' ')

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
