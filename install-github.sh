#!/bin/bash

#
if [ -d ./dftbplus ];
then
  echo "detect old dftbplus directory !"
  echo "delet old dftbplus directory"
  rm -f -r ./dftbplus
fi
#

echo "++++++++++download++++++++++"
sudo apt update
sudo apt install -y g++
sudo apt install -y gcc
sudo apt install -y bulid-essential
sudo apt install -y gfortran
sudo apt install -y libarpack2-dev
sudo apt install -y libopenblas-dev
sudo apt install -y liblapack-dev
#sudo apt install -y libfftw3-dev
#sudo apt install -y fftw-dev
#sudo apt install -y python
#sudo apt install -y python2
#sudo apt install -y libpython2-dev
sudo apt install -y python3.7
sudo apt install -y libpython3.7-dev
sudo apt install -y python3.7-distutils
sudo apt install -y python-numpy
sudo apt install -y python-matplotlib
sudo apt install -y csh
sudo apt install -y wget
sudo apt install -y git
sudo apt install -y make
sudo apt install -y cmake
#sudo apt install -y grace
#sudo apt install gnuplot
sudo apt install -y jmol
#sudo apt install -y nkf

echo "++++++++++unpack++++++++++"
git clone https://github.com/dftbplus/dftbplus.git
cd dftbplus
git submodule update --init --recursive
./utils/get_opt_externals ALL

echo "++++++++++compiling++++++++++"
mkdir _build
cd _build
cmake -DWITH_DFTD3=true -DWITH_TRANSPORT=true -DFYPP_FLAGS="-DTRAVIS" -DWITH_ARPACK=true -DCMAKE_TOOLCHAIN_FILE=../sys/gnu.cmake ..
make
ctest
make install

echo "++++++++++dptools setting++++++++++"
cd ~/dftbplus/tools/dptools
sudo python3.7 setup.py install

echo "++++++++++tests++++++++++"
#cd ~/dftbplus/_build
#ctest