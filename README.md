# CampZone

## About the Project

This project came to life with the idea of solving a problem present in summer camps; registration and organization of children. We wanted to create an application that would make this process much simpler by:
- Allowing parents to easily register their children to summer camp
- Allowing camp administration to keep track of all participants and separate them into groups
- Allowing counsellors to have access to all the important information regarding the children of their group, including parent contact information, allergies, etc.

CampZone brings all of these points together into one simple solution in the form of a web application.

### View CampZone Screenshots
!["Screenshot of Splash Page"](#)
!["Screenshot of Login Page Full Screen"](#)
!["Screenshot of Director Dashboard"](#)
!["Screenshot of Director Kids Details"](#)


## User Stories

### Admin

As an Admin,
I want to create a camp,
so I can organize my camp, counsellors, parents, and kids.

As an Admin,
I want to see all kids,
so I can keep track of them.

As an Admin,
I want to see a kid's parents,
so I can keep track of or contact them.

As an Admin,
I want to see all counselors,
so I know who is supposed to be in charge of which kids.

As an Admin,
I want to be able to invite counselors,
so they can help organize the camp.

As an Admin,
I want to see the groups in my camp,
so I have information about each group (kids & counselors).

As an Admin,
I want to create a group,
so I can organize the kids by age.

As an Admin,
I want to see each group and the kids within them,
so I can organize each group individually.

As an Admin,
I want to select a kid and see their information,
so I can know their parents' contact, medical, and other info.

As an Admin,
I want to see a dashboard,
so I know how many kids are enrolled, how much money I made, how many counselors there are, and what activities are planned.

### Counselor

As a Counselor,
I want to select a kid **within my group** and see their information,
so I can know their parents' contact info, medical info, and other info.

As a Counselor,
I want to see all the kids within my group,
so I can organize and count my kids.

### Parents

As a Parent,
I want to create an account,
so I can log into the website.

As a Parent,
I want to register my kid(s),
so I can send them off for the summer.


## Database Setup

The project currently uses PSQL. As a developer, please create a development database on your local machine called "camper_development"
```psql -d development
CREATE DATABASE camper_development;
```

## Test Logins:

*Parent:*
Email: parent@campzone.com
password: password

*Counselor:*
Email: counselor@campzone.com
password: password

*Director:*
Email: admin@couchlyfe.com
password: password
