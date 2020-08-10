# Hackmetrix ABM Api test

*This is a small project with an Api Auth for handle users data according to his role. The Api handle the creation and authentication of users and gives the data according to his role.*

*The API use Devise and Devise JWT for the authentication and CanCanCan for the permissions.* 

### Getting Started
These instructions will get you a copy of the project up and running on your local machine for testing purposes.

### Prerequisites
You had to have installed the latest version of Ruby (2.7.0) and Ruby on rails (6.0.3.2).

```
gem install rails -v 6.0.3.2
```

### Installing
Clone the app repo.

```
git clone repo_url
```
Run the bundle to install all gems and dependencies.

```
bundle install
```

Run the commands to init the database structure.

```
rails db:create
rails db:migrate
```

Then, run the application with:

```
rails s
```

### Api endpoints

1. SignUp: Create an user into the app.
  ```
  POST /signup
  ```
  format:

  ```
  {
    "user": {
      "email": "email@domain.com",
      "password": "password"
    }
  }
  ```
2. Login: Create a new session for the user. It will rsponnd with a JWT for the authentication.
  ```
  POST /login
  ```
  format:
  ```
  {
    "user": {
      "email": "email@domain.com",
      "password": "password"
    }
  }
  ```
3. Logout: Finish the session for the logged user.
  ```
  DELETE /logout
  ```
4. Get user data: Get the data for the user logged in the app with role different of administrator.
  ```
  GET /api/v1/users/:id
  ```
  *This will need the authorization token for the user in the response header*

5. Set user data: Set the data for a user. This action only can be done for an user with administrator role.
  ```
  PUT /api/v1/users/:id
  ```
  format:
  ```
  {
    "user": {
      "name": "name",
      "last_name": "last name",
      "gender": "gender",
      "description": "Lorem ipsum dolor",
      "role": ["admin", "role1", "role2"] (Use only one of the options) 
    }
  }
  ```
  *This will need the authorization token for the user in the response header*
### Author
* **Jorge Gómez**
