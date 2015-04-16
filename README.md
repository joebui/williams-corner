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
Currently this is the first set of features of the projects. Therefore, users can only apply CRUD (create, read, update and delete) 
user accounts and products at this stage.

## Known bugs and workaround
- CSS files and JS files cannot be compiled when running on Heroku
- Bootstrap does not work on Heroku

All of the mentioned bugs are successfully fixed.

## Link to the website on Heroku 
https://williams-corner.herokuapp.com
To login as admin, type username as "admin" and password as "aaa". Only admin can access the page to administrate the user accounts and products
(https://williams-corner.herokuapp.com/products)


## References
http://demo.themeum.com/html/eshopper/#


