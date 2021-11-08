# tmux-pacman-notifier
Pacman update notifier for TMUX.
## Usage
Add `#{pacman_updates}` to your status-left or status-right in `~/.tmux.conf`, e.g:
```bash
set -g status-right '#{pacman_updates}
```

## Customisation
### Notifier Format
Set a custom format for your notifier with:
```bash
set -g @pacman-update-format '#[fg=colour3,bg=colour0]C#[fg=color1] #{combined} '
```
You can get the number of updates with `#{pacman}`, `#{aur}`, and `#{combined}`, and use colours with `#[fg=colourX,bg=colourX]`.  

### Configuring when to show the notifier
You can set when the notifier should show with:
```bash
set -g @pacman-update-show-on 'any'
```
Valid options are `any`, `pacman`, `aur`, and `always`.

## Installation with TPM
1. Add the following line to `~/.tmux.conf`:
```bash
set -g @plugin 'HazmatDrone/tmux-pacman-notifier'
```
2. Refresh your plugins (default `prefix + I`)

## License
[MIT](https://github.com/HazmatDrone/tmux-pacman-notifier/blob/master/LICENSE)
