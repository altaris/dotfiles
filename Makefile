SUDO 		?= sudo
INSTALL		?= apt-get install

backup:
	./vscode-extension-backup.sh
	-git commit -a -m "Dotfile backup $$(date --rfc-3339 second)"
	git push

install:
	-git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	-~/.fzf/install
	./install.py
