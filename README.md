golf
=======================
[![Build Status](https://travis-ci.org/khiet/golf.svg?branch=master)](https://travis-ci.org/khiet/golf)

### POST /user_token to authenticate a user

```
# e.g.
curl "http://localhost:3000/user_token" -H "Content-Type: application/json" -X "POST" -d $'{"auth": {"email": "user1@estemity.com", "password": "password123"}}'
{"auth": { "email": "user1@estemity.com", "password": "password123" }}
# => { jwt: "eyJ0eXA.." }
```

### Use JWT in subsequent requests
```
# e.g.
curl "http://localhost:3000/users" -H "Authorization: Bearer eyJ0eXA.."
```
