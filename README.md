# scrabble_nitro

1) Install aspell with brew or apt-get

2) Clone:

     $ git clone git@github.com:aarkerio/scrabble_nitro.git

3) Start rails
    $ cd scrabble_api_nitrio
    $ bundle install
    $ RAILS_ENV=development bin/bundle exec bin/rails db:create db:migrate
    $ RAILS_ENV=development bin/bundle exec bin/rails s

4) Install the extension in chrome

5) Load a page in a non HTTPS site. Select a word, active the contextual menu.

Since we are not configured outr secure layer, the page can't be from a secure site.
