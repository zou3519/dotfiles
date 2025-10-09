# NB: a lot of things already come from dotsync.

cd ~/local
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
# make sure to install into /home/rzou/local/miniconda3

sudo dnf -y install ccache

# main isn't a serious environment, it's just the base of all the worktrees
mkdir ~/dev
mkdir ~/dev/main
cd ~/dev/main
git clone git@github.com:pytorch/pytorch.git pt-main

cd ~/dev

# might need conda tos acceptances
feat d0
feat stable0

