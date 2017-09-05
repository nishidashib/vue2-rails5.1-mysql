FROM ruby:2.4-alpine

RUN apk update && \
    apk add tini vim bash make g++ mariadb-dev sqlite-dev nodejs git && \
    rm -rf /usr/lib/mysqld* /usr/bin/mysql* && \
    apk add mariadb-client && \
    rm -rf /var/cache/apk/*

ENV CONFIGURE_OPTS --disable-install-doc
RUN echo 'gem: --no-rdoc --no-ri' | tee -a /.gemrc
RUN gem install bundler

ARG APP_HOME=/myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ENV BUNDLE_GEMFILE "$APP_HOME/Gemfile"
ENV BUNDLE_JOBS 2
ENV BUNDLE_PATH "/bundle"

RUN echo "alias be='bundle exec'" >> /root/.bashrc
RUN echo "alias bi='bundle install'" >> /root/.bashrc

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/docker-entrypoint.sh"]

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]