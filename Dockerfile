FROM alpine:latest

LABEL maintainer="fbreedijk@schubergphilis.com"

RUN apk update && apk add ruby ruby-dev build-base git bash python3 py3-pip py3-requests libc6-compat openjdk21-jre-headless libffi-dev jq curl ruby-webrick ruby-racc ruby-nokogiri ruby-safe_yaml ruby-forwardable-extended ruby-pathutil ruby-liquid ruby-rexml ruby-kramdown ruby-kramdown-parser-gfm ruby-ffi ruby-rb-inotify ruby-listen ruby-jekyll-watch ruby-i18n ruby-http_parser.rb ruby-eventmachine ruby-em-websocket ruby-colorator ruby-public_suffix ruby-addressable ruby-tzinfo ruby-minitest ruby-activesupport ruby-bundler ruby-racc 
RUN gem install --no-document github-pages jekyll-secinfo jekyll-last-modified-at html-proofer 
RUN cd /root && python -m venv venv && . /root/venv/bin/activate && pip install html5validator cvelib

WORKDIR /root/project

COPY Gemfile /root/project

RUN touch /root/.age

EXPOSE 4000

COPY jekyll.sh /root

ENTRYPOINT [ "/root/jekyll.sh" ]

