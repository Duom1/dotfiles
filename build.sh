cd ~/.cache/wal/
sed -i '/urg/d' colors-wal-dwm.h
cd ~/code/foss/dwm/
sudo make install
make clean
cd ~/code/foss/st
sudo make install
make clean
