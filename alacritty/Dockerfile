FROM ubuntu:17.10
RUN apt-get update
RUN apt-get install -qy --no-install-recommends curl ca-certificates
RUN curl -Ss https://sh.rustup.rs > /rustup.rs
RUN chmod +x /rustup.rs
RUN /rustup.rs -y
ENV PATH=$PATH:/root/.cargo/bin

RUN apt-get install -qy --no-install-recommends git gcc
RUN git clone  https://github.com/jwilm/alacritty.git
WORKDIR /alacritty
RUN apt-get install -qy libc6-dev file make liblzma-dev cmake g++ pkg-config libfreetype6-dev libexpat-dev
RUN cargo install cargo-deb
RUN git checkout scrollback
RUN cargo deb 
#--install
