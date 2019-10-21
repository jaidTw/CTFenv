FROM ubuntu:18.04
LABEL maintainer "jaidTw"

COPY sources.list /etc/apt/sources.list
RUN dpkg --add-architecture i386
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y  libc6-dbg libc6:i386 libc6-dbg:i386 libssl-dev libffi-dev \
                    curl wget net-tools netcat \
                    python python-pip python3 python3-dev python3-pip ruby ruby-dev \
                    gcc clang build-essential llvm make cmake patchelf \
                    gdb gdb-multiarch strace ltrace radare2 \
                    git tmux qemu neovim file iputils-ping bsdmainutils

RUN cd ~ && git clone https://github.com/pwndbg/pwndbg
RUN cd ~/pwndbg/ && ./setup.sh

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev3
RUN python3 -m pip install frida-tools

RUN pip install ropgadget capstone

RUN gem install one_gadget seccomp-tools

RUN mkdir -p /root/.config/nvim
COPY init.vim /root/.config/nvim/init.vim
COPY .tmux.conf /root/.tmux.conf
COPY .gdbinit /root/.gdbinit
RUN echo 'alias vim="nvim"' >> /root/.bashrc
ENV EDITOR=vim
ENV VISUAL=vim
ENV TERM=xterm-256color
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

CMD ["/bin/bash", "run"]
