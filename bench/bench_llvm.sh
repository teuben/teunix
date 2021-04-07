#! /bin/bash
#
# a good parallel benchmark compiling the LLVM compiler
# See also https://www.anandtech.com/show/16594/intel-3rd-gen-xeon-scalable-review/10
#

refresh=0
local=0
tgz=llvm-project.tar.gz
git=0

#             simple keyword=value command line parser for bash - don't make any changing below
for arg in $*; do
  export $arg
done

if [ $git = 1 ]; then
    git clone https://github.com/llvm/llvm-project.git
    cd llvm-project
    git checkout release/11.x
    mkdir ./build
    cd ..
    echo Creating llvm-project.tar.gz 
    tar zcf llvm-project.tar.gz llvm-project
    echo Done. llvm-project.tar.gz created
    exit 0
else
    echo git=0  no clean git made
fi

if [ $refresh = 1 ]; then

    git clone https://github.com/llvm/llvm-project.git
    cd llvm-project
    git checkout release/11.x
    mkdir build
    cd ..
    mkdir llvm-project-tmpfs
    sudo mount -t tmpfs -o size=10G,mode=1777 tmpfs ./llvm-project-tmpfs
    cp -r llvm-project/* llvm-project-tmpfs
    cd ./llvm-project-tmpfs/build
    cmake -G Ninja \
	  -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi;lldb;compiler-rt;lld" \
	  -DCMAKE_BUILD_TYPE=Release ../llvm
    /usr/bin/time cmake --build .
    exit 0
else
    echo refresh=0   No method as published in https://www.anandtech.com/show/16594/intel-3rd-gen-xeon-scalable-review/10
fi

if [ $local = 1 ]; then
    git clone https://github.com/llvm/llvm-project.git
    cd llvm-project
    git checkout release/11.x
    mkdir build
    cd build
    #
    cmake -G Ninja \
	  -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi;lldb;compiler-rt;lld" \
	  -DCMAKE_BUILD_TYPE=Release ../llvm
    /usr/bin/time cmake --build .
    exit 0
else
    echo local=0 no full git locally
fi


if [ -e $tgz ]; then
    tar zxf llvm-project.tar.gz 
    cd llvm-project
    mkdir build
    cd build
    cmake -G Ninja \
	  -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi;lldb;compiler-rt;lld" \
	  -DCMAKE_BUILD_TYPE=Release ../llvm
    time cmake --build .
    exit 0
else
    echo No tgz=$tgz  
fi
  
