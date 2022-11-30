create role web_anon nologin;

grant usage on schema api to web_anon;
grant select, insert, update, delete on all tables in schema api to web_anon;
grant usage, select on all sequences in schema api to web_anon;
