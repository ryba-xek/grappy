-- should be executed every hour by cron

-- Delete one-hit entries that did not see a retry within 24 hours.

DELETE FROM greylist
	WHERE
	count=1
	AND
	last < DATE_PART('epoch', current_timestamp) - 86400;


-- Delete greylist entries that haven't been seen in 7 days.

DELETE FROM greylist
	WHERE
	last < DATE_PART('epoch', current_timestamp) - 604800;


-- Delete whitelist entries that haven't been seen in eight days.
-- The extra day is in case the update-whitelist script is cron'd
-- to run on a weekly basis.

DELETE FROM whitelist
	WHERE
	last < DATE_PART('epoch', current_timestamp) - 691200;
