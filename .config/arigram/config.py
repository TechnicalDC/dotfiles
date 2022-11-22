import os

PHONE = ""

NOTIFY_CMD = "notify-send -a {title} {subtitle} {msg} -i {icon_path}"

VIEW_TEXT_CMD = "less"

FZF = "fzf"
USERS_COLORS = tuple(range(1, 6))

# TODO: use mailcap instead of editor
LONG_MSG_CMD = "nvim + -c 'startinsert' {file_path}"
EDITOR = os.environ.get("EDITOR", "nvim")

COPY_CMD = "xclip -selection c"

FILE_PICKER_CMD = "ranger --choosefile={file_path}"

DOWNLOAD_DIR = os.path.expanduser("~/Downloads/TG")
URL_VIEW = "urlview"

CHAT_FLAGS = {
    "online" : "",
    "pinned" : "車",
    "muted" : "",
    "unread" : "",
    "unseen" : "",
    "seen" : "",
    "secret" : ""
}

MSG_FLAGS = {
    "forwaded" : "",
    "selected" : "",
    "new" : "",
    "unseen" : "",
    "seen" : "",
    "edited" : "פֿ",
    "failed" : "",
    "pending" : "勒"
}
