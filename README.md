# README
Please make sure you have:
**Ruby v2.7.4** and **Rails 5.2.8**

If you do not have the correct ruby version-
In your command line run: ```rbenv install 2.7.4``` 
Check to see if you have the correct version by running: ```ruby -v```

If you do not have the correct rails version-
In your command line run: ```gem install rails --version 5.2.8```
Check to see if you have the correct version by running: ```rails -v```

In order to set up the database-
In the terminal type `bundle install`
In your command line run: ```rails db:{drop,create,migrate,seed}```

To run the feature tests-
In your command line run: ```rspec spec/features/ ```

To run the model tests-
In your command line run: ```rspec spec/models/```

To run the entire test suit-
In your command line run: ```bundle exec rspec```
To run the simplecov report-
In your command line run: `open coverage/index.html`

To run the web page: 
In the command line type `rails server`

In your browser navigate to `http://localhost:3000/`


![Schema](/app/assets/images/schema.png)