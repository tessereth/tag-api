# Generic Tagging JSON API
  
This is an implementation of the coding challenge https://gist.github.com/dradford/9407c8c6af5ea3469596 

## Setup

```
bundle install
rails db:create
rails db:migrate
```

## Usage

### Create an Entry

```
curl -H "Accept: application/json" -H "Content-Type: application/json" \
     -d '{"entity_type":"Product", "entity_id":"1234", "tags":["Large", "Pink", "Bike"]}' http://localhost:3000/tag
```

### Retrieve an Entry

```
curl -H "Accept: application/json" -H "Content-Type: application/json" http://localhost:3000/tags/Product/1234
```

### Remove an Entry

```
curl -H "Accept: application/json" -H "Content-Type: application/json" -X DELETE http://localhost:3000/tags/Product/1234
```

### Retrieve stats about all Tags

```
curl -H "Accept: application/json" -H "Content-Type: application/json" http://localhost:3000/stats
```

### Retrieve stats about a specific Entity

```
curl -H "Accept: application/json" -H "Content-Type: application/json" http://localhost:3000/stats/Product/1234
```

Note: This returns the same info at `/stats` but only for tags associated with this entity

## Tests

```
bundle exec rspec
```

