#!/bin/bash
# Script to create and push a release tag
# This will trigger the GitHub Actions release workflow

cd "$(dirname "$0")/.."

echo "=== Pocket25 Release Tagger ==="
echo ""

# Get current version
CURRENT_VERSION=$(grep "^version:" pubspec.yaml | sed 's/version: //')
echo "Current version in pubspec.yaml: $CURRENT_VERSION"
echo ""

# Ask for new version
read -p "Enter release version (e.g., 1.0.1): " NEW_VERSION

if [ -z "$NEW_VERSION" ]; then
    echo "Error: Version cannot be empty"
    exit 1
fi

# Confirm
echo ""
echo "This will:"
echo "  1. Update pubspec.yaml to version $NEW_VERSION+1"
echo "  2. Commit the change"
echo "  3. Create and push tag v$NEW_VERSION"
echo "  4. Trigger GitHub Actions to build and create a release"
echo ""
read -p "Continue? (y/n) " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted"
    exit 0
fi

# Update pubspec.yaml
echo ""
echo "Updating pubspec.yaml..."
sed -i "s/^version:.*$/version: ${NEW_VERSION}+1/" pubspec.yaml

# Commit
echo "Committing version bump..."
git add pubspec.yaml
git commit -m "Release v${NEW_VERSION}"

# Create and push tag
echo "Creating tag v${NEW_VERSION}..."
git tag -a "v${NEW_VERSION}" -m "Release v${NEW_VERSION}"

echo "Pushing to GitHub..."
git push origin master
git push origin "v${NEW_VERSION}"

echo ""
echo "✓ Done! GitHub Actions will now build the release."
echo "  Check: https://github.com/$(git config --get remote.origin.url | sed 's/.*github.com[:/]\(.*\)\.git/\1/')/actions"
