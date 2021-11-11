#!/bin/bash

# determine the level of bumping (major, minor, patch)
bump_level=$1

# extract the old version
old_version=$(grep VERSION src/woodland.h | cut -d ' ' -f 3 | tr -d '"')

# split old version by decimals
OIFS=$IFS
IFS='.'
read -a decimals <<< "$old_version"
major=${decimals[0]}
minor=${decimals[1]}
patch=${decimals[2]}

case $bump_level in
    major)
        major="$(($major + 1))"
        minor=0
        patch=0
    ;;
    minor)
        major=$major
        minor="$(($minor + 1))"
        patch=0
    ;;
    patch)
        major=$major
        minor=$minor
        patch="$(($patch + 1))"
    ;;
esac

# restore IFS otherwise troubles
IFS=$OFIS

# create new version
new_version="$major.$minor.$patch"

# bump the patch of our current version
sed "s/$old_version/$new_version/" src/woodland.h

# todo: the following is to be evaluated

echo "git add -A"
echo "git commit -m 'cut $bump_level release -> v${new_version}'"
echo "git tag -a v${new_version}"
echo "git push --tags"
