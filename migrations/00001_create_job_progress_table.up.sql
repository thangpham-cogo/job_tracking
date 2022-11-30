BEGIN;
create table api.job_progress (
  id serial primary key,
  user_id int not null,
  company_name varchar (50) unique not null
);

create table api.job_stage (
  id serial primary key,
  job_progress_id int not null,
  due timestamptz,
  current boolean not null default false,
  constraint job_progress_fk 
    foreign key (job_progress_id)
    references api.job_progress(id)
    on delete cascade
);

COMMIT;