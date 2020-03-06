-- create database touka;

drop table if exists areas;
drop table if exists counts;
drop table if exists likes;
drop table if exists pages;
drop table if exists sales;
drop table if exists ss_tenants;
drop table if exists tenants;
drop table if exists venues;
drop table if exists visitors;
drop table if exists visits;

create table if not exists areas
(
    "area_id"   serial primary key not null,
    "m2"        int         default null,
    "floor_num" int         default null,
    "tenant_id" int         default null,
    "venue_id"  int         default null,
    "id"        varchar(50) default null,
    "group_id"  varchar(50) default null
);

create table if not exists counts
(
    count_id    serial primary key not null,
    date        timestamp   default null,
    num_ingress int         default null,
    num_transit int         default null,
    area_id     varchar(50) default null
);

create table if not exists likes
(
    like_id    serial primary key not null,
    clean_name varchar(255) default null,
    email      varchar(255) default null
);

create table if not exists pages
(
    page_id    serial primary key not null,
    clean_name varchar(255) default null,
    brand      varchar(255) default null
);

create table if not exists sales
(
    sale_id          serial primary key not null,
    ss_tenant_name   varchar(255) default null,
    date             timestamp    default null,
    num_sales        numeric(16, 2),
    num_transactions int          default null,
    venue_id         int          default null,
    ss_tenant_id     int          default null
);

create table if not exists ss_tenants
(
    ssten_id serial primary key not null,
    "ss_tenant_id" int default null,
    "tenant_id" int default null,
    "area_id" varchar(50) default null,
    "venue_id" int default null
);

create table if not exists tenants
(
    ten_id serial primary key not null,
    id int default null,
    brand varchar(255) default null,
    category varchar(255) default null
);

create table if not exists venues
(
    venue_id serial primary key not null,
    id int default null,
    name varchar(50) default null,
    cluster int default null
);

create table if not exists visitors
(
    visitor_id serial primary key not null,
    email varchar(255) default null,
    gender char(1) default 'M',
    date_of_birth timestamp default null
);

create table if not exists visits
(
    visit_id serial primary key not null,
    date timestamp default null,
    email varchar(255) default null,
    venue_id int default null
);