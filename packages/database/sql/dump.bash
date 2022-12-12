mysqldump vteams -usnaladm -p --routines --triggers --no-data > init-database.sql
mysqldump vteams -usnaladm -p --no-create-info --skip-triggers --compact --no-create-db > init-database-data.sql
gsed -i s/localhost/mariadb/gI init-database.sql