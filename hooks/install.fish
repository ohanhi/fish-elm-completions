#!/usr/local/bin/fish
begin
  set fish_completions_dir ~/.config/fish/completions
  set elm_tools 'make' 'package' 'reactor' 'repl' 'test'

  function verify_completions_dir
    if test -d $fish_completions_dir
      echo "=> Using existing completions dir $fish_completions_dir..."
    else
      echo "=> Creating $fish_completions_dir ..."
      mkdir -p $fish_completions_dir
    end
  end

  function install_elm_completions
    for tool in $elm_tools
      set -l t "elm-$tool.fish"

      echo "=> Installing $t..."
      curl -o "$fish_completions_dir/$t" "https://raw.githubusercontent.com/ohanhi/fish-elm-completions/master/$t"

      print_success_msg "$t completions installed √"
    end

    print_success_msg "=> Installation complete! √"
  end

  function print_success_msg
    set_color green
    echo $argv
    set_color normal
  end

  function main
    if which curl > /dev/null
      verify_completions_dir
      install_elm_completions
    else
      echo "=> Dependency Error: please install curl and then try again."
    end
  end

  main
end
