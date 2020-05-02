## Docker Config Rails with MySql
  ### For generating Rails skeleton, run
  ```
  docker-compose run web rails new . --force --database=mysql --skip-bundle
  ```
  ### For using Docker in linux, the generated files are owned by root, to change to access rights to current user, run
  ```
  sudo chown -R $USER:$USER .
  ```
  ### For building the Docker Image, run
  ```
  docker-compose build
  ```
  > whenever any configuration file is changed, you need to build the image

  > After building the image, you need to update the config/database.yml with the following
  ```
    default: &default
    adapter: mysql2
    encoding: utf8
    pool: 5
    username: root
    password: "root"
    host: db

    development:
    <<: *default
    database: dev

    test:
    <<: *default
    database: dev

    production:
    <<: *default
    database: dev
    username: testing_app
    password: <%= ENV['TESTING_APP_DATABASE_PASSWORD'] %>
  ```
  ### To boot up the app, run
  ```
  docker-compose up
  ```
  > keep the terminal running, in a seperate terminal run the following command to create the database,
  ```
  docker-compose run web rails db:create
  ```
  **In your browser, open localhost:3000 , you will see the rails welcome screen now!**
