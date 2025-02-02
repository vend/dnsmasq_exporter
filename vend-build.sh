#!/usr/bin/env bash
set -euxo pipefail
rm -rvf -- ./build
mkdir -p build
for os in linux darwin
do
  for arch in amd64 arm64
  do
    CGO_ENABLED=0 GOOS="$os" GOARCH="$arch" \
      go build -o "build/dnsmasq_exporter_${os}_${arch}"
  done
done
pushd build
sha256sum dnsmasq_exporter* > sha256sums.txt
gpg --clear-sign --output sha256sums.txt.asc sha256sums.txt


