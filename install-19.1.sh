#!/bin/bash

num_core=`grep 'core id' /proc/cpuinfo | sort -u | wc -l`
mflags=`grep 'flags' /proc/cpuinfo`
for i in $mflags; do
  if [ $i = "avx2" ] && [ $((p)) -lt 6 ]; then
    mop="avx2"
    p=6
  fi
  if [ $i = "avx" ] && [ $((p)) -lt 5 ]; then
    mop="avx"
    p=5
  fi
  if [ $i = "sse4_2" ] && [ $((p)) -lt 4 ]; then
    mop="sse4.2"
    p=4
  fi
  if [ $i = "sse4_1" ] && [ $((p)) -lt 3 ]; then
    mop="sse4.1"
    p=3
  fi
  if [ $i = "ssse3" ] && [ $((p)) -lt 2 ]; then
    mop="ssse3"
    p=2
  fi
  if [ $i = "sse2" ] && [ $((p)) -lt 2 ]; then
    mop="sse2"
    p=1
  fi
done
echo "number of cups: "$num_core
echo "tuning option: -m"$mop

#
if [ -d ./dftbplus-19.1 ];
then
  echo "detect old dftbplus-19.1 directory !"
  echo "delet old dftbplus-19.1 directory"
  sudo rm -f -r ./dftbplus-19.1
fi
#

echo "++++++++++download++++++++++"
sudo apt update
sudo apt install -y unzip
sudo apt install -y g++
sudo apt install -y gcc
sudo apt install -y bulid-essential
sudo apt install -y gfortran
sudo apt install -y libopenmpi-dev
sudo apt install -y m4
sudo apt install -y libscalapack-openmpi-dev
sudo apt install -y libscalapack-openmpi2.0
sudo apt install -y libopenblas-dev
sudo apt install -y liblapack-dev
sudo apt install -y libarpack2-dev
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
sudo apt install -y jmol
#sudo apt install -y grace
#sudo apt install -y gnuplot
#sudo apt install -y nkf
#sudo apt install -y libfftw3-dev
#sudo apt install -y fftw-dev
#sudo apt install -y python
#sudo apt install -y python2
#sudo apt install -y libpython2-dev

echo "++++++++++unpack++++++++++"
tar zxvf dftbplus-19.1.tar.gz
cd dftbplus-19.1
#git submodule update --init --recursive
#./utils/get_opt_externals ALL

echo "++++++++++compiling++++++++++"
#mkdir _build
#cd _build
#cmake -DWITH_DFTD3=true -DWITH_TRANSPORT=true -DFYPP_FLAGS="-DTRAVIS" -DWITH_ARPACK=true -DCMAKE_TOOLCHAIN_FILE=../sys/gnu.cmake ..
sed -i "s/avx2/$mop/g" make.arch
make -j${num_core}
make test TEST_MPI_PROCS=${num_core} TEST_OMP_THREADS=2 
make install

echo "++++++++++dptools setting++++++++++"
cd ~/dftbplus-19.1/tools/dptools
sudo python3 setup.py install

echo "++++++++++tests++++++++++"
#cd ~/dftbplus-19.1/_build
#ctest
