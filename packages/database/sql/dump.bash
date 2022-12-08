mysqldump vteams -usnaladm -p --routines --triggers > init-database-data.sql
gsed -i s/localhost/mariadb/gI init-database.sql