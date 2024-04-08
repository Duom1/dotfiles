git clone https://github.com/pijulius/picom
cd picom
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
