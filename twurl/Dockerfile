FROM ruby:latest
RUN gem install twurl
ENTRYPOINT [ "/usr/local/bundle/bin/twurl" ]
#ENTRYPOINT ["/bin/sh"]
RUN ln -s /project/.twurlrc /root/.twurlrc
WORKDIR /project
