FROM claziss/arc-gnu:latest

# Put the arc compiler in the path
ENV PATH $PATH:/usr/src/arc/INSTALL/bin

# Set the folder where the compiler sources are.
ENV COMPSRC /usr/src/arc

RUN set -x \
    && curl -fSL "https://drive.google.com/uc?id=0B047J7MfTwx-Wk9JZXp1VzlUOG8" -o support.tar.gz \
    && tar -xzf support.tar.gz -C /usr/src/arc --strip-components=1 \
    && rm support.tar.gz*

ENV NSIM_HOME /usr/src/arc/nSIM

RUN set -x \
    && dpkg --add-architecture i386 \
    && apt-get update && apt-get install -y dejagnu libc6:i386 libncurses5:i386 libstdc++6:i386 --no-install-recommends \
    && rm -r /var/lib/apt/lists/* \
    && cd /usr/src/arc/ \
    && git clone --depth 1 https://github.com/claziss/testing.git \
    && cd testing/archs \
    && mkdir tmp

