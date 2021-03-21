#!/bin/ash

if [ -z "${USER_UID}" -o -z "${USER_GID}" ]; then
    echo "Getting UID and GID from current directory"
    CURRENT_DIR=$(ls -lnd .)
    USER_UID=$(echo "${CURRENT_DIR}" | cut -f3 -d' ')
    USER_GID=$(echo "${CURRENT_DIR}" | cut -f4 -d' ')
fi

if [ "${USER_UID}" -ne 0 ]; then
    
    adduser \
    --disabled-password \
    --gecos "" \
    --home "/home/user" \
    --uid "${USER_UID}" \
    user
fi

echo "Getting UID and GID from current directory"

echo "Using UID ${USER_UID} and GID ${USER_GID} for execution"

echo "Executing $@"

if [ "${USER_UID}" -ne 0 ]; then
    sudo --user user --preserve-env --set-home -- "$@"
else
    exec "$@"
fi
