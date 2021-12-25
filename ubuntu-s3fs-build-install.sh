# Ubuntu s3fs Compile
# docs: https://github.com/s3fs-fuse/s3fs-fuse/wiki/Installation-Notes#tested-on-ubuntu-1404-lts
# example: wget -qO - https://raw.githubusercontent.com/Ruhminations/nix-scripts/main/ubuntu-s3fs-build-install.sh | bash -s ""

sudo apt-get -y install build-essential git libfuse-dev libcurl4-openssl-dev libxml2-dev mime-support automake libtool
sudo apt-get -y install pkg-config libssl-dev
git clone https://github.com/s3fs-fuse/s3fs-fuse
cd s3fs-fuse/
./autogen.sh
./configure --prefix=/usr --with-openssl
make
sudo make install
cd ..
rm -r s3fs-fuse/
