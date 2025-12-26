## Installation

```bash
# Install nix
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)

# Set experimental-features flag
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf

# Clone this repository
git clone https://github.com/mtnptrsn/nix-config.git
cd nix-config

# Install the configuration
nix run nix-darwin/master#darwin-rebuild -- switch --flake .#mtnptrsn
```

## Apply changes

```bash
cd ~/nix-config
nix run nix-darwin/master#darwin-rebuild -- switch --flake .#mtnptrsn
```
