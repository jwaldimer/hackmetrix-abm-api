FROM ruby:2.7.0

# Copy application code
COPY . /application
# Change to the application's directory
WORKDIR /application

# Set Rails environment to production
ENV RAILS_ENV production

# Install gems
RUN bundle install --deployment --without development test

# Start the application server
ENTRYPOINT ./entrypoint.sh
