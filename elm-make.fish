complete -f -c elm-make -l output -a FILE -d 'Write result to the given .html or .js FILE.'
complete -f -c elm-make -l report -a json -d 'Format of error and warning reports (e.g. --report=json)'
complete -f -c elm-make -l docs -a docs.json -d 'Write documentation to FILE as JSON.'
complete -f -c elm-make -l yes -d "Reply 'yes' to all automated prompts."
complete -f -c elm-make -l debug -d 'Generate programs in debug mode.'
complete -f -c elm-make -l warn -d 'Report warnings to improve code quality.'
complete -f -c elm-make -s h -l help -d 'Display help message'
