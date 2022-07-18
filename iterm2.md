# Iterm 2 

## Theme
- [Dracula theme for iterm](https://github.com/dracula/dracula-theme)
- Changed backgroud color to #282935

## Font
- Jetbrain Mono Nerd Font

```
brew install --cask font-jetbrains-mono-nerd-font
```

# ZSH

## Oh My ZSH
- [Oh My ZSH Github](https://github.com/ohmyzsh/ohmyzsh)

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
## Powerlevel10K
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
- Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc

## ZSH autocompletion
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):

```
plugins=( 
    # other plugins...
    zsh-autosuggestions
)
```
## ZSH syntax highlighting

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
- Add the plugin to the list of plugins

plugins=( 
    # other plugins...
    zsh-autosuggestions
    zsh-syntax-highlighting
)
```
## ZSH syntax highlighting

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
- Add the plugin to the list of plugins

