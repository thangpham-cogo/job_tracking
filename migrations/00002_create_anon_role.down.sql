revoke all privileges on all tables in schema api from web_anon;
revoke all privileges on all sequences in schema api from web_anon;
revoke all on schema api from web_anon;
drop role web_anon;