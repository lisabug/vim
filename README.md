Vim
===

My Vim Configuration

First Version by using Vundle.
This Version has those plugins:
- YouCompleteMe
- delimitMate
- nerdtree
- python-syntax
- syntastic
- tagbar
- ultisnips
- vim-ctrlspace
- vim-nerdtree-tabs
- vim-snippets

---
## Usage:
1. At home path `git clone https://github.com/lisabug/vim.git .vim`
2. `ln -sf ~/.vim/.vimrc ~/.vimrc`
3. `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
4. install Plugin from command line `vim +PluginInstall +qall`
6. *YouCompleMe* need compile separately and depends on cmake
```
cd ~/.vim/bundle/YouCompleteMe
# on ubuntu, install cmake firstly
# sudo apt-get install cmake
./install.py --clang-completer
``` 

OK, let's Vim.
