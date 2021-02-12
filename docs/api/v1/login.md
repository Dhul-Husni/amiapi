# Login

Used to collect a JWT Token for a registered User.

**URL** : `/api/v1/login/`

**Method** : `POST`

**Auth required** : NO

**Data constraints**

```json
{
    "email": "[valid email address]",
    "password": "[password in plain text]"
}
```

**Data example**

```json
{
    "email": "dhul@example.com",
    "password": "abcd1234"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNn0.X7FK6Ctflmeqi6-ANXMEcqq5zu0pR0yfgo84nQAjJ0o"
}
```

## Error Response

**Condition** : If 'username' and 'password' combination is wrong.

**Code** : `401 UNAUTHORIZED`

**Content** :

```json
{
    "errors": [
        "invalid_credentials"
    ]
}
```
