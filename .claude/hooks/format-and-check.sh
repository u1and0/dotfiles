#!/bin/bash
FILE=$(cat | jq -r '.tool_input.file_path // empty')
[ -z "$FILE" ] || [ ! -f "$FILE" ] && exit 0

case "$FILE" in
    *.go)
        goimports -w "$FILE" 2>/dev/null
        gofmt -w "$FILE" 2>/dev/null
        go vet "./$(dirname "FILE")/..." 2>&1 || true
        ;;
    *.ts|*.tsx|*.js)
        deno fmt "$FILE" 2>/dev/null
        deno lint "$FILE" 2>&1 | head -20 || true
        ;;
esac

exit 0
