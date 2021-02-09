function set_theme --description "Set onedark theme"
    set -Ux LS_COLORS (vivid generate one-dark)
    set_onedark
    end
