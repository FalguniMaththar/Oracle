create table customers(
    customer_id number primary key,
    name varchar2(15),
    email varchar2(25) unique,
    password varchar2(10),
    phone number(15),
    register_on date default sysdate
)
tablespace users
storage (
    initial 10k
    next 20k
    minextents 1
    maxextents 2
);

-- create table movies (
--     movie_id number primary key ,
--     title varchar2(50),
--     duration number,
--     release_date date
-- )
-- partition by range(release_date)
-- (
--     partition old_movie VALUES less than (date '2020-01-01')
--     tablespace users
--     storage(
--         initial 10k
--         next 20k
--         minextents 1
--         maxextents 2
--     ),
--     partition new_movie VALUES less than(MAXVALUE)
--     tablespace users1
--     storage(
--         initial 10k
--         next 20k
--         minextents 1
--         maxextents 2
--     )
-- );

create table movies (
    movie_id number primary key ,
    title varchar2(50),
    duration number,
    release_date date
)
tablespace users
storage (
    initial 10k
    next 20k
    minextents 1
    maxextents 2
);