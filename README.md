# Omarchy

Omarchy is a beautiful, fun & agentic Linux distribution by DHH.

Read more at [omarchy.org](https://omarchy.org).

---

## Distro-Agnostic Port Notes (`@antonbenosapro` Fork)

Upstream Omarchy was originally designed as a monolithic desktop shell tailored specifically for Arch Linux (`pacman`, `yay`, and Arch filesystem paths). This fork introduces a modular, distro-agnostic portability layer developed and tested on **Debian GNU/Linux Trixie (13)** with dual-monitor **Hyprland**, while retaining full compatibility with Arch and opening up deployment across other distributions.

### Key Architectural Porting Enhancements

1. **Modular Package Management Abstraction (`omarchy-pkg-*`)**:
   - Replaced hardcoded `pacman` and `yay` commands with dynamic OS detection.
   - Native support for **Debian GNU/Linux** (`dpkg-query`, `apt-get`), **Arch Linux** (`pacman`, `yay`), and universal **Flatpak** applications.
   - Easily extensible to RPM-based distributions (e.g. Fedora with `dnf` or openSUSE with `zypper`) by extending the `omarchy-pkg-*` shims.
   - Application uninstaller (`omarchy-remove-launcher-entry`) ported to execute `sudo apt-get remove --purge`, `flatpak uninstall`, and user desktop entry removal.

2. **Decoupled Session & Compositor Lifecycle**:
   - Removed hardcoded reliance on Arch's `uwsm` session wrapper.
   - Session logout cleanly falls back to native Hyprland IPC (`hyprctl dispatch exit`).
   - Screen lock delegates directly to native Debian PAM `hyprlock`.
   - Shell execution managed via `systemd-run --user --unit=active-desktop-shell` with automatic recovery and environment variable propagation.

3. **Native Hyprland Multi-Monitor & DDC/CI Controls**:
   - Replaced non-portable Lua monitor evaluation scripts with direct `hyprctl keyword monitor` dispatches.
   - Adjacent monitor coordinates automatically recalculate on scaling or mode changes to eliminate gaps and overlaps across multi-monitor setups.
   - Hardware DDC/CI external monitor brightness controls via `/dev/i2c` and `ddcutil`.

4. **Standard FreeDesktop & XDG Compliance**:
   - Application launcher indexes standard XDG directories (`/usr/share/applications` and `~/.local/share/applications`) with robust `.desktop` ID suffix normalization.
   - Automated KDE Plasma internal module filtering in `AppLibrary.qml`, with support for user custom blacklist (`~/.config/omarchy/launcher.hides`) and whitelist (`~/.config/omarchy/launcher.whitelist`).
   - Standard icon theme (`Papirus-Dark`) and font rendering (`JetBrainsMono Nerd Font` and `Noto Sans`).

5. **Tiling Window Manager Dock Visibility**:
   - Added `alwaysShow` support to `Dock.qml` and `DockWindow.qml` so pinned apps and dock stay visible and functional across tiling workspaces instead of staying hidden on `dwindle` layouts.

### Prerequisites for Any Distro

To run this shell on any Linux distribution:
* **Compositor**: [Hyprland](https://hyprland.org) (Wayland).
* **Shell Runtime**: [Quickshell](https://quickshell.outfoxxed.me) (can be built natively or installed via universal Nix package manager on any distro).
* **Core Subsystems**: PipeWire / WirePlumber (audio), NetworkManager (networking), and standard FreeDesktop portals.

---

## The Omarchy Manual

The manual lives in [`manual/`](manual/), which is its authoritative source.

- [Welcome to Omarchy!](manual/01-welcome-to-omarchy.md)

**The Basics**

- [Getting Started](manual/02-getting-started.md)
- [Coming From Mac or Windows](manual/03-coming-from-mac-or-windows.md)
- [Navigation](manual/04-navigation.md)
- [The top bar](manual/05-the-top-bar.md)
- [Themes](manual/06-themes.md)
- [Hotkeys](manual/07-hotkeys.md)
- [Unified Clipboard & History](manual/08-unified-clipboard-history.md)
- [Reminders](manual/09-reminders.md)
- [Notices](manual/10-notices.md)
- [Text Extraction & Dictation](manual/11-text-extraction-dictation.md)
- [Screenshots & Recording](manual/12-screenshots-recording.md)
- [Toggles, idle & screensaver](manual/13-toggles-idle-screensaver.md)
- [Omarchy CLI](manual/14-omarchy-cli.md)

**The Applications**

- [Terminal](manual/15-terminal.md)
- [Neovim](manual/16-neovim.md)
- [AI](manual/17-ai.md)
- [Development Tools](manual/18-development-tools.md)
- [Shell Tools](manual/19-shell-tools.md)
- [Shell Functions](manual/20-shell-functions.md)
- [TUIs](manual/21-tuis.md)
- [GUIs](manual/22-guis.md)
- [Browsers](manual/23-browsers.md)
- [Commercial apps/services](manual/24-commercial-apps-services.md)
- [Web Apps](manual/25-web-apps.md)
- [Gaming](manual/26-gaming.md)
- [Filling out PDFs](manual/27-filling-out-pdfs.md)
- [Windows VM](manual/28-windows-vm.md)
- [Other Packages](manual/29-other-packages.md)

**Configuration**

- [Updates](manual/30-updates.md)
- [Dotfiles](manual/31-dotfiles.md)
- [Shell plugins](manual/32-shell-plugins.md)
- [Monitors](manual/33-monitors.md)
- [Keyboard, Mouse, Trackpad](manual/34-keyboard-mouse-trackpad.md)
- [Networking](manual/35-networking.md)
- [System sleep](manual/36-system-sleep.md)
- [Hardware authentication](manual/37-hardware-authentication.md)
- [Fonts](manual/38-fonts.md)
- [Backgrounds](manual/39-backgrounds.md)
- [Prompt](manual/40-prompt.md)
- [Branding](manual/41-branding.md)
- [Common tweaks](manual/42-common-tweaks.md)
- [Making your own theme](manual/43-making-your-own-theme.md)

**The Rest**

- [Mac support](manual/44-mac-support.md)
- [Troubleshooting](manual/45-troubleshooting.md)
- [FAQ](manual/46-faq.md)
- [System snapshots](manual/47-system-snapshots.md)
- [Security](manual/48-security.md)
- [Omarchy on...](manual/49-omarchy-on.md)
- [Dual Boot Install](manual/50-dual-boot-install.md)
- [Unattended Installs](manual/51-unattended-installs.md)

## License

Omarchy is released under the [MIT License](https://opensource.org/licenses/MIT).
