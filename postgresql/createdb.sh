psql -w template1 <<< "CREATE USER ${db_user} WITH PASSWORD '${db_pwd}';"
psql -w template1 <<< "CREATE DATABASE ${db_name};"
psql -w template1 <<< "GRANT ALL PRIVILEGES ON DATABASE ${db_name} TO ${db_user};"
