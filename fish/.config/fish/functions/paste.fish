# Defined in - @ line 1
function paste --wraps='win32yank.exe -o --lf' --description 'alias paste win32yank.exe -o --lf'
    win32yank.exe -o --lf $argv
end
