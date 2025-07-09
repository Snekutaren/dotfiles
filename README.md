# Dotfiles

This repo contains my personal configuration files and setup scripts for shell environments.

## Structure

- `bash/` — bash-related configs and scripts  
- `fish/` — fish shell configs  
- `install.sh` — bootstrap script to install configs and setup environment

## Usage

Clone this repo:

```bash
git clone https://github.com/snekutaren/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Run the bootstrap installer:

```bash
./install.sh
```

This will:

- Append bash customizations to your `~/.bashrc`  
- Install the fish auto-switch snippet to your `~/.bashrc`

## Customization

Feel free to edit and extend these files for your own environment!

## License

MIT License
