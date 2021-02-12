# Show Current User

Get the details of a user by `id` or `:referral_code`.

**URL** : `/api/v1/users/:id`, `/api/v1/users/:referral_code`

**Method** : `GET`

**Auth required** : YES

**Permissions required** : None

## Success Response

**Code** : `200 OK`

**Content examples**

User is retrieved.

```json
{
    "id": 3,
    "username": "dean",
    "email": "dean@juntos.com",
    "referral_code": "VE1XLOX-",
    "total_rewarded_amount": 10.0,
    "referral_link": "/api/v1/signup?referral_code=VE1XLOX-"
}
```

## Error Response

**Condition** : If the user is not found.

**Code** : `404 NOT FOUND`

**Content** :

```json
{
    "error": "Couldn't find the record"
}
```

## Notes

* A user can be retrieved by either their `:referral_code` or `:id`.
