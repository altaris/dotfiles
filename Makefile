SUDO 		?= sudo
INSTALL		?= apt-get install

backup:
	@echo
	@echo "============================================================"
	@echo "Creating a list of install VSCode extensions"
	@echo "============================================================"
	@echo
	./vscode-extension-backup.sh
	@echo
	@echo "============================================================"
	@echo "Pushing"
	@echo "============================================================"
	@echo
	-git commit -a -m "Dotfile backup $$(date --rfc-3339 second)"
	git push

install:
	@echo
	@echo "============================================================"
	@echo "Symlinking dotfiles"
	@echo "============================================================"
	@echo
	./install.py
	@echo
	@echo "============================================================"
	@echo "Installing oh-my-zsh"
	@echo "============================================================"
	@echo
	-sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	@echo
	@echo "============================================================"
	@echo "Installing fzf"
	@echo "============================================================"
	@echo
	-git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	-~/.fzf/install --key-bindings --completion --no-update-rc
