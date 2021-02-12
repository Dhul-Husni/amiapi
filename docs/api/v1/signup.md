# Signup

Used to register a new user.

**URL** : `/api/v1/signup/`

**Method** : `POST`

**Auth required** : NO

**Data constraints**

```json
{
    "username": "[plain text username]",
    "email": "[valid unused email address]",
    "password": "[password in plain text]"
}
```

**Data example**

```json
{
    "username": "dhul",
    "email": "dhul@example.com",
    "password": "abcd1234"
}
```

## Success Response

**Code** : `201 CREATED`

**Content example**

```json
{
    "id": 27,
    "username": "dhul",
    "email": "dhul@example.com",
    "referral_code": "9GXGUPAJ",
    "total_rewarded_amount": 0.0,
    "referral_link": "/api/v1/signup?referral_code=9GXGUPAJ"
}
```

## Error Response

**Condition** : If 'email' already exists.

**Code** : `400 BAD REQUEST`

**Content** :

```json
{
    "errors": {
        "email": [
            "has already been taken"
        ]
    }
}
```

**Condition** : Username is too short (minimum: 3 characters)

**Code** : `400 BAD REQUEST`

**Content** :

```json
{
    "errors": {
        "username": [
            "is too short (minimum is 3 characters)"
        ]
    }
}
```

**Condition** : Email is of invalid format

**Code** : `400 BAD REQUEST`

**Content** :

```json
{
    "errors": {
        "email": [
            "is invalid"
        ]
    }
}
```
