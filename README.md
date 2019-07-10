[![Build Status](https://travis-ci.org/SpartaHack/SpartaHack-API.svg?branch=master)](https://travis-ci.org/SpartaHack/SpartaHack-API)
[![Code Climate](https://codeclimate.com/github/SpartaHack/SpartaHack-API/badges/gpa.svg)](https://codeclimate.com/github/SpartaHack/SpartaHack-API)
[![Test Coverage](https://codeclimate.com/github/SpartaHack/SpartaHack-API/badges/coverage.svg)](https://codeclimate.com/github/SpartaHack/SpartaHack-API/coverage)
[![Issue Count](https://codeclimate.com/github/SpartaHack/SpartaHack-API/badges/issue_count.svg)](https://codeclimate.com/github/SpartaHack/SpartaHack-API)


# SpartaHack API
****

**Note**: This repository is no longer being maintained and is therefore being archived.
****

This is a guide for running a local copy of SpartaHack API at http://api.spartahack-api.dev/

### Installation (Mac OS X)

##### Install homebrew
Open terminal and run the following commands in order to install Command Line Tools and homebrew

    xcode-select --install
    
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    
You'll also need some extra libraries installed:

    brew install libtool libxslt libksba openssl

##### Install RVM
Open terminal and run the following command

    \curl -sSL https://get.rvm.io | bash

Close and reopen terminal. Run the following commands        
    
    rvm install 2.2.5

    rvm --default use 2.2.5

And then execute:

    gem install bundle
    
After which we update the gems on the whole system:

    gem update --system


##### Install Postgres
Run the following commands in terminal
    
    brew install postgresql
    
    gem install pg

Now go to http://postgresapp.com/ and install Postgress.app.

##### Run Postgres locally
Open the app and click on `Open psql`. A terminal window should pop up.

Run the following commands

    CREATE ROLE dev NOSUPERUSER CREATEDB NOCREATEROLE INHERIT LOGIN;

    ALTER ROLE dev WITH PASSWORD 'spartahack-api';
    
**Postgres must be running in the background to run SpartaHack API locally.**

##### Running SpartaHack locally

Clone Spartahack API and `cd` into it.

Execute the commands:

    bundle install

    rake db:drop db:create db:migrate

##### Install Pow
Run the following commands to install POW and link it to the SpartaHack API
    
    curl get.pow.cx | sh
    
    cd ~/.pow
    
    ln -s {/path/to/SpartaHack-API/}
    
You're good to go!



### Installation (Linux)
To do.

### Installation (Windows)
Is that a thing? To Do.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
