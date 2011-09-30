-- If necessary, create the grappy database within PostgreSQL.
-- Here are example commands, with the PostgreSQL tools in your path:
--
--	createuser --no-superuser --no-createdb --no-createrole grappy
--	createdb -O grappy grappy

-- Make sure to set a password for the account you created, if any.
-- Here is an example SQL query:
--
--	ALTER ROLE grappy WITH PASSWORD 'something';

-- Then, ingest this file with the command-line interpeter to create
-- the tables used by grappy.
--
--	psql -U grappy grappy < initialize-postgresql.sql

-- You can use any database name and username that is appropriate for
-- your local configuration, so long as you set the relevant configuration
-- options in grappy.conf. There is no trivial mechanism for adjusting
-- the names of the tables themselves.

DROP TABLE greylist;

CREATE TABLE greylist (
                ip TEXT NOT NULL, 
                sender TEXT NOT NULL, 
                recipient TEXT NOT NULL, 
                first INTEGER NOT NULL, 
                last INTEGER NOT NULL,
		count INTEGER NOT NULL,
                PRIMARY KEY (ip,sender,recipient)
                );

DROP TABLE whitelist;

CREATE TABLE whitelist (
		ip TEXT NOT NULL,
		last INTEGER NOT NULL,
		comment TEXT,
                PRIMARY KEY (ip)
		);
