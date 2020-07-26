#!/bin/bash

while [[ ${#} -ge 1 ]]; do
    case ${1} in
        "-i"|"--init") INIT=true ;;
        "-t"|"--tag") shift; VERSION=${1} ;;
        "-u"|"--update") UPDATE=true ;;
    esac
    shift
done

REPO="https://github.com/WireGuard/wireguard-linux-compat"
SUBFOLDER="net/wireguard"

if [[ -n ${INIT} ]]; then
    git subtree add --prefix="${SUBFOLDER}" "${REPO}" "${VERSION}"
elif [[ -n ${UPDATE} ]]; then
        GIT_MAJOR_VERSION=$(git --version | head -n 1 | cut -d . -f 1 | awk '{print $3}')
        GIT_MINOR_VERSION=$(git --version | head -n 1 | cut -d . -f 2)
        [[ ${GIT_MAJOR_VERSION} -gt 2 ]] || [[ ${GIT_MAJOR_VERSION} -eq 2 && ${GIT_MINOR_VERSION} -ge 15 ]] && SIGNOFF=true
        git subtree pull --prefix="${SUBFOLDER}" "${REPO}" "${VERSION}"
fi

git commit --amend
