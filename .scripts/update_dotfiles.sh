echo "Copying .zshrc"
cp ~/.zshrc ~/Documents/dotfiles
echo "Copying .xprofile"
cp ~/.xprofile ~/Documents/dotfiles
echo "Copying configuration.nix"
sudo cp /etc/nixos/configuration.nix ~/Documents/dotfiles/root/etc/nixos/configuration.nix
echo "Copying alacritty configuration"
cp -r ~/.config/alacritty ~/Documents/dotfiles/.config/
echo "Copying nvim configuration"
cp -r ~/.config/nvim ~/Documents/dotfiles/.config
echo "Copying qtile configuration"
cp -r ~/.config/qtile ~/Documents/dotfiles/.config
echo "Copying rofi themes"
cp -r ~/.local/share/rofi/themes ~/Documents/dotfiles/.local/share/rofi/
echo "Copying .scripts"
cp -r ~/.scripts ~/Documents/dotfiles
echo "Copying kitty configuration"
cp -r ~/.config/kitty ~/Documents/dotfiles/.config
