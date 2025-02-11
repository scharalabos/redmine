FROM ruby:3.1

# Set the working directory inside the container
WORKDIR /app

# Copy the contents of the current directory to /app in the container
COPY . /app/

# Install bundler and install dependencies specified in the Gemfile
RUN gem install bundler && bundle install

# Expose port 3000 (default port for Rails)
EXPOSE 3000

# Set the start command to run the Rails server on port 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
