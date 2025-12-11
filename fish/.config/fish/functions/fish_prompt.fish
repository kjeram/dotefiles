function fish_prompt
  set -l last_status $status
  # Prompt status only if it's not 0
  set -l __stat
  if test $last_status -ne 0
      set __stat "C:"(set_color red)"$last_status"
  end

  if not set -q __fish_prompt_hostname
    set __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if test -n "$_OLD_VIRTUAL_PATH"
    set -l __venv_prompt $VIRTUAL_ENV_PROMPT
  else
    set -l __venv_prompt ''
  end

  set -g __fish_git_prompt_show_informative_status 1
  set -g __fish_git_prompt_showcolorhints 1
  set -g __fish_git_prompt_color_branch cyan
  set -g __fish_git_prompt_color_cleanstate green

  set -l __fish_git_prompt_prefix 'on '(set_color blue)'git:'(set_color cyan)'%s '

  echo -se '\n' \
  (set_color blue) '# ' \
  (set_color cyan) $USER \
  (set_color white) ' @ ' \
  (set_color green) $__fish_prompt_hostname \
  (set_color white) ' in ' \
  (set_color -o yellow) (string replace $HOME '~' (pwd)) ' ' \
  (set_color green) $__venv_prompt \
  (set_color white) (__fish_git_prompt $__fish_git_prompt_prefix) \
  (set_color white) '['(date +%H:%M:%S)'] ' \
  (set_color white) $__stat \
  (set_color -o red) '\n$ '
end
