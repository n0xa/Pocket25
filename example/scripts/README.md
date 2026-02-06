# Build Scripts

## Release Workflows

### GitHub Actions (Recommended for Distribution)

#### Nightly Builds
Automated builds run daily at 4:00 AM UTC and create a pre-release:
- **Version format**: `1.0.0-nightly.20260206+13`
- **Tag format**: `nightly-20260206`
- **Retention**: Last 7 nightly builds are kept
- **Manual trigger**: Go to Actions tab → Nightly Build → Run workflow

#### Stable Releases
Create a version tag to trigger an official release build:

```bash
./scripts/create_release.sh
```

This will:
1. Prompt for the new version (e.g., `1.0.1`)
2. Update `pubspec.yaml`
3. Create and push a `v1.0.1` tag
4. GitHub Actions builds and publishes the release automatically

### Local Development Builds

#### build_release.sh
Local build script for testing (not for distribution):
1. Auto-increments the build number
2. Builds the release APK
3. Shows build info
4. Optionally installs on connected device

Usage:
```bash
./scripts/build_release.sh
```

#### bump_version.sh
Manually increment just the build number:

Usage:
```bash
./scripts/bump_version.sh
```

## Version Format

### Stable Releases
Format: `MAJOR.MINOR.PATCH+BUILD_NUMBER`

- **MAJOR**: Major changes/breaking changes
- **MINOR**: New features
- **PATCH**: Bug fixes
- **BUILD_NUMBER**: Auto-incremented

Example: `1.0.0+13`

### Nightly Builds
Format: `MAJOR.MINOR.PATCH-nightly.YYYYMMDD+BUILD_NUMBER`

Example: `1.0.0-nightly.20260206+13`

## Workflow Summary

**For daily development:**
- Commit changes normally
- Nightlies build automatically

**For stable releases:**
1. Run `./scripts/create_release.sh`
2. Enter version number (e.g., `1.0.1`)
3. GitHub Actions handles the rest

**For local testing:**
- Use `./scripts/build_release.sh`
