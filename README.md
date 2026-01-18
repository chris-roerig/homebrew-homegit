# Homebrew Tap for homegit

This is the Homebrew tap for [homegit](https://github.com/chris-roerig/homegit) - your personal Git server.

## Installation

```bash
brew install chris-roerig/homegit/homegit
```

Or tap first:

```bash
brew tap chris-roerig/homegit
brew install homegit
```

## Usage

```bash
# Start the server
homegit start

# Check status
homegit status

# Get help
homegit help
```

## Running as a Service

```bash
# Start service
brew services start homegit

# Stop service
brew services stop homegit

# Restart service
brew services restart homegit
```

## Documentation

See the [main repository](https://github.com/chris-roerig/homegit) for full documentation.

## Updating the Formula

After releasing a new version:

1. Get the SHA256 of the new release:
   ```bash
   curl -sL https://github.com/chris-roerig/homegit/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256
   ```

2. Update `Formula/homegit.rb`:
   - Change `url` to new version
   - Update `sha256` with new hash

3. Commit and push:
   ```bash
   git add Formula/homegit.rb
   git commit -m "Update homegit to vX.Y.Z"
   git push
   ```

## License

MIT
