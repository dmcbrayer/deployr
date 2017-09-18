FROM ruby:2.4.1-slim

# Update Node and other packages
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    npm \
    apt-transport-https \
    curl
RUN npm install -g n npm-check-updates
RUN n stable

# Add yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y \
      yarn \
    && rm -rf /var/lib/apt/lists/*


# Set working directories
RUN mkdir /deployr
WORKDIR /deployr

# Add build manifests and build
ADD Gemfile /deployr/Gemfile
ADD Gemfile.lock /deployr/Gemfile.lock
RUN bundle install

# Add app code
ADD . /deployr