# Use official Ruby image
FROM ruby:3.1

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs yarn

# Copy the Gemfile and Gemfile.lock first to leverage Docker caching
#COPY Gemfile Gemfile.lock ./

# Install Bundler and gems
RUN gem install bundler && bundle install --jobs 4 --retry 3

# Copy the rest of the app
COPY . .

# Expose port 3000
EXPOSE 3000

# Precompile assets (optional, needed if using Rails with assets)
RUN bundle exec rake assets:precompile

# Start Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
