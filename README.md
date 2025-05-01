# HungryHub API

This is a simple RESTful API built using Ruby on Rails, designed to handle restaurant information for the HungryHub platform. It supports Read and Create operations for restaurant data and includes filtering based on cuisine type.

---

## API Overview

This API allows users to:
- **Read** a list of all restaurants
- **Create** a new restaurant.
- **Search** for restaurants by cuisine type.

The API uses **API key authentication** for secure access.

---

## Setup

### Prerequisites
Preferably have the latest version of Ruby and Rails


### Clone the Repository

```bash
git clone https://github.com/yourusername/hungryhub-api.git
cd hungryhub-api
```

### Set API Key in Rails Credentials
```
bin/rails credentials:edit
```

```
api_key: "your-api-key"
```

When testing with Postman, select Auth Type: "API Key" and set the key to "X-API-KEY"

## API Requests and Responses

### GET /restaurants
   - **Description**: Retrieves a list of all restaurants.

   **Request:**


**Response Success:**
```
[
  {
    "id": 1,
    "name": "Restaurant A",
    "address": "123 Street, City",
    "cuisine_type": "Italian"
  },
  {
    "id": 2,
    "name": "Restaurant B",
    "address": "456 Avenue, City",
    "cuisine_type": "Japanese"
  }
]
```



### POST /restaurants
   **Request:**
```
{
  "name": "Resto 4",
  "cuisine_type": "Korean",
  "address": "1 Plastic Street"
}
```

### Response Success
```
{
    "id": 11,
    "name": "Resto 4",
    "address": "1 Plastic Street",
    "cuisine_type": "Korean",
    "created_at": "2025-05-01T03:40:08.797Z",
    "updated_at": "2025-05-01T03:40:08.797Z"
}
```
### Response (Error - Missing Required Field):
```
{
    "errors": [
        "Name can't be blank"
    ]
}
```

### GET /restaurants/search
**Request:**

```
{
  "cuisine_type": "Italian"
}
```

### Response Success

```
[
    {
        "id": 3,
        "name": "Resto 3",
        "address": "1 Sad Street",
        "cuisine_type": "French",
        "created_at": "2025-04-30T09:37:43.145Z",
        "updated_at": "2025-04-30T09:37:43.145Z"
    },
    {
        "id": 5,
        "name": "Resto 4",
        "address": "",
        "cuisine_type": "French",
        "created_at": "2025-05-01T02:52:27.414Z",
        "updated_at": "2025-05-01T02:52:27.414Z"
    }
]
```

### Response (Error - Missing Required Field):

```
{
    "error": "cuisine_type parameter is required"
}
```










## Testing with Postman

You can test the API using Postman. Here's how to import the Postman collection and environment:

1. **Download the Postman collection** from the `postman/` folder in the repository.

2. **Import the collection into Postman:**
   - Open Postman.
   - Click on the **Import** button.
   - Select the downloaded JSON file.

3. **Set up the environment in Postman:**
   - Set the API Key Value in the Authorization Tab to whatever you set it to earlier.

4. **Run all the requests** in the collection directly from Postman.





