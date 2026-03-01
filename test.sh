git fetch origin

    UPSTREAM=${1:-'@{u}'}
    LOCAL=$(git rev-parse @)
    REMOTE=$(git rev-parse "$UPSTREAM")
    BASE=$(git merge-base @ "$UPSTREAM")

    if [ $LOCAL = $REMOTE ]; then
        printf '{"text": ""}\n'
    elif [ $LOCAL = $BASE ]; then
        printf '{"text": "󰚰", "tooltip": "There are updates available"}\n'
    elif [ $REMOTE = $BASE ]; then
        printf '{"text": "󰕒", "tooltip": "Your config is ahead of the repo"}\n'
    else
        printf '{"text": "", "tooltip": "You have not pushed to the Repo", "class": "needs-attention"}\n'
    fi