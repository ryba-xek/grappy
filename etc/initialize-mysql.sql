-- If necessary, create the grappy database within MySQL, and establish
-- a role that can manipulate the database. Here are example SQL queries:
--
--      CREATE DATABASE grappy;
--	USE grappy;
--      GRANT ALL PRIVILEGES ON grappy TO 'grappy'@'localhost' IDENTIFIED BY 'something' WITH GRANT OPTION;

-- Then, ingest this file with the command-line interpeter to create
-- the tables used by grappy.
--
--      mysql -u grappy -p grappy < initialize-mysql.sql

-- You can use any database name and username that is appropriate for
-- your local configuration, so long as you set the relevant configuration
-- options in grappy.conf. There is no trivial mechanism for adjusting
-- the names of the tables themselves.

-- Note that the CREATE TABLE syntax below explicitly sets InnoDB as the
-- table type. It is extremely important that you use a row-level locking
-- type for grappy's tables, otherwise, your performance is likely to
-- degrade significantly, especially if you use the update-whitelist script
-- on a regular basis.

CREATE TABLE greylist (
                ip VARCHAR(45) NOT NULL, 
                sender VARCHAR(100) NOT NULL, 
                recipient VARCHAR(100) NOT NULL, 
                first INTEGER NOT NULL, 
                last INTEGER NOT NULL,
		count INTEGER NOT NULL,
                PRIMARY KEY (ip,sender,recipient)
                ) ENGINE=InnoDB;

CREATE TABLE whitelist (
		ip VARCHAR(45) NOT NULL,
		last INTEGER NOT NULL,
		comment TEXT,
		PRIMARY KEY (ip)
		) ENGINE=InnoDB;

CREATE TABLE `log` (
  `ts` int(11) NOT NULL,
  `ip` char(15) NOT NULL DEFAULT '',
  `sender` varchar(255) NOT NULL DEFAULT '',
  `recipient` varchar(255) NOT NULL DEFAULT '',
  `result` enum('REJECT','DEFER','DEFER_IF_REJECT','DEFER_IF_PERMIT','BCC','DISCARD','DUNNO','FILTER','HOLD','REDIRECT','WARN','') NOT NULL DEFAULT '',
  KEY `ts` (`ts`)
) ENGINE=InnoDB;