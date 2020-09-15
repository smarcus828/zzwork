#!/bin/bash
HOMEDIR="/home/smarcus"
#FILE=".bash_profile"
TMPDIR="/tmp/old_config_files"

mv .bash_profile ${TMPDIR}

git clone https://github.com/smarcus828/dotfiles.git ${HOMEDIR}/.dotfiles

#!/bin/bash
if [ -f /usr/bin/stow ];
then
        echo "its there"
else
	echo "Stow is not installed" >> STOW_IS_NOT_INSTALLED
        exit 0
fi

mkdir ${TMPDIR}
mv ${HOMEDIR}/.zshrc ${TMPDIR}
mv ${HOMEDIR}/.bashrc ${TMPDIR}
mv ${HOMEDIR}/.bash_profile ${TMPDIR}
mv ${HOMEDIR}/.viminfo ${TMPDIR}

cd ${HOMEDIR}/.dotfiles
stow -t ~ vim zshrc oh-my-zsh bash
cd ~

#if grep "smarcus additions" ${HOMESIR}${FILE};
#then
#  echo "Already there"
#else
#  echo "### smarcus additions ###" >> ${HOMEDIR}${FILE}
#  echo "cat /etc/redhat-release" >> ${HOMEDIR}${FILE}
#  echo "date" >> ${HOMEDIR}${FILE}
#fi
#
#rm -f $0
