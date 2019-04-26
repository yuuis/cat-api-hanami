# Cat Api Hanami

base api server on Hanami :cat: :cherry_brossom:

## how to build
```sh
  $ docker-compose build
  $ docker-compose run cat bundle exec hanami db prepare
  $ docker-compose up -d
```

## endopoints
  * GET `/cats`
  * POST `/cats`
    * body `name`
  * PUT `/cats/:id` 
    * body `name`
  * DELETE `cats/:id`
