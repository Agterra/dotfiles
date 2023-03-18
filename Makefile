install_fedora:
	sudo dnf update -y \
		&& sudo dnf install -y \
			dunst \
			i3 \
			picom \
			polybar \
			ulauncher \
			fontawesome5-fonts \
			fontawesome5-free-fonts 

install_debian:
	sudo apt update -y \
		&& sudo apt install -y \
			dunst \
			i3 \
			picom \
			polybar \
			ulauncher \
			fontawesome5-fonts \
			fontawesome5-free-fonts

setup:
	mkdir -p $(HOME)/Pictures/captures
	rm ~/.zshrc ; ln -sf ~/dotfiles/.zshrc ~/.zshrc
	rm -rf ~/.config/ulauncher ; ln -sf ~/dotfiles/ulauncher/ ~/.config/ulauncher
	rm -rf ~/.config/i3 ; ln -sf ~/dotfiles/i3/ ~/.config/i3
	rm -rf ~/.config/picom ; ln -sf ~/dotfiles/picom/ ~/.config/picom
	rm -rf ~/.config/polybar ; ln -sf ~/dotfiles/polybar/ ~/.config/polybar
	rm -rf ~/.config/dunst ; ln -sf ~/dotfiles/dunst/ ~/.config/dunst 
