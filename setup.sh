link_dotfiles() {
  cp -v ./.bashrc ~/.bashrc
  cp -v ./.xinitrc ~/.xinitrc
  cp -v ./redshift.conf ~/.config/redshift.conf
  cp -v ./picom.conf ~/.config/picom.conf
  cp -v ./.Xmodmap ~/.Xmodmap
  if [ -d ~/.config/nvim/ ]; then
    echo "~/.config/nvim/ exists"
  else
    echo "~/.config/nvim does not exist"
    mkdir -pv ~/.config/nvim
  fi
  cp -v ./init.lua ~/.config/nvim/init.lua
  if [ -d ~/.config/rofi/ ]; then
    echo "~/.config/rofi/ exists"
  else
    echo "~/.config/rofi does not exist"
    mkdir -pv ~/.config/rofi
  fi
  cp -v ./config.rasi ~/.config/rofi/config.rasi
}
install_fonts() {
  mkdir fonts
  cd fonts
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
  unzip ./JetBrainsMono.zip
  sudo mv *.ttf /usr/share/fonts/
}
clean() {
  rm -rf ./fonts ./picom
}

# Main script
if [ $# -eq 0 ]; then
  echo "Usage: $0 [all or link|fonts|clean]"
  exit 1
fi

for arg in "$@"; do
  case "$arg" in
    link)
      link_dotfiles
      ;;
    fonts)
      install_fonts
      ;;
    clean)
      clean
      ;;
    all)
      link_dotfiles
      install_fonts
      ;;
    *)
      echo "Unknown argument: $arg"
      exit 1
      ;;
  esac
done
