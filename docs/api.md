# API doc

## Auth

### Регистрация

**Endpoint:**
`POST /signup`

**Body:**
```
{
    "user": {
        "email": "test34@test.com",
        "password": "123456"
    } 
}
```

Ответ:

```
{
    "status": {
        "code": 200,
        "message": "Signed up successfully.",
        "token": "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI2MTFmZjNhZi0wNzgyLTQ5NzQtODhlZC04NmVmODkwYjhjYTIiLCJzdWIiOiI0Iiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNzM3MDQ3NTg4LCJleHAiOjE3MzcwNDkzODh9.duQqXT3zQMih5Lzvo9Jg32a3SjMzQyrlrhA0SL7tXC8",
        "data": {
            "id": 4,
            "email": "test34@test.com"
        }
    }
}
```
### Вход
**Endpoint:**
`POST /login`

**Body:**
```
{
    "user": {
        "email": "test34@test.com",
        "password": "123456"
    } 
}
```

Ответ:

```
{
    "status": {
        "code": 200,
        "message": "Logged in successfully.",
        "token": "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI2MTFmZjNhZi0wNzgyLTQ5NzQtODhlZC04NmVmODkwYjhjYTIiLCJzdWIiOiI0Iiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNzM3MDQ3NjY0LCJleHAiOjE3MzcwNDk0NjR9.YzPR4g5vfIojSQCU86xEEHFNyPcvAgOOYlPS0Hlnb98",
        "data": {
            "user": {
                "id": 4,
                "email": "test34@test.com"
            }
        }
    }
}
```
### Выход
**Endpoint:**
`DELETE /logout`

**Headers:**
```
Authorization: Bearer <token>
```
Ответ:

```
{
    "status": 200,
    "message": "Logged out successfully."
}
```

## Reading statuses

### Все стаутсы юзера

**Endpoint:**
`GET /reading_statuses`

**Headers:**
```
Authorization: Bearer <token>
```
Ответ:
```
[
    {
        "id": 1,
        "user_id": 1,
        "isbn": "5325325",
        "status": "read",
        "created_at": "2025-01-16T15:32:14.010Z",
        "updated_at": "2025-01-16T15:33:15.667Z"
    },
    {
        "id": 2,
        "user_id": 2,
        "isbn": "1488",
        "status": "not read",
        "created_at": "2025-01-16T15:32:27.033Z",
        "updated_at": "2025-01-16T15:32:27.033Z"
    }
]
```
### Просмотр статуса

**Endpoint:** `GET /reading_statuses/:id`
id - это id самого статуса

Ответ:

```
{
    "id": 5,
    "user_id": 2,
    "isbn": "1488",
    "status": "read",
    "created_at": "2025-01-16T17:06:17.386Z",
    "updated_at": "2025-01-16T17:06:17.386Z"
}
```


### Создание нового статуса

**Endpoint:** `POST /reading_statuses`

**Body:**
```
{
  "reading_status": {
    "isbn": "9780140449334",
    "status": "reading"
  }
}
```

Ответ:

```
{
    "id": 5,
    "user_id": 2,
    "isbn": "1488",
    "status": "read",
    "created_at": "2025-01-16T17:06:17.386Z",
    "updated_at": "2025-01-16T17:06:17.386Z"
}
```

### Обновление статуса

**Endpoint:** `PATCH /reading_statuses/:id`

**Body:**
```
{
  "reading_status": {
    "status": "reading"
  }
}
```

Ответ:

```
{
    "user_id": 2,
    "status": "reading",
    "id": 2,
    "isbn": "1488",
    "created_at": "2025-01-16T15:32:27.033Z",
    "updated_at": "2025-01-16T17:09:16.174Z"
}
```
### Удаление статуса (добавил на всякий)
**Endpoint:** `DELETE /reading_statuses/:id`
id - это id самого статуса


Ответ: 204 No Content

## Comments

### Все комменты книги или текущего юзера

**Endpoints:**

`GET /comments` - комменты юзера

`GET /comments?isbn=123` - комменты книги

**Headers:**
```
Authorization: Bearer <token>
```
Ответ:
```
[
    {
        "id": 1,
        "user_id": 4,
        "isbn": "9780140449334",
        "content": "govno",
        "created_at": "2025-01-16T17:37:54.018Z",
        "updated_at": "2025-01-16T17:43:45.419Z",
        "user_email": "test34@test.com"

    },
    {
        "id": 3,
        "user_id": 4,
        "isbn": "d23e2e",
        "content": "nice",
        "created_at": "2025-01-16T17:41:55.866Z",
        "updated_at": "2025-01-16T17:41:55.866Z",
        "user_email": "test34@test.com"
    }
]
```
### Просмотр коммента

**Endpoint:** `GET /comments/:id`
id - это id самого коммента

Ответ:

```
{
    "id": 3,
    "user_id": 4,
    "isbn": "d23e2e",
    "content": "nice",
    "created_at": "2025-01-16T17:41:55.866Z",
    "updated_at": "2025-01-16T17:41:55.866Z",
    "user_email": "test34@test.com"
}
```


### Создание нового коммента

**Endpoint:** `POST /comments`

**Body:**
```
{
  "comment": {
    "isbn": "d23e2e",
    "content": "norm"
  }
}
```

Ответ:

```
{
    "id": 3,
    "user_id": 4,
    "isbn": "d23e2e",
    "content": "norm",
    "created_at": "2025-01-16T17:41:55.866Z",
    "updated_at": "2025-01-16T17:41:55.866Z",
    "user_email": "test34@test.com"
}
```

### Обновление коммента

**Endpoint:** `PATCH /comments/:id`

**Body:**
```
{
  "comment": {
    "content": "ne norm"
  }
}
```

Ответ:

```
{
    "user_id": 4,
    "content": "ne norm",
    "id": 3,
    "isbn": "d23e2e",
    "created_at": "2025-01-16T17:41:55.866Z",
    "updated_at": "2025-01-16T17:56:35.026Z",
    "user_email": "test34@test.com"
}
```
### Удаление коммента
**Endpoint:** `DELETE /comments/:id`

Ответ: 204 No Content
