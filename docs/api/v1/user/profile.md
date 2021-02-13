# Show Current Logged In User

Get the details of the current logged in user.

**URL** : `/api/v1/user/profile`

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
    "email": "dean@amiapi.com",
    "referral_code": "VE1XLOX-",
    "total_rewarded_amount": 10.0,
    "referral_link": "/api/v1/signup?referral_code=VE1XLOX-"
}
```
