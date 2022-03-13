function set_nextcloud --description "Set nextcloud related variables"
    if test -z "$NEXTCLOUD_PATH"
        read -p "echo 'NEXTCLOUD_PATH > '" nextcloud_path
        set -Ux NEXTCLOUD_PATH "$HOME/$nextcloud_path"
    end

    set -Ux VIMWIKI_PATH "$NEXTCLOUD_PATH/Documents/Notes"

    set -Ux TODO_DIR "$NEXTCLOUD_PATH/Documents/Todo"
    set -Ux TODO_FILE "$TODO_DIR/todo.txt"
    set -Ux DONE_FILE "$TODO_DIR/done.txt"
    set -Ux REPORT_FILE "$TODO_DIR/report.txt"
end
