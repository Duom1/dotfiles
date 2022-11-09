cp ~/.cache/wal/colors-wal-dwm.h ~/.sources/desktop/dwm/
sed -i '/urg/d' ~/.sources/desktop/dwm/colors-wal-dwm.h
cd ~/.sources/desktop/dwm/
sudo make clean install

cp ~/.cache/wal/colors-wal-dmenu.h ~/.sources/desktop/dmenu/
cd ../dmenu/
sudo make clean install

cp ~/.cache/wal/colors-wal-st.h ~/.sources/desktop/st/
cd ../st/
sudo make clean install

cd ../slstatus/
sudo make clean install
