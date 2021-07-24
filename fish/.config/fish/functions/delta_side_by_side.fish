function delta_side_by_side --on-signal WINCH
    if test "$COLUMNS" -ge 120; and ! contains side-by-side "$DELTA_FEATURES"
        set --global --export --append DELTA_FEATURES side-by-side
    else if test "$COLUMNS" -lt 120; and contains side-by-side "$DELTA_FEATURES"
        set --erase DELTA_FEATURES[(contains --index side-by-side "$DELTA_FEATURES")]
    end
end
