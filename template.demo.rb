gem "blacklight", ">= 5.3.0"

run "bundle config build.nokogiri --use-system-libraries"
run "bundle install"

# run the blacklight install generator
generate 'blacklight:install', '--devise --marc --jettywrapper'

# run the database migrations
rake "db:migrate"

# index some data
rake "jetty:clean"
rake "jetty:start"
rake "blacklight:solr:seed"
rake "jetty:stop"
