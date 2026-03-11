#!/bin/bash
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG="$DIR/aerospace.toml"

PROFILE="${1:-}"
if [ -z "$PROFILE" ]; then
    MONITOR_COUNT=$(aerospace list-monitors 2>/dev/null | wc -l | tr -d ' ')
    if [ "$MONITOR_COUNT" -le 2 ]; then
        PROFILE="home"
    else
        PROFILE="office"
    fi
fi

MONITORS_FILE="$DIR/profiles/$PROFILE/monitors.toml"
BINDINGS_FILE="$DIR/profiles/$PROFILE/workspace-bindings.toml"

if [ ! -f "$MONITORS_FILE" ] || [ ! -f "$BINDINGS_FILE" ]; then
    echo "error: profile '$PROFILE' not found in $DIR/profiles/" >&2
    exit 1
fi

GENERATED=$(awk \
    -v monitors_file="$MONITORS_FILE" \
    -v bindings_file="$BINDINGS_FILE" \
    '
    /^# @MONITORS@$/ { while ((getline line < monitors_file) > 0) print line; next }
    /^# @WORKSPACE_BINDINGS@$/ { while ((getline line < bindings_file) > 0) print line; next }
    { print }
    ' "$DIR/aerospace-base.toml")

if [ -f "$CONFIG" ] && [ "$(cat "$CONFIG")" = "$GENERATED" ]; then
    exit 0
fi

printf '%s\n' "$GENERATED" > "$CONFIG"
aerospace reload-config 2>/dev/null || true
