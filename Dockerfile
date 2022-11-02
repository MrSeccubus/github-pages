FROM alpine:latest

LABEL maintainer="fbreedijk@schubergphilis.com"

RUN apk update && apk add ruby ruby-dev build-base git bash python3 py3-pip libc6-compat openjdk12-jre-headless   
RUN gem install --no-document jekyll github-pages jekyll-secinfo jekyll-last-modified-at webrick bundler racc minitest rexml html-proofer 
RUN pip install html5validator

WORKDIR /root/project

COPY Gemfile /root/project

EXPOSE 4000

COPY jekyll.sh /root

ENTRYPOINT [ "/root/jekyll.sh" ]

