#!/usr/bin/env bash

[ "$1" == "user" ] && BUILD_USERMODE="--user" || BUILD_USERMODE=""
set -e
cd $(dirname "$0")

flatpak-builder $BUILD_USERMODE \
        --force-clean \
        --install-deps-from=flathub \
        --repo=build/repo \
        build \
        com.obsproject.Studio.Plugin.WaylandHotkeys.yaml
cd ./build
flatpak build-bundle \
        --runtime \
        --runtime-repo=https://flathub.org/repo/flathub.flatpakrepo \
        repo \
        WaylandHotkeys.flatpak \
        com.obsproject.Studio.Plugin.WaylandHotkeys stable
