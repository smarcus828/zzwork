#!/bin/bash
##  Script to install my stuff - 
SM_INST="${HOME}/steven_install/"
#mkdir ${SM_INST}
function root_stuff()
{
    if [[ ! -f /usr/bin/xcodebuild ]]; then
        xcode-select --install
    fi
}

FUNC=$(declare -f root_stuff)

echo "BEGIN"
sudo bash -c "${FUNC}; root_stuff"

### Normal user stuff
if [[ ! -f /usr/local/bin/brew ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

L=(
    iterm2
    stow
    wget
    calc
    git
    visual-studio-code
    )

for i in "${L[@]}"; do
    brew install ${i}
done 

echo "DONE"



#iterm2



# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Broke
#curl https://github.com/Homebrew/brew/releases/download/4.4.3/Homebrew-4.4.3.pkg -O ~/${SM_INST}/brew.pkg