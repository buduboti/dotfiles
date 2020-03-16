FROM zshusers/zsh:master
WORKDIR /root
RUN apt update && apt install -y sudo git curl
RUN git clone -b ubuntu http://www.github.com/buduboti/dotfiles .dotfiles
RUN echo 'y\ny\nn\n\n\n' | ./.dotfiles/install.sh
CMD /bin/zsh
