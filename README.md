# 🎨 My dotfiles 🖌️

Simple and honest rice made with **BSPWM**, **Polybar** and **Catppuccin** (<3)

![preview](./assets/home.png)

Tools: 
- **VM**: Bspwm
- **Bar**: Polybar
- **Terminal**: gnome-terminal (keeping it classy)
- **Editor**: Nvim
- **Color Scheme**: Catppuccin (Mocha)
- **Compositor**: picom
- **Notifications**: daemon
- **Launcher**: rofi

## Depedencies

- Rofi
- picom
- nvim (`>= 0.8`)
- ripgrep (for nvim)
- dunst 
- polybar

## Installation

To install on a clean machine

- using [`chezmoi`](https://www.chezmoi.io/): 

Use the following command to clone the repo into `~/.local/share/chezmoi`:

```bash
chezmoi init https://github.com/Nactik/dotfiles.git

## ssh alternative
# chezmoi init git@github.com:Nactik/dotfiles.git
```

And then, you can apply the dotfiles by doing: 

```bash
chezmoi apply

## If you want to apply only a certain dotfile (nvim for instance):
# chezmoi apply ~/.config/nvim
```

## RoadMap

- Use `ewww` to create a dashboard widget (Wifi, bluetooth, sound)
- Better polybar
