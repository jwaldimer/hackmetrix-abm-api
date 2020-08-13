# Hackmetrix ABM Api test

*This is a small project with an Api Auth for handle users data according to his role. The Api handle the creation and authentication of users and gives the data according to his role.*

*The API use Devise and Devise JWT for the authentication and CanCanCan for the permissions.* 

*Also, the API handle the creation and administration of articles asociated to users*

### Getting Started.
These instructions will get you a copy of the project up and running on your local machine for testing purposes.

### Prerequisites.
You had to have installed the latest version of Ruby (2.7.0) and Ruby on rails (6.0.3.2).

```
gem install rails -v 6.0.3.2
```

### Installing.
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
Run the seed to create an initial test admin user with the email: "user_test_admin@email.com" and password: "123456" 
```
rails db:seed
```

Then, run the application with:

```
rails s
```

### Api Roles.
The Api handle 4 test roles for the data administration.

**admin:** Uer with the total control of the app, can create users, update his data, create new articles, edited, and read data from any article.

**role1:** Users with this role can read his own user data and can read all articles created.

**role2 and role3:** This user roles only can read his own user data and read his own articles associated.

### Api endpoints.
**Request headers**
For all request you need to send the common header:
```
content-type: application/json
x-content-type-options: nosniff
```

**1. SignUp:** Create an user into the app.
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
  A response of “200 OK” indicating that the request has succeeded.

**2. Login:** Create a new session for the user. It will rsponnd with a JWT for the authentication.
  ```
  POST /login
  ```
  request format:
  ```
  {
    "user": {
      "email": "email@domain.com",
      "password": "password"
    }
  }
  ```
  A response of “200 OK” indicating that the request has succeeded.

  response header:
  ```
  authorization: Bearer eyJhbGciOiJIUzI1NiJ9yJqdGkiOiI0NGMxMzFlYS...
  content-type: application/json; charset=utf-8
  ```
  response format:
  ```
  {
    "id": id,
    "email": "email@domain.com",
    "role": "user_role",
    "jti": "44c131ea-ad15-41b1-a46e-1ea598a6f6bb"
  }
  ```
  > You will need send this authorization token in the header of every request to authenticate into the app and access of all endpoints.  

**3. Logout:** Finish the session for the logged user.
  ```
  DELETE /logout
  ```

**4. Get user data:** Get the data for the user logged in the app with role different of administrator.
  ```
  GET /api/v1/users/:id
  ```
  A response of “200 OK” indicating that the request has succeeded.
  > This will need the authorization token for the user in the response header

**5. Set user data:** Set the data for a user. This action only can be done for an user with administrator role.
  ```
  PUT /api/v1/users/:id
  ```
  request format:
  ```
  {
    "user": {
      "name": "name",
      "last_name": "last name",
      "gender": "gender",
      "description": "Lorem ipsum dolor",
      "role": ("admin", "role1", "role2") (Use only one of the options) 
    }
  }
  ```
  A response of “200 OK” indicating that the request has succeeded.
  > This will need the authorization token for the user in the response header

**6. Create a new Article:** Create a new Article. This action only can be done for a admin user.
  ```
  POST /api/v1/articles
  ```
  request format:
  ```
  {
    "article": {
      "title": "Article title",
      "text": "Lorem ipsum dolor sit amet",
      "user_id": user_id      
    }
  }
  ```
  A response of “200 OK” indicating that the request has succeeded.
  > This will need the authorization token for the user in the response header

**7. Update an Article:** Update the data of an Article. This action only can be done for a admin user.
  ```
  PUT /api/v1/articles/:id
  ```
  request format:
  ```
  {
    "article": {
      "title": "New article title",
      "text": "Lorem ipsum dolor sit amet",
      "user_id": user_id      
    }
  }
  ```
  A response of “200 OK” indicating that the request has succeeded.
  > This will need the authorization token for the user in the response header

**9. Get the data from an Article:** Access to the data from an article. The roles admin and role1 can access to all articles, the role 2 and role 3 only can acess to the Articles associated to his user.
  ```
  GET /api/v1/articles/:id
  ```
  response format:
  ```
  { 
    "id": id,
    "title": "Article title",
    "text": "Lorem ipsum dolor sit amet",
    "user_id": user_id
  }
  ```
  A response of “200 OK” indicating that the request has succeeded.
  > This will need the authorization token for the user in the response header

### Author.
* **Jorge Gómez**
