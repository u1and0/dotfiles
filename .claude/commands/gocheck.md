Run Go checks on the current project.

Execute in order:
1. goimports -l ./... (list files needing import fixes)
2. go vet ./...
3. go build ./...

Report results concisely. Fix any issues found.
