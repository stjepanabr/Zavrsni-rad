drop database if exists zavrsnirad;
create database zavrsnirad default charset utf8;
use zavrsnirad;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50) not null,
    oib char(11),
    administrator boolean,
    pozicija_u_klubu varchar(50) not null

);


create table clanak(
    sifra int not null primary key auto_increment,
    naslov varchar(50),
    tekst text,
    osoba int
    
);

create table komentar(
    sifra int not null primary key auto_increment,
    tekstkomentara varchar(50),
    clanak int,
    osoba int
    
);



alter table clanak add foreign key (osoba) references osoba(sifra);

alter table komentar add foreign key (clanak) references clanak(sifra);

alter table komentar add foreign key (osoba) references osoba(sifra);

