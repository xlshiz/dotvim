#! /bin/bash
# cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/workdir/backup/llvm/clang+llvm-3.3-i386-debian6 . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
./install.py --system-libclang --clang-completer --go-completer
