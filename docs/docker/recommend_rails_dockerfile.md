```
FROM ruby:2.7 
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends nodejs 
COPY myapp/Gemfile* /usr/src/app/ 
WORKDIR /usr/src/app 
RUN bundle install  
COPY myapp /usr/src/app/ 
CMD ["bin/rails", "s", "-b", "0.0.0.0"] 
```

It will make use of cache better
Any change in current folder will not rerun bundle install
