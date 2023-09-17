# link .bashrc to of ~/.bashrc
ln ./.bashrc ~/.bashrc
# link init.lua to ~/.config/nvim 
ln ./init.lua ~/.config/nvim/init.lua
# link starship.toml to ~/.config 
ln ./starship.toml ~/.config/starship.toml
# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# install starship
curl -sS https://starship.rs/install.sh | sh
# install nerdfonts
mkdir fonts
cd fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip ./JetBrainsMono.zip
mv *.ttf /usr/share/fonts/
