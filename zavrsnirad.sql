drop database if exists zavrsnirad;
create database zavrsnirad default charset utf8;
use zavrsnirad;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50) not null,
    oib char(11)
);

create table administrator(
    sifra int not null primary key auto_increment,
    osoba int
);

create table clan(
    sifra int not null primary key auto_increment,
    osoba int,
    igrac boolean
);

create table clanak(
    sifra int not null primary key auto_increment,
    naslov varchar(50),
    tekst text,
    administrator int
);

create table komentar(
    sifra int not null primary key auto_increment,
    tekstkomentara varchar(50),
    clanak int,
    clan int,
    administrator int
);

alter table clan add foreign key (osoba) references osoba(sifra);

alter table administrator add foreign key (osoba) references osoba(sifra);

alter table clanak add foreign key (administrator) references administrator(sifra);

alter table komentar add foreign key (clanak) references clanak(sifra);

alter table komentar add foreign key (administrator) references administrator(sifra);

alter table komentar add foreign key (clan) references clan(sifra);

