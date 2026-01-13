# README.md

## Description
This repository contains configuration files and setup instructions for [tmux](https://github.com/tmux/tmux), a terminal multiplexer that allows users to create and manage multiple terminal sessions within a single window.

## Installation
To use the tmux configuration provided in this repository, follow these steps:
1. Clone the repository to your local machine:
   ```
   git clone https://github.com/adamsoderstrom/tmux-conf.git
   ```
2. Symlink the `.tmux.conf` file to your home directory:
   ```
   ln -s tmux-conf/.tmux.conf ~/.tmux.conf
   ```
3. Restart your terminal or run `tmux source-file ~/.tmux.conf` to apply the new configuration.

## Usage

The configuration contents included in this setup provide a customized tmux experience with the following features:

- Remapping the prefix from `C-b` to `C-x`
- Splitting windows horizontally using `C-x h` and `C-x l` (vim bindings)
- Splitting windows vertically using `C-x j` and `C-x k` (vim bindings)
- Custom key bindings for pane navigation (`C-h`, `C-l`, `C-j`, `C-k`) (vim bindings)
- Stylish status bar with various components displayed (unread newsboat items, GitHub notifications, currently playing music)
- Integration of plugins like `tmux-plugins/tpm` and `tmux-plugins/tmux-sensible`

Feel free to explore and modify these configurations to tailor tmux to your specific workflow and preferences.

## Contributing

If you would like to contribute to this repository by adding improvements or new features, feel free to fork the repository and submit a pull request.
