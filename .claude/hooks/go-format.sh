#!/bin/bash
FILE=$(cat | jq -r '.tool_input.file_path // empty')
[ -z "$FILE" ] || [ ! -f "$FILE" ] && exit 0
if [[ "$FILE" == *.go ]]; then
    goimports -w "$FILE" 2>/dev/null
    gofmt -w "$FILE" 2>/dev/null
fi
exit 0
