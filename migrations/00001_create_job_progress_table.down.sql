BEGIN;
truncate table api.job_stage;
drop table api.job_stage;

truncate table api.job_progress;
drop table api.job_progress;
COMMIT;