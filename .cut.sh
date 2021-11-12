#!/bin/bash

read -p "Are you sure you want to make a cut? [y/n] " answer
if [ $answer != "y" ]; then
    echo "quiting."
    exit 0
fi

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
sed -i "" "s/$old_version/$new_version/" src/woodland.h

# handle git ops
#git add -A
#git commit -m "cut $bump_level release -> v${new_version}"
#git tag -a v$new_version
#git push --tags
