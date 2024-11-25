#!/bin/bash

git_cheatsheet() {
  echo "git reset --hard (HEAD~1|origin/develop) - Reset without keeping the changes (last commit|Origin branch)"
  echo "git reset --soft (HEAD~1|origin/develop) - Reset keeping the changes staged (last commit|Origin branch)"
  echo "git revert (HEAD|(HEAD^|HEAD~N)..HEAD) - Revert (last commit|(last 2 commits|last N commits))"
}

redis_cheatsheet() {
  echo "redis-cli -h host_name - connecting with cli to redis"
  echo "monitor - realtime information about operations"
  echo "info keyspace - get databases and its information"
  echo "select database - select a database to work on"
  echo "keys * - list all keys on the current database"
  echo "flushdb - delete all keys on the current database"
}

docker_cheatsheet() {
  echo "Docker and Docker Compose File Copying Commands:"
  echo ""
  echo "Docker Commands:"
  echo "docker cp container_id:/path/to/file /host/path - Copy file from container to host"
  echo "docker cp /host/path container_id:/path/to/file - Copy file from host to container"
  echo ""
  echo "Docker Compose Commands:"
  echo "docker compose cp service_name:/path/to/container/file /host/path - Copy file from container to host"
  echo "docker compose cp /host/path service_name:/path/to/container/file - Copy file from host to container"
}

linux_cheatsheet() {
  case "$1" in
  rsync)
    echo "rsync -av --exclude='.git' --exclude='.github' . ../target-dir"
    ;;
  debug)
    echo "strace (https://strace.io/)"
    echo "It is used to monitor and tamper with interactions between processes and the Linux kernel, which include system calls, signal deliveries, and changes of process state."
    echo "strace -p 26380 -- Attach to already running process"
    echo "strace -yy cat /dev/null -- Print paths and more info associated with file descriptors."
    echo "strace -c ls > /dev/null -- Count time, calls, and errors for each system call."
    ;;
  grep)
    echo "grep 'pattern' <file> - Search for a pattern in a file"
    echo "grep -r 'pattern' <directory> - Recursively search for a pattern in a directory"
    echo "grep -i 'pattern' <file> - Perform case-insensitive search"
    echo "grep -v 'pattern' <file> - Invert match, display lines that do not match the pattern"
    ;;
  network)
    echo "ifconfig - Show network interface configuration"
    echo "ping <host> - Send ICMP echo request to a host"
    echo "netstat - Display network connections, routing tables, etc."
    echo "traceroute <host> - Trace route to a host"
    ;;
  zip)
    echo "zip archive.zip file1 file2 - Create a zip archive containing file1 and file2"
    echo "zip -r archive.zip directory - Recursively zip the contents of directory"
    echo "unzip archive.zip - Extract the contents of a zip archive"
    echo "unzip archive.zip -d target_dir - Extract the contents of a zip archive to target_dir"
    echo "zip -u archive.zip file1 - Update file1 in the zip archive"
    ;;
  journalctl)
    echo "journalctl - View all system logs"
    echo "journalctl -u <service> - View logs for a specific service"
    echo "journalctl -b - View logs from the current boot"
    echo "journalctl --since '1 hour ago' - View logs from the last hour"
    echo "journalctl -f - Follow logs in real time (like 'tail -f')"
    echo "journalctl -p <priority> - View logs of a specific priority (e.g., 0 for emergency, 3 for errors)"
    echo "journalctl --disk-usage - Show the disk space used by the journal"
    echo "journalctl --vacuum-size=1G - Reduce journal size to 1GB"
    echo "systemctl list-unit-files | grep enabled"
    echo "journalctl -F _SYSTEMD_UNIT - List services"
    ;;
  *)
    echo "Usage: cheat linux {debug|grep|network|rsync|zip|journalctl}"
    ;;
  esac
}

aws_cheatsheet() {
  case "$1" in
  s3)
    echo "Upload/Download:"
    echo "aws s3 cp s3://bucket-name/file.txt /local/path - Copy file from S3 to local"
    echo "aws s3 cp /local/path/file.txt s3://bucket-name/ - Copy file from local to S3"
    echo "aws s3 cp s3://bucket-name/folder/ /local/folder/ --recursive - Copy folder from S3 to local"
    echo "aws s3 cp /local/folder/ s3://bucket-name/folder/ --recursive - Copy folder from local to S3"
    "List:"
    echo "aws s3 ls s3://bucket-name/ - List objects in a bucket"
    echo "aws s3 ls s3://bucket-name/folder/ - List objects in a specific folder"
    echo "aws s3 ls --summarize --human-readable --recursive s3://bucket/folder/* - Summarize size of a specific folder"
    ;;
  *)
    echo "Usage: cheat aws {s3}"
    ;;
  esac
}

kubernetes_cheatsheet() {
  case "$1" in
  troubleshoot)
    echo "Useful troubleshooting paths"
    ;;
  search)
    echo "k config view -o=jsonpath='{.users[?(@.name==\"aws.user\")]}'"
    echo "k get persistentvolume -o custom-columns='NAME:.metadata.name,CAPACITY:.spec.capacity.storage' --sort-by=.spec.capacity.storage"
    echo "k get nodes -o json | jq 'paths | select(.[-1] == \"osImage\")' -- Returns path to specific key"
    ;;
  *)
    echo "Usage: cheat kubernetes {troubleshoot|search}"
    ;;
  esac

}

ssh_cheatsheet() {
  echo "ssh-keygen -t ed25519 -C \"email@example.com\" -- Create ssh key with ed25519 algorithm"
  echo "ssh-keygen -t rsa -b 4096 -C \"email@example.com\" -- Create ssh key with rsa algorithm"
  echo "ssh -i ~/.ssh/private.pem user@host -- SSH connect specifying ssh key"
  echo "rsync -avz -e \"ssh -i ~/.ssh/private.pem\" -- ~/local/path user@host:/remote/path/ -- Copy files between local and remote using rysnc and ssh"
  echo "scp -i ~/.ssh/private.pem /path/to/local/file user@host:/remote/path/ -- Copy local file to remote"
  echo "scp -i ~/.ssh/private.pem  user@host:/remote/path/ /path/to/local/file -- Copy remote file to local"
}

postgres_cheatsheet() {
  echo "Connecting with psql:"
  echo
  echo "The following env variables are used by psql to connect:"
  echo "export PGUSER=user"
  echo "export PGPASSWORD=password"
  echo "export PGHOST=host"
  echo
  echo "psql -d database_name"
  echo "psql -d database_name -c 'SELECT * FROM table_name'"
  echo
  echo "Database size:"
  echo
  echo "SELECT relname AS "relation", pg_size_pretty(pg_total_relation_size(C.oid)) AS "total_size" FROM pg_class C LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace) WHERE nspname NOT IN ('pg_catalog', 'information_schema') AND C.relkind <> 'i' AND nspname !~ '^pg_toast' ORDER BY pg_total_relation_size(C.oid) DESC LIMIT 50;"
  echo
  echo "Manage users/permissions/databases:"
  echo
  echo "\l -- List databases"
  echo "\d(n|t|u|p|v|f|i|b|x) -- List (schemas|tables|users|privileges|views|functions|indexes|tables|extensions)"
  echo "\d table_name -- Describe specific table"
  echo "\c database_name -- Connect to database"
  echo
  echo "ALTER SCEMA schema_name RENAME to new_schema_name;"
  echo "ALTER TABLE table_name ADD COLUMN date DATE;"
  echo
  echo "CREATE USER user with encrypted password '';"
  echo "DROP USER old_user;"
  echo "GRANT user TO superuser; -- Allow permission to superuser to create database as owner user"
  echo "CREATE DATABASE database_name with OWNER user;"
  echo "ALTER DATABASE database_name OWNER TO owner;"
  echo "REVOKE user FROM superuser;"
  echo "ALTER USER user WITH CREATEDB; -- Allow create databases"
  echo "GRANT pg_signal_backend TO user; -- Allow sending singals to the user"
  echo "GRANT ALL PRIVILEGES ON DATABASE database_name TO user;"
  echo
  echo "Change owner on tables"
  echo "SELECT 'ALTER TABLE '|| schemaname || '.' || tablename ||' OWNER TO newuser;' FROM pg_tables WHERE NOT schemaname IN ('pg_catalog', 'information_schema');"
  echo "\gexec -- executes output of previous command"
  echo
  echo "Change owner on schemas"
  echo "SELECT 'ALTER SCHEMA ' || schema_name || ' OWNER TO newuser;' FROM information_schema.schemata WHERE schema_name NOT IN ('pg_catalog', 'information_schema');"
  echo "\gexec -- executes output of previous command"
  echo
  echo "Change owner on views"
  echo "SELECT 'ALTER VIEW ' || table_schema || '.' || table_name ||' OWNER TO newuser;' FROM information_schema.views WHERE table_schema NOT IN ('pg_catalog', 'information_schema');"
  echo "\gexec -- executes output of previous command"
  echo
  echo "Change owner of sequences"
  echo "SELECT 'ALTER SEQUENCE ' || sequence_schema || '.' || sequence_name || ' OWNER TO newuser;' FROM information_schema.sequences WHERE sequence_schema NOT IN ('pg_catalog', 'information_schema');"
  echo "\gexec -- executes output of previous command"
  echo
  echo "View locks not granted"
  echo "SELECT pid, locktype, relation::regclass, mode, granted FROM pg_locks WHERE NOT granted;"
  echo
  echo "Terminate process"
  echo "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE pid = <blocked_pid>;"
  echo
  echo "Change sequence last value"
  echo "ALTER SEQUENCE sequence_name RESTART WITH 1001;"
}

sql_cheatsheet() {
  echo "SQL Commands Cheat Sheet:"
  echo
  echo "SELECT:"
  echo "SELECT column1, column2 FROM table_name WHERE condition;"
  echo "-- Example:"
  echo "SELECT name, age FROM users WHERE age > 30;"
  echo
  echo "INSERT:"
  echo "INSERT INTO table_name (column1, column2) VALUES (value1, value2);"
  echo "-- Example:"
  echo "INSERT INTO users (name, age) VALUES ('John Doe', 28);"
  echo
  echo "UPDATE:"
  echo "UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;"
  echo "-- Example:"
  echo "UPDATE users SET age = 29 WHERE name = 'John Doe';"
  echo
  echo "DELETE:"
  echo "DELETE FROM table_name WHERE condition;"
  echo "-- Example:"
  echo "DELETE FROM users WHERE age < 18;"
  echo
  echo "CREATE TABLE:"
  echo "CREATE TABLE table_name ("
  echo "  column1 datatype PRIMARY KEY,"
  echo "  column2 datatype,"
  echo "  column3 datatype"
  echo ");"
  echo "-- Example:"
  echo "CREATE TABLE users ("
  echo "  id INT PRIMARY KEY AUTO_INCREMENT,"
  echo "  name VARCHAR(100),"
  echo "  age INT"
  echo ");"
  echo
  echo "ALTER TABLE:"
  echo "ALTER TABLE table_name ADD column_name datatype;"
  echo "-- Example:"
  echo "ALTER TABLE users ADD email VARCHAR(255);"
  echo
  echo "DROP TABLE:"
  echo "DROP TABLE table_name;"
  echo "-- Example:"
  echo "DROP TABLE users;"
  echo
  echo "JOINS:"
  echo "SELECT columns FROM table1"
  echo "JOIN table2 ON table1.column = table2.column;"
  echo "-- Example:"
  echo "SELECT users.name, orders.order_date"
  echo "FROM users"
  echo "JOIN orders ON users.id = orders.user_id;"
}

mysql_cheatsheet() {
  echo "Connecting:"
  echo
  echo "mysql -u \$USER_NAME -h \$HOST_NAME -p"
  echo
  echo "Managing the database:"
  echo
  echo "SHOW DATABASES; -- List databases"
  echo "SELECT user, host FROM mysql.user; -- List users"
  echo "USE database_name; -- Select database"
  echo "SHOW TABLES; -- List tables"
  echo
  echo "DROP DATABASE database_name;"
  echo "DROP USER 'username'@'host';"
  echo
  echo "CREATE USER 'user_name'@'%' IDENTIFIED BY 'password';"
  echo "CREATE DATABASE database_name;"
  echo "GRANT ALL PRIVILEGES ON database_name.* TO 'user_name'@'%';"
  echo "FLUSH PRIVILEGES;"
  echo
  echo "Backup and Restore:"
  echo
  echo "mysqldump -u \$USER_NAME -p database_name > backup.sql -- Backup database"
  echo "mysql -u \$USER_NAME -p database_name < backup.sql -- Restore database"
  echo
}

opensearch_cheatsheet() {
  echo
  echo "Managing indexs:"
  echo
  echo "List all indices:"
  echo "GET _cat/indices?v"
  echo
  echo "Get stats for all indices:"
  echo "GET _stats"
  echo
  echo "Get stats for a specific index:"
  echo "GET index_name/_stats"
  echo
  echo "Delete an index:"
  echo "DELETE index_name"
  echo
  echo "Create an index:"
  echo "PUT index_name"
  echo
  echo "Get index mapping:"
  echo "GET index_name/_mapping"
}

jq_cheatsheet() {
  echo "jq 'paths | select(.[-1] == \"osImage\")' -- Find a path to a json key example:"
  echo "k get nodes -o json | jq 'paths | select(.[-1] == \"osImage\")'"
}

mongo_cheatsheet() {
  echo "Connecting with MongoDB (mongosh):"
  echo
  echo "MongoDB can use the following environment variables:"
  echo "export MONGO_USER=user"
  echo "export MONGO_PASSWORD=password"
  echo "export MONGO_HOST=host"
  echo
  echo "mongosh \$MONGO_HOST -u \$MONGO_USER -p \$MONGO_PASSWORD --authenticationDatabase admin"
  echo
  echo "List databases:"
  echo "show dbs"
  echo
  echo "Switch to a database:"
  echo "use database_name"
  echo
  echo "List collections:"
  echo "show collections"
  echo
  echo "Find documents:"
  echo "db.collection.find() -- Return all documents"
  echo "db.collection.find({field: value}) -- Filter by field"
  echo "db.collection.find().pretty() -- Pretty print JSON results"
  echo
  echo "Complex find operations:"
  echo
  echo "\$or -- Match documents with at least one condition:"
  echo "db.collection.find({\$or: [{field1: value1}, {field2: value2}]})"
  echo
  echo "\$and -- Match documents with all conditions:"
  echo "db.collection.find({\$and: [{field1: value1}, {field2: value2}]})"
  echo
  echo "\$in -- Match documents with values in an array:"
  echo "db.collection.find({field: {\$in: [value1, value2]}})"
  echo
  echo "\$nin -- Exclude documents with values in an array:"
  echo "db.collection.find({field: {\$nin: [value1, value2]}})"
  echo
  echo "\$not -- Invert the effect of a query:"
  echo "db.collection.find({field: {\$not: {operator: value}}})"
  echo
  echo "\$nor -- Match documents that do not satisfy any condition:"
  echo "db.collection.find({\$nor: [{field1: value1}, {field2: value2}]})"
  echo
  echo "\$exists -- Check if a field exists:"
  echo "db.collection.find({field: {\$exists: true}})"
  echo
  echo "\$type -- Filter by BSON type of a field:"
  echo "db.collection.find({field: {\$type: 'string'}})"
  echo
  echo "Find with projections (only return specific fields):"
  echo "db.collection.find({}, {field1: 1, field2: 1})"
  echo
  echo "Insert document:"
  echo "db.collection.insertOne({field1: 'value1', field2: 'value2'})"
  echo "db.collection.insertMany([{field1: 'value1'}, {field2: 'value2'}])"
  echo
  echo "Update document:"
  echo "db.collection.updateOne({filter_field: value}, {\$set: {field: new_value}})"
  echo "db.collection.updateMany({filter_field: value}, {\$set: {field: new_value}})"
  echo
  echo "Delete document:"
  echo "db.collection.deleteOne({field: value})"
  echo "db.collection.deleteMany({field: value})"
  echo
  echo "Aggregation example:"
  echo "db.collection.aggregate(["
  echo "{\$match: {field: value}},"
  echo "{\$group: {_id: '\$field', count: {\$sum: 1}}}"
  echo "])"
  echo
  echo "View indexes:"
  echo "db.collection.getIndexes()"
  echo
  echo "Create index:"
  echo "db.collection.createIndex({field: 1})"
  echo
  echo "Drop collection:"
  echo "db.collection.drop()"
  echo
  echo "Rename collection:"
  echo "db.collection.renameCollection('new_name')"
  echo
  echo "Create a user with permissions:"
  echo "db.createUser({"
  echo "user: 'username',"
  echo "pwd: 'password',"
  echo "roles: [{role: 'readWrite', db: 'database_name'}]"
  echo "})"
  echo
  echo "View current operations:"
  echo "db.currentOp()"
  echo
  echo "Kill an operation:"
  echo "db.killOp(<operation_id>)"
  echo
  echo "Change owner on collections:"
  echo "db.runCommand({"
  echo "collMod: 'collection_name',"
  echo "validator: { \$jsonSchema: { bsonType: 'object', required: ['owner'], properties: { owner: { bsonType: 'string' } } } }"
  echo "})"
}

nvim_cheatsheet() {
  echo
  echo "Search and replace:"
  echo
  echo "%s/searchstring/replacestring/gc"
}

# Main function
cheat() {
  case "$1" in
  linux)
    shift
    linux_cheatsheet "$@"
    ;;
  git)
    git_cheatsheet
    ;;
  redis)
    redis_cheatsheet
    ;;
  kubernetes)
    shift
    kubernetes_cheatsheet "$@"
    ;;
  ssh)
    ssh_cheatsheet
    ;;
  postgres)
    postgres_cheatsheet
    ;;
  mysql)
    mysql_cheatsheet
    ;;
  opensearch)
    opensearch_cheatsheet
    ;;
  jq)
    jq_cheatsheet
    ;;
  docker)
    docker_cheatsheet
    ;;
  aws)
    shift
    aws_cheatsheet "$@"
    ;;
  sql)
    sql_cheatsheet
    ;;
  mongo)
    mongo_cheatsheet
    ;;
  nvim)
    nvim_cheatsheet
    ;;
  *)
    echo "Usage: $0 {linux|git|redis|kubernetes|ssh|postgres|opensearch|mysql|jq|docker|aws|sql|mongo|nvim}"
    ;;
  esac
}
