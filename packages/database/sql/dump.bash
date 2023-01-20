mariadb < ddl.sql
cd data/
mariadb < insert.sql
cd ..
mysqldump vteams -usnaladm -p --routines --triggers > init-database.sql
# mysqldump vteams -usnaladm -p --routines --triggers > init-database.sql
# mysqldump vteams -usnaladm -p --no-create-info --skip-triggers --no-create-db > init-database-data.sql
gsed -i s/localhost/mariadb/gI init-database.sql