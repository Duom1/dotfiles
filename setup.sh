# symlink .bashrc to of ~/.bashrc
ln -s ./.bashrc ~/.bashrc
# symlink init.lua to ~/.config/nvim 
ln -s ./init.lua ~/.config/nvim/init.lua
# symlink starship.toml to ~/.config 
ln -s ./starship.toml ~/.config/starship.toml
# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# install starship
curl -sS https://starship.rs/install.sh | sh
# install nerdfonts
mkdir fonts
cd fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip ./JetBrainsMono.zip
mv *.ttf /usr/local/share/fonts/
