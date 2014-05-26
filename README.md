# Layer

[![Build Status](https://travis-ci.org/Willianvdv/layer.png)](https://travis-ci.org/Willianvdv/layer)
[![Coverage Status](https://coveralls.io/repos/Willianvdv/layer/badge.png?branch=master)](https://coveralls.io/r/Willianvdv/layer?branch=master)

## Installation

- Install Postgresql (8.1+)
- Create the `config/api_keys.yml` file containing you api keys
- And do some more steps

## Test
```
bundle exec rake test
```

## Run
```
bundle exec rails s
```

## Usage

### Push data to the layer endpoints

#### User data `/api/users`

Fields:
- identifier:string (mandatory)
- properties:hash

##### Create a new user
```
curl -H "Content-Type: application/json" -d '{"user": {"identifier": "1234", "properties": {"favorite_color": "pink"}}}' http://localhost:3000/api/users?api_key=12345
```

#### Item data `/api/items`

Fields:
- identifier:string (mandatory)
- name:string (mandatory)
- properties:hash

##### Create a new item
```
curl -H "Content-Type: application/json" -d '{"item": {"name": "Walkman", "properties": {"color": "pink"}}}' http://localhost:3000/api/items\?api_key\=12345
```

#### Event data
