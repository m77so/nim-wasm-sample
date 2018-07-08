FROM trzeci/emscripten
MAINTAINER m77so
USER emscripten
RUN curl https://nim-lang.org/choosenim/init.sh -sSf | sh -s -- -y 
RUN mkdir -p /home/emscripten/.config/

ENV PATH=/home/emscripten/.nimble/bin:${PATH}
COPY nim.cfg /home/emscripten/.config/
RUN echo 'import strutils;"test".echo' > /tmp/test.nim \
    && nim c -d:release -d:emscripten -o:/tmp/test.js /tmp/test.nim 
