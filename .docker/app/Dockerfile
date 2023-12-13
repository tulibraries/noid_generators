FROM harbor.k8s.temple.edu/library/ruby:3.1-alpine

WORKDIR /app

COPY . .

USER root

ARG SECRET_KEY_BASE
ARG RAILS_MASTER_KEY

RUN apk add -U --no-cache \
      bash=5.2.21-r0 \
      gcompat=1.1.0-r4 \
      tzdata=2023c-r1 \
      postgresql14-client=14.10-r0 \
      libxslt=1.1.39-r0 && \
    apk add -U --no-cache --virtual build-dependencies \
      build-base=0.5-r3 \
      git=2.43.0-r0 \
      postgresql14-dev=14.10-r0 \
      libxslt-dev=1.1.39-r0 \
      nodejs=20.10.0-r1 \
      yarn=1.22.19-r0 && \
    gem install bundler:2.3.3 && \
    bundle config build.nokogiri --use-system-libraries && \
    bundle config set --local without "development test" && \
    bundle install --jobs=8 && \
    find "$GEM_HOME" -name yarn.lock -exec rm "{}" \; && \
    find "$GEM_HOME" -name Gemfile.lock -exec rm "{}" \; && \
    RAILS_ENV=production SECRET_KEY_BASE=$SECRET_KEY_BASE bundle exec rails assets:precompile && \
    rm -rf node_modules && \
    rm -rf tmp/* && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/ && \
    chown nobody -R /app/tmp && \
    chown nobody -R /app/log

USER nobody

ENTRYPOINT [".docker/app/entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]