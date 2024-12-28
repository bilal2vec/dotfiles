OS = $(shell uname)

setup_Darwin:
	-xcode-select --install
	sudo true
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
	brew install wget vim tmux starship eza bat gnupg pygments gh colordiff yq fzf docker koekeishiya/formulae/yabai
	yabai
	yabai --start-service

setup_Linux:
	apt update
	apt upgrade -y
	wget https://starship.rs/install.sh
	chmod +x install.sh
	./install.sh -y
	rm install.sh
	apt install -y zsh wget vim tmux bat gnupg colordiff fzf libxcb-cursor0 htop
	wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
	chmod +x eza
	chown root:root eza
	mv eza /usr/local/bin/eza

install: setup_$(OS)
ifeq ($(OS), Linux)
	(type -p wget >/dev/null || (apt update && apt-get install wget -y)) && mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null && chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null && apt update && apt install gh -y
endif
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
	touch ~/.hushlogin
	ln -sf ~/dotfiles/.zshrc ~/.zshrc

	ln -sf ~/dotfiles/.ssh/config ~/.ssh/config
	ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
	ln -sf ~/dotfiles/.gitignore ~/.gitignore
	ln -sf ~/dotfiles/.vimrc ~/.vimrc
	ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
	ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
	ln -sf ~/dotfiles/ghostty/config ~/.config/ghostty/config

	curl -LsSf https://astral.sh/uv/install.sh | sh
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
	nvm install node

  -sudo usermod -aG docker $USER
