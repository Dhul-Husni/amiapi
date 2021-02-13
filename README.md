[![Maintainability](https://api.codeclimate.com/v1/badges/d2da46e3ebbf5a4fbe80/maintainability)](https://codeclimate.com/github/Dhul-Husni/amiapi/maintainability)
[![codecov](https://codecov.io/gh/Dhul-Husni/amiapi/branch/master/graph/badge.svg?token=XY34BNDICT)](https://codecov.io/gh/Dhul-Husni/amiapi)
# Introduction

Boost user conversions with AmiApi. Incentivise users with referral bonuses and rewards on signup.

These docs describe how to use the AmiApi API. We hope you enjoy these docs, and please don't hesitate to [file an issue](https://github.com/dhul-husni/amiapi/issues/new) if you see anything missing.

Demo api running at: [AmiApi](https://amiapi.herokuapp.com/api/v1/status)
## Outline
- [API Documentation](#api-documentation)
    + [Open Endpoints](#open-endpoints)
  + [Endpoints that require Authentication](#endpoints-that-require-authentication)
- [Getting Started](#getting-started)
  * [Cloning](#clone-the-repository)
  * [Install the right ruby version](#check-your-ruby-version)
  * [Install dependencies](#install-dependencies)
  * [Initialize the database](#initialize-the-database)
  * [Serve](#serve)


## API Documentation
AmiApi is a JSON Rest-client with all routes namespaced under `/api/v1`

### Open Endpoints
Open endpoints require no Authentication
- [Status](docs/api/v1/status.md): `GET /api/v1/status`
- [Login](docs/api/v1/login.md): `POST /api/v1/login`
- [Signup](docs/api/v1/signup.md): `POST /api/v1/signup`

### Endpoints that require Authentication
Closed endpoints require a valid JWT token to be included in the header of the request with the format ```Authorization: Bearer <token>```. A JWT token can be acquired from the Login view above.

- [Retrieve a user](docs/api/v1/users/show.md): `GET /api/v1/users/:id or GET /api/v1/users/:referral_code`
- [Show current logged in user's profile](docs/api/v1/user/profile.md): `GET /api/v1/user/profile`

## Getting Started

### Clone the repository

```shell
git clone https://github.com/Dhul-Husni/amiapi.git
cd amiapi
```

### Check your Ruby version

```shell
ruby -v
```

The output should be `ruby 2.7.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.7.2
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle install
```

### Initialize the database
```shell
cp config/database.yml.example config/database.yml
```

Remember to configure `config/database.yml` by replacing the `username` and `password` to your local database user's credentials

```shell
rails db:create db:migrate db:seed
```

## Serve

```shell
rails s
```
