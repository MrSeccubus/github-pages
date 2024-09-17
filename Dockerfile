FROM alpine:latest

LABEL maintainer="fbreedijk@schubergphilis.com"

RUN apk update && apk add ruby ruby-dev build-base git bash python3 py3-pip py3-requests libc6-compat openjdk21-jre-headless libffi-dev jq curl
RUN gem update --no-document && gem install --no-document github-pages jekyll-secinfo jekyll-last-modified-at webrick bundler racc minitest rexml html-proofer 
RUN cd /root && python -m venv venv && . /root/venv/bin/activate && pip install html5validator cvelib

WORKDIR /root/project

COPY Gemfile /root/project

RUN touch /root/.age

EXPOSE 4000

COPY jekyll.sh /root

ENTRYPOINT [ "/root/jekyll.sh" ]

