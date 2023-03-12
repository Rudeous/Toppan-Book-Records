# Toppan-Book-Records
MVP books records system to replace the current paper records a 'local library' has been using

## Local Setup to run application
1. set up postgresSQL database with `init.sql` script under the postgres username, or changing the db credentials as desired in `application.properties`

2. run backend application with 
    ```
    cd backend
    mvn clean
    mvn springboot:run
    ```