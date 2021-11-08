# tmux-pacman-notifier
Pacman update notifier for TMUX.
## Usage
Add `#{pacman_updates}` to your `status-left` or `status-right`, e.g:
```bash
set -g status-right '#{pacman_updates}
```

## Customisation
You can set a custom format for your notifier by setting `pacman-update-format`.
You can get the number of updates with `#{pacman}`, `#{aur}`, and `#{combined}`.
You can use colours with `#[fg=colourX,bg=colourX]`.
By default this value is `#[fg=colour3,bg=colour0]C#[fg=color1] #{combined} `.
E.g:
```bash
set -g @pacman-update-format '#[fg=colour15,bg=colour0] There are #[fg=colour3]#{combined}#[fg=colour15] updates available'
```

You can set when the notifier should show by setting `pacman-update-show-on`.
Valid options are `any`, `pacman`, `aur`, and `always`. E.g:
```bash
set -g @pacman-update-show-on 'always'

```

## Installation with TPM
1. Add the following line to `~/.tmux.conf`:
```bash
set -g @plugin 'HazmatDrone/tmux-pacman-notifier'
```
2. Refresh your plugins (default `prefix + I`)

## License
[MIT](/aaronpowell/tmux-weather/blob/master/LICENSE)
