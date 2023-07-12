FROM ruby:3.2.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory
WORKDIR /app

# Add the Gemfile and Gemfile.lock and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Add the rest of the application code
COPY . .

# Expose the port
EXPOSE 3000
