#!/usr/bin/env bash
set -xeuo pipefail

BRANCH=main
FILE_PATH='HOGE'
FROM='fromtext'
TO='totext'

OLDEST_COMMIT_ID="$(git log --diff-filter=A --format=%H --reverse -- "$FILE_PATH" | head -n 1)"

set +e
BOUNDARY_ID="$(git rev-parse "${OLDEST_COMMIT_ID}^")"
GRV_CODE=$?
set -e

if [[ "$GRV_CODE" -eq 0 ]]; then
  REFS=(--refs "${BOUNDARY_ID}..${BRANCH}")
else
  REFS=()
fi

RULES="$(mktemp)"
printf 'literal:%s==>%s\n' "$FROM" "$TO" > "$RULES"

git filter-repo --force \
  "${REFS[@]}" \
  --replace-text "$RULES" \
  --file-info-callback "\
if filename != b'${FILE_PATH}':
  return (filename, mode, blob_id)

contents = value.get_contents_by_identifier(blob_id)
if value.is_binary(contents):
  return (filename, mode, blob_id)

new_contents = value.apply_replace_text(contents)
if new_contents == contents:
  return (filename, mode, blob_id)

new_blob_id = value.insert_file_with_contents(new_contents)
return (filename, mode, new_blob_id)
"

rm -f "$RULES"
