gem "blacklight", ">= 5.3.0"

run "bundle config build.nokogiri --use-system-libraries  --with-iconv-dir='/usr/bin' --with-xml2-config='/usr/bin/xml2-config' --with-xslt-config='/usr/bin/xslt-config'"
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
