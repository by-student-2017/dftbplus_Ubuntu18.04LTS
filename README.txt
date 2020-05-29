------------------------------------------------------------------------------
DFTB+ 19.1 (ubuntu 18.04 LTS)

Installation
1. cp dftbplus-19.1.tar.gz $HOME/dftbplus-19.1.tar.gz
  cp install-19.1.sh $HOME/install-19.1.sh
2. cd $HOME
3. install-19.1.sh
4. echo "" >> ~/.bashrc
  echo "# dftb+ 19.1" >> ~/.bashrc
  echo 'export PATH=$PATH:$HOME/dftbplus-19.1/_install/bin' >> ~/.bashrc
  echo 'export PATH=$PATH:$HOME/dftbplus-19.1/tools/misc' >> ~/.bashrc
5. bash

test
1. cd $HOME/dftbplus-19.1
2. make test TEST_MPI_PROCS=2 TEST_OMP_THREADS=2
------------------------------------------------------------------------------
DFTB+ 18.2 (ubuntu 18.04 LTS)

Installation
1. cp dftbplus-18.2.tar.gz $HOME/dftbplus-18.2.tar.gz
  cp install-18.2.sh $HOME/install-18.2.sh
2. cd $HOME
3. install-18.2.sh
4. echo "" >> ~/.bashrc
  echo "# dftb+ 18.2" >> ~/.bashrc
  echo 'export PATH=$PATH:$HOME/dftbplus-18.2/_install/bin' >> ~/.bashrc
  echo 'export PATH=$PATH:$HOME/dftbplus-18.2/tools/misc' >> ~/.bashrc
5. bash

test
1. cd $HOME/dftbplus-18.2
2. make test TEST_MPI_PROCS=2 TEST_OMP_THREADS=2
------------------------------------------------------------------------------
DFTB+ latest version from github (ubuntu 18.04 LTS)
(checked on 29/May/2020, single run)

Installation (OpenMP version)
1. cp install-github.sh $HOME/install-github.sh
2. cd $HOME
3. install-github.sh
4. Download dftd3? [y/N] y
5. echo "" >> ~/.bashrc
  echo "# dftb+ latest version from github" >> ~/.bashrc
  echo 'export PATH=$PATH:$HOME/dftbplus/_build/_install/bin' >> ~/.bashrc
  echo 'export PATH=$PATH:$HOME/dftbplus/tools/misc' >> ~/.bashrc
6. bash
------------------------------------------------------------------------------