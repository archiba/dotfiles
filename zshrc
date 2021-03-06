# Set dotfiles direcotry
export DOTDIR="$HOME/.dotfiles"

# Set zsh directory
echo 'Setting zsh directory...'

export ZSH="$DOTDIR/oh-my-zsh"

# Set zsh theme 
ln -sf $DOTDIR/oh-my-zsh-themes/xxf.zsh-theme $DOTDIR/oh-my-zsh/themes/
ZSH_THEME="xxf"

echo "Setting zsh theme as '$ZSH_THEME'..."

# Include My profile settings
echo "Including My profile settings..."
source $DOTDIR/profile

# Include My language settings
echo "Including My language settings..."
source "$DOTDIR/lang"

# Include My editor settings
echo "Including My editor settings..."
source "$DOTDIR/editor"

# Include core scripts
source "$HOME/.dotfiles/oh-my-zshrc"

# Include im settings
source "$HOME/.dotfiles/im"

export PATH="/usr/local/opt/qt/bin:$PATH"
