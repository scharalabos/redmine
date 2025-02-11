FROM ruby:3.1

WORKDIR /app  # Ensure the correct working directory

COPY . .  # Copy all files

RUN gem install bundler && bundle install  # Install dependencies

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
