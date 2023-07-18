function delta_side_by_side --on-signal WINCH
    set -x COLUMNS $COLUMNS

    if test "$COLUMNS" -ge 180; and ! contains side-by-side "$DELTA_FEATURES"
        set --global --export --append DELTA_FEATURES side-by-side
    else if test "$COLUMNS" -lt 180; and contains side-by-side "$DELTA_FEATURES"
        set --erase DELTA_FEATURES[(contains --index side-by-side "$DELTA_FEATURES")]
    end
end
