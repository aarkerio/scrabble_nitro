# scrabble_nitro

1) Install the aspell dictionary with brew or apt-get
    ```bash
     brew install aspell --lang=en
     ```
2) Clone:
     ```bash
     $ git clone git@github.com:aarkerio/scrabble_nitro.git
     ```
3) Install and launch the rails API
    ```bash
    $ cd scrabble_api_nitrio
    $ bundle install
    $ RAILS_ENV=development bin/bundle exec bin/rails db:create db:migrate
    $ RAILS_ENV=development bin/bundle exec bin/rails s
    ```
4) Install the extension "word_scorer_nitrio_edition" in Chrome.

5) Load a page in a non HTTPS site. Select a word, active the contextual menu. Voila!

Since we are not configured our secure layer, the page can't be from a secure site.
