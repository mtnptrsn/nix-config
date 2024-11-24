## Installation

### Ubuntu

```bash
# Install nix
sh <(curl -L https://nixos.org/nix/install) --daemon

# Set experimental-features flag
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf

# Clone this repository
git clone https://github.com/mtnptrsn/nix-config.git
cd nix-config

# Open tempoary shell with nix and home-manager
nix-shell

# Install the configuration
home-manager switch --flake .

# Exit temporary shell
exit

# Set zsh (installed by nix) as default shell
echo ~/.nix-profile/bin/zsh | sudo tee -a /etc/shells
sudo usermod -s ~/.nix-profile/bin/zsh $USER
```

## Apply changes

```bash
cd ~/nix-config
home-manager switch --flake .
```
