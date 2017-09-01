# CampZone

## About the Project

This project came to life with the idea of solving a problem present in summer camps; registration and organization of children. We wanted to create an application that would make this process much simpler by:
- Allowing parents to easily register their children to summer camp
- Allowing camp administration to keep track of all participants and separate them into groups
- Allowing counsellors to have access to all the important information regarding the children of their group, including parent contact information, allergies, etc.

CampZone brings all of these points together into one simple solution in the form of a web application.

### View CampZone Screenshots
!["Splash"](/docs/splash.png)
!["Login Full Screen"](/docs/login.png)
!["Director Dashboard"](/docs/director-dashboard.png)
!["Director Kid Details"](/docs/director-kid.png)

## Web Application Setup

* Run `bundle install`
* Follow database setup then run `bin/rake db:reset`
* Run `bin/rails s -b 0.0.0.0` to start the server
* Open your browser window to localhost:300

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x

## Database Setup

The project currently uses PSQL. As a developer, please create a development database on your local machine called "camper_development"
```psql -d development
CREATE DATABASE camper_development;
```