# Use an official Ruby image
FROM ruby:3.1

# Set the working directory
WORKDIR /app

# Copy all files from the project into the container
COPY . .

# Install Bundler and dependencies
RUN gem install bundler && bundle install

# Expose the port Railway will use
EXPOSE 3000

# Start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
