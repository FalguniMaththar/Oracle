-- For Customers
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
-- For Movies
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

--- 3. screens
create table screens (
    screen_id    number primary key,
    name         varchar2(100),
    location     varchar2(150),
    total_seats  number not null
)
tablespace users
storage (
    initial 10k
    next 20k
    minextents 1
    maxextents 2
);

--- 4. shows
create table shows (
    show_id      number primary key,
    movie_id     number references movies(movie_id),
    screen_id    number references screens(screen_id),
    show_time    timestamp,
    price        number(8,2)
)
tablespace users
storage (
    initial 10k
    next 20k
    minextents 1
    maxextents 2
);

--- 5. seats
create table seats (
    seat_id      number primary key,
    screen_id    number references screens(screen_id),
    seat_number  varchar2(10)
)
tablespace users
storage (
    initial 10k
    next 20k
    minextents 1
    maxextents 2
);

--- 6. tickets
create table tickets (
    ticket_id     number primary key,
    customer_id   number references customers(customer_id),
    show_id       number references shows(show_id),
    seat_id       number references seats(seat_id),
    booking_time  timestamp default systimestamp,
    ticket_status varchar2(20) default 'BOOKED'
)
tablespace users
storage (
    initial 10k
    next 20k
    minextents 1
    maxextents 2
);

--- 7. payments
create table payments (
    payment_id    number primary key,
    ticket_id     number references tickets(ticket_id),
    amount        number(8,2),
    payment_date  date default sysdate
)
tablespace users
storage (
    initial 10k
    next 20k
    minextents 1
    maxextents 2
);

--- 8. admins
create table admins (
    admin_id      number primary key,
    username      varchar2(50) unique,
    password      varchar2(100),
    created_on    date default sysdate
)
tablespace users
storage (
    initial 10k
    next 20k
    minextents 1
    maxextents 2
);