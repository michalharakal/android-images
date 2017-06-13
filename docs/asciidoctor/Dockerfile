FROM android/java-8-jdk

ENV PATH $PATH:$JAVA_HOME/bin:/fopub/bin
ENV BACKENDS /asciidoctor-backends
ENV GVM_AUTO_ANSWER true
ENV ASCIIDOCTOR_VERSION "1.5.5"

# Install dependencies
RUN apt-get -qq update && \
    apt-get -qqy install \
    make \
    gcc \
    ruby \
    python-setuptools \
    python-dev \
    zlib1g-dev \
    liblzma-dev \
    ruby-dev \
    rubygems \
    graphviz \
    unzip \
    findutils \
    wget \
    patch \
    git \
    pandoc \
    sudo && \
    rm -rf /var/lib/apt/lists/* 

RUN mkdir -p /fopub 
RUN curl -L https://api.github.com/repos/asciidoctor/asciidoctor-fopub/tarball | tar xzf - -C /fopub/ --strip-components=1 \
&& curl -L https://api.github.com/repos/asciidoctor/asciidoctor-fopub/tarball | tar xzf - -C /fopub/ --strip-components=1 \
&& mkdir -p /tmp \  
&& touch /tmp/empty.xml \
&& gem install --no-ri --no-rdoc nokogiri \
&& gem install --no-ri --no-rdoc asciidoctor --version $ASCIIDOCTOR_VERSION \
&& gem install --no-ri --no-rdoc asciidoctor-diagram \
&& gem install --no-ri --no-rdoc asciidoctor-epub3 --version 1.5.0.alpha.6 \
&& gem install --no-ri --no-rdoc rake \
&& gem install --no-ri --no-rdoc epubcheck --version 3.0.1 \
&& gem install --no-ri --no-rdoc kindlegen --version 3.0.1 \
&& gem install --no-ri --no-rdoc asciidoctor-pdf --version 1.5.0.alpha.15 \
&& gem install --no-ri --no-rdoc asciidoctor-confluence \
&& gem install --no-ri --no-rdoc rouge coderay pygments.rb thread_safe epubcheck kindlegen \
&& gem install --no-ri --no-rdoc slim \
&& gem install --no-ri --no-rdoc haml tilt \
&& gem install --no-ri --no-rdoc asciidoctor-revealjs

RUN mkdir $BACKENDS \
  && (curl -LkSs https://api.github.com/repos/asciidoctor/asciidoctor-backends/tarball | tar xfz - -C $BACKENDS --strip-components=1) 
  
RUN git clone https://github.com/asciidoctor/asciidoctor-deck.js /deckjs \
    && mv /deckjs/* /asciidoctor-backends/haml/deckjs
  
COPY themes/ /pdf-themes/android/
COPY fonts/RobotoTTF/  /pdf-fonts/

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]

 
CMD ["/bin/bash"]