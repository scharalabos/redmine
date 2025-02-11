FROM ruby:3.1

WORKDIR /app  # Set the working directory

COPY . /app   # Copy everything into the container

RUN gem install bundler && bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
