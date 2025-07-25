FROM harbor.k8s.temple.edu/library/ruby:3.4-alpine

WORKDIR /app

COPY . .

USER root

ARG SECRET_KEY_BASE
ARG RAILS_MASTER_KEY

RUN apk add -U --no-cache \
      bash=5.2.37-r0 \
      gcompat=1.1.0-r4 \
      tzdata=2025b-r0 \
      postgresql16-client=16.9-r00 \
      libxslt=1.1.43-r3 && \
    apk add -U --no-cache --virtual build-dependencies \
      build-base=0.5-r3 \
      git=2.49.1-r0 \
      postgresql16-dev=16.9-r0 \
      libxslt-dev=1.1.43-r3 \
      nodejs=22.16.0-r2 \
      yaml=0.2.5-r2 \
      yaml-dev=0.2.5-r2 \
      yarn=1.22.22-r1 && \
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
