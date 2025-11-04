FROM harbor.k8s.temple.edu/library/ruby:3.4-alpine

WORKDIR /app

COPY . .

USER root

ARG SECRET_KEY_BASE
ARG RAILS_MASTER_KEY
ENV TMPDIR=/secure-tmp

RUN apk add -U --no-cache \
      bash=5.2.37-r0 \
      gcompat=1.1.0-r4 \
      tzdata=2025b-r0 \
      postgresql16-client=16.10-r0 \
      libstdc++=14.2.0-r6 \
      libxslt=1.1.43-r3 && \
    apk add -U --no-cache --virtual build-dependencies \
      build-base=0.5-r3 \
      libffi-dev=3.4.8-r0 \
      libsass-dev=3.6.6-r0 \
      git=2.49.1-r0 \
      postgresql16-dev=16.10-r0 \
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
    mkdir -p /secure-tmp/cache /secure-tmp/pids /secure-tmp/sockets && \
    rm -rf /app/tmp && \
    ln -s /secure-tmp /app/tmp && \
    mkdir -p /app/log && \
    chown -R 65534:65534 /secure-tmp /app/log


USER 65534

ENTRYPOINT [".docker/app/entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
