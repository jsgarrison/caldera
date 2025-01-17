/** facts **/
CREATE TABLE if not exists core_fact (id integer primary key AUTOINCREMENT, property text, value text, score integer, source_id text, link_id integer DEFAULT 0);
CREATE TABLE if not exists core_source (id integer primary key AUTOINCREMENT, name text, UNIQUE(name) ON CONFLICT IGNORE);
CREATE TABLE if not exists core_source_map (id integer primary key AUTOINCREMENT, op_id integer, source_id integer, UNIQUE(op_id, source_id) ON CONFLICT IGNORE);
CREATE TABLE if not exists core_rule (id integer primary key AUTOINCREMENT, action integer, fact text, match text, source_id text);
/** operations **/
CREATE TABLE if not exists core_operation (id integer primary key AUTOINCREMENT, name text, host_group text, adversary_id text, jitter text, start date, finish date, phase integer, autonomous integer, planner integer, state text, allow_untrusted integer);
CREATE TABLE if not exists core_chain (id integer primary key AUTOINCREMENT, op_id integer, paw text, ability integer, jitter integer, command text, executor text, cleanup integer, score integer, status integer, decide date, collect date, finish date, pid integer, UNIQUE(op_id, paw, command));
CREATE TABLE if not exists core_used (id integer primary key AUTOINCREMENT, link_id integer, fact_id integer, UNIQUE(link_id, fact_id) ON CONFLICT IGNORE);
CREATE TABLE if not exists core_result (link_id integer, output text, parsed data);
CREATE TABLE if not exists core_relationship (link_id integer, source integer, edge text, target integer, UNIQUE(link_id, source, edge, target) ON CONFLICT IGNORE);
