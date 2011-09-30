-- should be executed every hour by cron

-- Delete one-hit entries that did not see a retry within 24 hours.

delete from greylist where count=1 and last < UNIX_TIMESTAMP() - 86400;


-- Delete greylist entries that haven't been seen in 7 days.

delete from greylist where last < UNIX_TIMESTAMP() - 604800;


-- Delete whitelist entries that haven't been seen in eight days.
-- The extra day is in case the update-whitelist script is cron'd
-- to run on a weekly basis.

delete from whitelist where last < UNIX_TIMESTAMP() - 691200;
