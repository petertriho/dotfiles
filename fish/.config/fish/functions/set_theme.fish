function set_theme --description "Set onedark theme"
    set -U fish_greeting
    set -U fish_key_bindings fish_hybrid_key_bindings

    set -U fish_cursor_default block
    set -U fish_cursor_insert line
    set -U fish_cursor_replace_one underscore
    set -U fish_cursor_visual block

    set -Ux LS_COLORS (vivid generate one-dark)
    set_onedark
end
