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
	*)
		echo "Usage: cheat linux {debug|grep|network|rsync|zip}"
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
	*)
		echo "Usage: $0 {linux|git|redis|kubernetes|ssh|postgres|opensearch|mysql|jq|docker|aws}"
		;;
	esac
}
