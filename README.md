# Team members

Bui Quang Dien - s3445846
Doan Thien Phuc - s3463827
Nguyen Nhat Quang - s3461485
Nguyen Vu Hoang - s3445816

## Running Locally

Make sure you have Ruby installed.  Also, install the [Heroku Toolbelt](https://toolbelt.heroku.com/).

```sh
$ cd williams-corner
$ bundle install
$ bundle exec rake db:create db:migrate
$ foreman start web
```

Your app should now be running on [localhost:5000](http://localhost:5000/).

## Deploying to Heroku

```sh
$ heroku create
$ git push heroku master
$ heroku run rake db:migrate
$ heroku open
```

## Testing the project with Rails
Unit testing guide :
Test models:
run command : bundle exec rake test test/models/[test_file_name].rb
Test controllers:
run command : bundle exec rake test test/controllers/[test_file_name].rb

For example : 
bundle exec rake test test/models/accounts_test.rb
bundle exec rake test test/controllers/accounts_controller_test.rb

The results appear in log monitor. The failure does not mean the unit has bugs, it mean the [state_ment] is false. For instance, when the account.name is null, the statement @account.valid is fail.
test "null name" do
    @account.name = ""
    assert @account.valid?, "Test succeeded. Reason for Failure: Name is null."
end

## Limitations
Currently this product is still in beta version. As a result, some information is not available for viewing: Online help, Genres Terms of Use and Company
in the footer of the main page. These information will be available when we handle the system to the client.

## Known bugs and workaround
None

## Link to the website on Heroku 
https://williams-corner.herokuapp.com

To login as admin, type username as "admin" and password as “abc321”. Only admin can access the page to administrate the domian objects listed above.


## References
http://demo.themeum.com/html/eshopper/#


