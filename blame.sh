#!/bin/sh
git blame --line-porcelain -- $1 | awk '/^author /' | awk '{$1 = ""; author=substr($0, 2); counts[author] += 1} END { for (author in counts) {print counts[author],author,counts[author],counts[author]/NR*100"%"} }' | sort -nr -k 1 | awk '{$1 = ""; print $0}'
