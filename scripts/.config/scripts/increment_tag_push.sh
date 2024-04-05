#!/usr/bin/env bash

set -e

echo "Pulling latest changes from origin..."
git pull

latest_tag=$(git tag -l | sort -V | tail -n 1 2>/dev/null)

# If there are no tags yet, start with 0.0.1
if [ -z "$latest_tag" ]; then
    new_tag="0.0.1"
else
    IFS='.' read -r -a version_parts <<< "$latest_tag"
    major="${version_parts[0]}"
    minor="${version_parts[1]}"
    patch="${version_parts[2]}"

    new_patch=$((patch + 1))
    new_tag="$major.$minor.$new_patch"
fi

echo "Latest tag: $latest_tag"
echo "New tag: $new_tag"

# If none interactive juse confirm. What could possibly go wrong...
read -p "Do you want to create and push tag $new_tag? (y/n): " confirm || confirm=y
if [[ $confirm =~ ^[Yy]$ ]]; then
    git tag "$new_tag"
    git push --tags

    echo "Tag $new_tag created and pushed."
else
    echo "Tag creation canceled."
fi
