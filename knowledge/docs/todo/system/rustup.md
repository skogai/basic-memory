---
title: rustup
type: note
permalink: skogai/todo/system/rustup
---

# Rust Development Environment with Rustup

## Usage

| Task                        | Command                                                 |
| --------------------------- | ------------------------------------------------------- |
| Update Rust                 | `rustup update`                                         |
| Check installed toolchains  | `rustup show`                                           |
| Install specific toolchain  | `rustup install 1.75.0`                                 |
| Use specific toolchain      | `rustup default 1.75.0` or `rustup override set 1.75.0` |
| Add component               | `rustup component add rust-src rustfmt clippy`          |
| List installed components   | `rustup component list --installed`                     |
| Check Rust version          | `rustc --version`                                       |
| Check dependency tree       | `cargo tree`                                            |
| Clean build artifacts       | `cargo clean`                                           |
| Build with feature flags    | `cargo build --features "feature1 feature2"`            |
| Override dependency version | `cargo update -p crate_name --precise 1.2.3`            |

## Current Configuration

- **Rust Version**: 1.86.0
- **Default Toolchain**: stable-x86_64-unknown-linux-gnu
- **Installation Location**: `/home/skogix/.rustup`
- **Cargo Home**: `/home/skogix/.cargo`
- **Installed Components**: cargo, clippy, rust-docs, rust-std, rustc, rustfmt

## Environment Setup

The minimal environment setup needed in `.zshrc` or `.bashrc`:

```bash
# Add cargo binaries to PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Optional: Set custom Cargo directory (if needed)
# export CARGO_HOME="/mnt/extra/rust/cargo"
# export RUSTUP_HOME="/mnt/extra/rust/rustup"
```

## Installation Details

Rustup is typically installed via the official installer script:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

On Arch Linux, both rustup and the regular rust package are available. For more control and to avoid conflicts, it's recommended to use the rustup version:

```bash
# If you have the system rust package installed, remove it first
sudo pacman -R rust

# Install rustup from pacman
sudo pacman -S rustup

# Initialize rustup (this sets up your default toolchain)
rustup default stable
```

## Toolchain Management

Rustup allows managing multiple Rust toolchains side by side:

1. **Install multiple toolchains**:

   ```bash
   rustup install stable
   rustup install nightly
   rustup install 1.75.0  # Specific version
   ```

1. **Set global default**:

   ```bash
   rustup default stable
   ```

1. **Set project-specific override**:

   ```bash
   # While in project directory:
   rustup override set 1.75.0
   ```

1. **Create a rust-toolchain.toml file** in your project:

   ```toml
   [toolchain]
   channel = "1.75.0"
   components = ["rustfmt", "clippy"]
   ```

## Dependency Management

Cargo offers several ways to handle dependency conflicts:

1. **Specify version constraints** in Cargo.toml:

   ```toml
   [dependencies]
   some_crate = "1.2.3"  # Exact version
   other_crate = "^2.0.0"  # Compatible with 2.0.0
   another_crate = ">=1.0.0, <2.0.0"  # Version range
   ```

1. **Patch dependencies** to use specific versions:

   ```toml
   [patch.crates-io]
   problematic_crate = { version = "1.2.3" }
   ```

1. **Override dependency features**:

   ```toml
   [dependencies]
   syntect = { version = "5.0", default-features = false, features = ["parsing", "regex-fancy", "plist-load"] }
   ```

1. **Force dependency resolution** from command line:

   ```bash
   cargo update -p onig_sys --precise 69.7.1
   ```

## Feature Flags

Feature flags allow configuring crates with optional functionality:

1. **Enable features** when adding a dependency:

   ```toml
   [dependencies]
   serde = { version = "1.0", features = ["derive"] }
   ```

1. **Disable default features**:

   ```toml
   [dependencies]
   syntect = { version = "5.0", default-features = false, features = ["parsing"] }
   ```

1. **Enable features during build**:

   ```bash
   cargo build --features "feature1 feature2"
   ```

## Arch Linux Considerations

When using Rust on Arch Linux, be aware of these potential issues:

1. **System libraries vs crate bindings**: Arch often has newer versions of system libraries than what Rust crates expect.

1. **C compiler version**: Newer GCC/Clang versions might emit warnings that older crates don't handle.

1. **Path resolution**: Make sure rustup's binaries are in your PATH:

   ```bash
   which rustc   # Should point to ~/.cargo/bin/rustc, not /usr/bin/rustc
   which cargo   # Should point to ~/.cargo/bin/cargo, not /usr/bin/cargo
   ```

1. **System vs rustup Rust**: Avoid having both installed simultaneously.

## Troubleshooting

Common issues and their solutions:

1. **Build failures with C dependencies**:

   - Ensure you have base-devel installed: `sudo pacman -S base-devel`
   - Check specific development libraries: `sudo pacman -S pkg-config`

1. **Compiler version mismatches**:

   - Verify which rustc you're using: `which rustc`
   - Check if PATH is correctly set: `echo $PATH`

1. **Dependency resolution errors**:

   - Clean and rebuild: `cargo clean && cargo build`
   - Use verbose output to debug: `cargo build -vv`
   - Check dependency tree: `cargo tree -i problematic_crate`

1. **Feature flag conflicts**:

   - Check what features are enabled: `cargo tree -f`
   - Explicitly configure features in Cargo.toml

1. **C bindings failing**: Create a `.cargo/config.toml` file with:

   ```toml
   [build]
   rustflags = ["-Awarnings"]
   ```

## Why This Approach?

Using rustup instead of system packages provides several benefits:

- Ability to use multiple Rust versions side by side
- Easy updates with `rustup update`
- Project-specific toolchain overrides
- Access to nightly features when needed
- Better isolation from system packages
- Simpler cross-compilation setup

## Best Practices

1. **Always use cargo for dependencies** rather than system packages.

1. **Pin version numbers** for production dependencies in Cargo.toml.

1. **Use workspaces** for multi-crate projects to simplify dependency management.

1. **Create a rust-toolchain.toml file** for projects with specific toolchain requirements.

1. **Document feature flag requirements** in your project's README.

1. **Check for dependency vulnerabilities** with `cargo audit`.

1. **Use rustup components** like `clippy` and `rustfmt` for code quality.

1. **Prefer pure Rust dependencies** where possible to avoid C binding issues.

1. **Use cargo-edit** for easier dependency management:

   ```bash
   cargo install cargo-edit
   cargo add some_crate --features feat1,feat2
   cargo rm unused_crate
   ```

1. **Create a .cargo/config.toml** file for project-specific cargo settings.
