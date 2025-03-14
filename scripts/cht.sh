#!/usr/bin/env bash

languages=`echo "typescript nodejs rust python" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "query: " query

echo $selected

if printf "$languages" | grep -qs $selected; then
  tmux neww -n "$selected: $query" bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
else
  tmux neww -n $selected bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
