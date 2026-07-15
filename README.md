# dotfiles

## About

My linux dotfiles

## Installation

### Pre-requisites

Install following software before using this repo:

- [Alacritty](https://github.com/alacritty/alacritty)
- [PowrShell v7+](https://github.com/PowerShell/PowerShell) (also known as PowerShell Core)
- [Starship](https://github.com/starship/starship) - shell prompt
- [fzf](https://github.com/junegunn/fzf) - fuzzy finder
- [eza](https://github.com/eza-community/eza) - ls replacement
- [bat](https://github.com/sharkdp/bat) - cat replacement
- Git

Good addons:

- [Fira Code Nerd Font Monospace](https://www.nerdfonts.com/)

### Clone the repo

```bash
cd $HOME
git clone https://github.com/MeheheCedy22/dotfiles.git
```

### Setup Powershell

- to setup PowerShell profile to load custom scripts and configs, run the [copy_profile.ps1](./powershell/copy_profile.ps1) script in PowerShell:
```ps1
. $env:HOME/dotfiles/powershell/copy_profile.ps1
```
**Note:** From time to time the cache needs to be regenerated. For now it is done manually.

## TODOs

- [ ] add mechanism to automatically update the cache without performance hit
