function set_theme --description "Set ansi theme"
    set -U fish_greeting
    set -U fish_key_bindings            fish_hybrid_key_bindings
    set -U fzf_fish_custom_keybindings

    set -U fish_cursor_default          block
    set -U fish_cursor_insert           line
    set -U fish_cursor_replace_one      underscore
    set -U fish_cursor_visual           block

    set -U fish_color_autosuggestion    white
    set -U fish_color_cancel            brblack
    set -U fish_color_command           blue
    set -U fish_color_comment           brblack
    set -U fish_color_cwd               brred
    set -U fish_color_cwd_root          red
    set -U fish_color_end               white
    set -U fish_color_error             brred
    set -U fish_color_escape            brcyan
    set -U fish_color_history_current   brcyan
    set -U fish_color_host              brgreen
    set -U fish_color_match             brcyan --underline
    set -U fish_color_normal            white
    set -U fish_color_operator          brmagenta
    set -U fish_color_param             brcyan
    set -U fish_color_quote             brgreen
    set -U fish_color_redirection       brcyan
    set -U fish_color_search_match      --background=blue
    set -U fish_color_selection         --background=brblack
    set -U fish_color_status            red
    set -U fish_color_user              brblue
    set -U fish_color_valid_path        brblue --underline
    set -U fish_pager_color_completion  white
    set -U fish_pager_color_description white
    set -U fish_pager_color_prefix      brgreen
    set -U fish_pager_color_progress    yellow

    set -Ux LS_COLORS                   (vivid generate tokyonight)
end
