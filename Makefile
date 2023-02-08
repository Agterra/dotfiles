setup:
	rm ~/.zshrc
	rm -rf ~/.config/ulauncher
	rm -rf ~/.config/i3
	ln -s ~/dotfiles/.zshrc ~/.zshrc
	ln -s ~/dotfiles/ulauncher ~/.config/ulauncher
	ln -s ~/dotfiles/i3 ~/.config/i3
