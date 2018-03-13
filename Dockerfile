FROM ruby:2.3.6

ARG working_dir

RUN apt-get update -qq && apt-get install -y build-essential nodejs
RUN mkdir -p ${working_dir}

WORKDIR ${working_dir}

COPY Gemfile ${working_dir}/
COPY Gemfile.lock ${working_dir}/

RUN gem install bundler -v 1.13.7 && \
    bundle _1.13.7_ install && \
    bundle _1.13.7_ lock