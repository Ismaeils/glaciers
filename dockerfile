# syntax=docker/dockerfile:1

FROM ruby:3.1.0
RUN apt-get update -qq && apt-get install -y default-mysql-server
WORKDIR /glaciers
COPY Gemfile /glaciers/Gemfile
COPY Gemfile.lock /glaciers/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
EXPOSE 9200
EXPOSE 9300

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
