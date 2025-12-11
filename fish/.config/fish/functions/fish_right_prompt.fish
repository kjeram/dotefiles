function fish_right_prompt
  switch $fish_bind_mode
    case default
      set_color red
      echo '<<<'
  end
  set_color normal
end
