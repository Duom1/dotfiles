link_dotfiles() {
  cp ./.bashrc ~/.bashrc
  cp ./.xinitrc ~/.xinitrc
  cp ./starship.toml ~/.config/starship.toml
  cp ./redshift.conf ~/.config/redshift.conf
  if [ -d "~/.config/nvim/" ]; then
    echo "~/.config/nvim/ exists"
    cp ./init.lua ~/.config/nvim/init.lua
  fi
}
install_starship() {
  curl -sS https://starship.rs/install.sh | sh
}
install_fonts() {
  mkdir fonts
  cd fonts
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
  unzip ./JetBrainsMono.zip
  sudo mv *.ttf /usr/share/fonts/
}
clean() {
  rm -rf ./fonts
}

# Main script
if [ $# -eq 0 ]; then
  echo "Usage: $0 [all or link|starship|fonts|clean]"
  exit 1
fi

for arg in "$@"; do
  case "$arg" in
    link)
      link_dotfiles
      ;;
    starship)
      install_starship
      ;;
    fonts)
      install_fonts
      ;;
    clean)
      clean
      ;;
    all)
      link_dotfiles
      install_starship
      install_fonts
      ;;
    *)
      echo "Unknown argument: $arg"
      exit 1
      ;;
  esac
done
