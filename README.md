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

## Limitations
Currently this is the sencond phase of the project. Therefore, there are only five domain objects: accounts, products, genres, ratings, order_items.
Users are not able to change the language to be displayed of the website and to get the coupon. 

## Known bugs and workaround
- In the search function of homepage and admin page, users are still not able to perform case-insensitive searching. For example, 
if user wants to search for something named "Abc", he/she has to type "Abc" to get the result, typing "abc" won't display the expected result.
- In the Order page of the admin, in order to update the status of order(s) successfully, the admin has to refresh the page after opening it for 
the first time.

We are not able to solve the problems by the end of phase 2. The team will be working diligently to solve the problems in phase 3.

## Link to the website on Heroku 
https://williams-corner.herokuapp.com

To login as admin, type username as "admin" and password as "aaa". Only admin can access the page to administrate the domian objects listed above.


## References
http://demo.themeum.com/html/eshopper/#


