
if [[ -d ~/Documents ]] && [[ -d ~/nextcloud/Documents ]]; then
    if [[ ! -L ~/Documents/Documents ]]; then
        ln -s ../nextcloud/Documents ~/Documents/Documents
    fi
fi

if [[ -d ~/Pictures ]] && [[ -d ~/nextcloud/Photos ]]; then
    if [[ ! -L ~/Pictures/Photos ]]; then
        ln -s ../nextcloud/Photos ~/Pictures/Photos
    fi
fi