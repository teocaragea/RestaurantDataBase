create table ingredient(
nume varchar(15) primary key,
pret integer,
furnizor_id integer
);
insert into ingredient(nume,pret,furnizor_id) values ('ardei','5','304');
insert into ingredient(nume,pret,furnizor_id) values ('cabanos','8','303');
insert into ingredient(nume,pret,furnizor_id) values ('ketchup','10','302');
insert into ingredient(nume,pret,furnizor_id) values ('cascaval','12','303');
insert into ingredient(nume,pret,furnizor_id) values ('sunca','25','301');
insert into ingredient(nume,pret,furnizor_id) values ('drojdie','5','300');
insert into ingredient(nume,pret,furnizor_id) values ('peperonii','20','303');
insert into ingredient(nume,pret,furnizor_id) values ('gorgonzola','13','304');
insert into ingredient(nume,pret,furnizor_id) values ('piept de pui','25','303');
insert into ingredient(nume,pret,furnizor_id) values ('ceafa de porc','25','303');
insert into ingredient(nume,pret,furnizor_id) values ('carne de vita','30','303');
insert into ingredient(nume,pret,furnizor_id) values ('rosii','6','304');
insert into ingredient(nume,pret,furnizor_id) values ('sare','3','302');
insert into ingredient(nume,pret,furnizor_id) values ('piper','3','302');
insert into ingredient(nume,pret,furnizor_id) values ('bors','5','300');
insert into ingredient(nume,pret,furnizor_id) values ('orez','3','301');
insert into ingredient(nume,pret,furnizor_id) values ('brocoli','4','305');




create table furnizor(
furnizor_id integer primary key,
locatie varchar(20),
nume varchar(20),
nr_telefon varchar(10)
);

insert into furnizor(furnizor_id,locatie,nume,nr_telefon) values (300,'galati','ginavidor','0758883316');
insert into furnizor(furnizor_id,locatie,nume,nr_telefon) values (301,'galati','gamacris','0754833326');
insert into furnizor(furnizor_id,locatie,nume,nr_telefon) values (302,'bucuresti','cozamin','0758112306');
insert into furnizor(furnizor_id,locatie,nume,nr_telefon) values (303,'bucuresti','saltempo','0759802316');
insert into furnizor(furnizor_id,locatie,nume,nr_telefon) values (304,'buzau','auchan','0750087314');
insert into furnizor(furnizor_id,locatie,nume,nr_telefon) values (305,'vrancea','magom','0752089001');

create table Mancare(
nume varchar(20) primary key,
timp float,
calorii FLOAT
);



insert into mancare(nume,timp,calorii) values ('pizza','20','860');
insert into mancare(nume,timp,calorii) values ('ciorba de legume','12','390');
insert into mancare(nume,timp,calorii) values ('burger','18','519');
insert into mancare(nume,timp,calorii) values ('ceafa de porc','23','681');
insert into mancare(nume,timp,calorii) values ('cartofi prajiti','8','670');
insert into mancare(nume,timp,calorii) values ('piept de pui','20','535');
insert into mancare(nume,timp,calorii) values ('creveti','45','460');




create table ingrediente_mancare(
nume_ingredient varchar(20),
mancare_nume varchar(20),
primary key(nume_ingredient,mancare_nume)
);

insert into ingrediente_mancare(mancare_nume,nume_ingredient) values ('pizza','drojdie');
insert into ingrediente_mancare(mancare_nume,nume_ingredient) values ('pizza','cabanos');
insert into ingrediente_mancare(mancare_nume,nume_ingredient) values ('pizza','ketchup');
insert into ingrediente_mancare(mancare_nume,nume_ingredient) values ('pizza','peperonii');
insert into ingrediente_mancare(mancare_nume,nume_ingredient) values ('pizza','sunca');
insert into ingrediente_mancare(mancare_nume,nume_ingredient) values ('ciorba de legume','bors');
insert into ingrediente_mancare(mancare_nume,nume_ingredient) values ('ciorba de legume','ardei');
insert into ingrediente_mancare(mancare_nume,nume_ingredient) values ('burger','carne de vita');
insert into ingrediente_mancare(mancare_nume,nume_ingredient) values ('piept de pui','piept de pui');
insert into ingrediente_mancare(mancare_nume,nume_ingredient) values ('ceafa de porc','ceafa de porc');



create table livrare(
id_livrare integer primary key,
nume_livrator varchar(20),
masina varchar(20)
);
insert into livrare(id_livrare,nume_livrator,masina) values (100,'marius','toyota');
insert into livrare(id_livrare,nume_livrator,masina) values (102,'marian','dacia');
insert into livrare(id_livrare,nume_livrator,masina) values (103,'liviu','audi');
insert into livrare(id_livrare,nume_livrator,masina) values (104,'razvan','volskwagen');
insert into livrare(id_livrare,nume_livrator,masina) values (105,'george','bmw');

create table plata(
plata_id integer primary key,
valoare float,
order_id integer
);


insert into plata(plata_id,valoare,order_id) values(500,40,1000);
insert into plata(plata_id,valoare,order_id) values(501,25,1001);
insert into plata(plata_id,valoare,order_id) values(502,17,1002);
insert into plata(plata_id,valoare,order_id) values(503,23,1003);
insert into plata(plata_id,valoare,order_id) values(504,20,1004);
insert into plata(plata_id,valoare,order_id) values(505,40,1005);
insert into plata(plata_id,valoare,order_id) values(506,25,1006);
insert into plata(plata_id,valoare,order_id) values(507,17,1007);
insert into plata(plata_id,valoare,order_id) values(508,20,1008);
insert into plata(plata_id,valoare,order_id) values(509,23,1009);
insert into plata(plata_id,valoare,order_id) values(510,25,1010);
insert into plata(plata_id,valoare,order_id) values(511,11,1011);
insert into plata(plata_id,valoare,order_id) values(512,40,1012);
insert into plata(plata_id,valoare,order_id) values(513,11,1013);
insert into plata(plata_id,valoare,order_id) values(514,17,1014);
insert into plata(plata_id,valoare,order_id) values(515,11,1015);


create table bucatar(
chef_id integer primary key,
nume varchar(20),
data_ang date
);

insert into bucatar(chef_id,nume,data_ang) values (200,'tudoran',TO_DATE('12-FEB-2002', 'dd-MON-yyyy'));
insert into bucatar(chef_id,nume,data_ang) values (201,'Gheorghe Victor',TO_DATE('14-DEC-2020', 'dd-MON-yyyy'));
insert into bucatar(chef_id,nume,data_ang) values (202,'Sorin Bontea',TO_DATE('24-JAN-2010', 'dd-MON-yyyy'));
insert into bucatar(chef_id,nume,data_ang) values (203,'Catalin Scarlatescu',TO_DATE('08-JUN-2005', 'dd-MON-yyyy'));
insert into bucatar(chef_id,nume,data_ang) values (204,'Horia Alex',TO_DATE('14-OCT-2017', 'dd-MON-yyyy'));


create table comanda(
order_id integer primary key,
data date,
nume_mancare varchar(20),
plata_id integer,
id_livrare integer,
chef_id integer
);




insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1000,TO_DATE('31-MAY-2012', 'dd-MON-yyyy'),500,NULL,200,'creveti');
insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1001,TO_DATE('11-DEC-2020', 'dd-MON-yyyy'),501,NULL,201,'pizza');
insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1002,TO_DATE('12-Apr-2018', 'dd-MON-yyyy'),502,NULL,202,'burger');
insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1003,TO_DATE('01-JAN-2007', 'dd-MON-yyyy'),503,NULL,203,'ceafa de porc');
insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1004,TO_DATE('23-OCT-2018', 'dd-MON-yyyy'),504,NULL,203,'piept de pui');
insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1005,TO_DATE('24-May-2019', 'dd-MON-yyyy'),505,NULL,202,'creveti');
insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1006,TO_DATE('25-FEB-2020', 'dd-MON-yyyy'),506,NULL,204,'pizza');
insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1007,TO_DATE('11-APR-2021', 'dd-MON-yyyy'),507,NULL,204,'burger');
insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1008,TO_DATE('18-May-2020', 'dd-MON-yyyy'),508,NULL,200,'piept de pui');
insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1009,TO_DATE('30-Dec-2000', 'dd-MON-yyyy'),509,NULL,201,'ceafa de porc');
insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1010,TO_DATE('01-OCT-2009', 'dd-MON-yyyy'),510,100,201,'pizza');
insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1011,TO_DATE('07-APR-2021', 'dd-MON-yyyy'),511,102,202,'ciorba de legume');
insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1012,TO_DATE('06-JUN-2006', 'dd-MON-yyyy'),512,102,200,'creveti');
insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1013,TO_DATE('10-MAY-2007', 'dd-MON-yyyy'),513,101,204,'ciorba de legume');
insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1014,TO_DATE('19-SEP-2008', 'dd-MON-yyyy'),514,103,203,'burger');
insert into comanda(order_id,data,plata_id,id_livrare,chef_id,nume_mancare) values(1015,TO_DATE('21-JUN-2020', 'dd-MON-yyyy'),515,102,203,'ciorba de legume');


create table client(
client_id integer primary key,
nume varchar(20),
nr_telefon varchar(20)
);

insert into client(client_id,nume,nr_telefon) values(700,'George Scarlat',0744675621);
insert into client(client_id,nume,nr_telefon) values(701,'Mihai Scarlat',0744684121);
insert into client(client_id,nume,nr_telefon) values(702,'Marius Hodorogea',0742005621);
insert into client(client_id,nume,nr_telefon) values(703,'Mihai Leca',0745675921);
insert into client(client_id,nume,nr_telefon) values(704,'Alexandra Cimpeanu',0745605121);

create table istoric_comenzi(
order_id integer,
client_id integer,
primary key(order_id,client_id)
);

insert into  istoric_comenzi(order_id,client_id) values(1000,700);
insert into  istoric_comenzi(order_id,client_id) values(1001,701);
insert into  istoric_comenzi(order_id,client_id) values(1002,702);
insert into  istoric_comenzi(order_id,client_id) values(1003,702);
insert into  istoric_comenzi(order_id,client_id) values(1004,701);
insert into  istoric_comenzi(order_id,client_id) values(1005,704);
insert into  istoric_comenzi(order_id,client_id) values(1006,704);
insert into  istoric_comenzi(order_id,client_id) values(1007,702);
insert into  istoric_comenzi(order_id,client_id) values(1008,703);
insert into  istoric_comenzi(order_id,client_id) values(1009,700);
insert into  istoric_comenzi(order_id,client_id) values(1010,700);
insert into  istoric_comenzi(order_id,client_id) values(1011,701);
insert into  istoric_comenzi(order_id,client_id) values(1012,703);
insert into  istoric_comenzi(order_id,client_id) values(1013,704);
insert into  istoric_comenzi(order_id,client_id) values(1014,703);
insert into  istoric_comenzi(order_id,client_id) values(1015,700);



create table istoric_ospatar(
nume varchar(20),
order_id integer,
primary key(nume,order_id)
);

insert into istoric_ospatar(nume,order_id) values('Catalin Rotaru ',1000);
insert into istoric_ospatar(nume,order_id) values('Ionut Vilcu',1001);
insert into istoric_ospatar(nume,order_id) values('Grigore Mihai',1002);
insert into istoric_ospatar(nume,order_id) values('Grigore Mihai',1003);
insert into istoric_ospatar(nume,order_id) values('Viorel Samoila',1004);
insert into istoric_ospatar(nume,order_id) values('Viorel Samoila',1005);
insert into istoric_ospatar(nume,order_id) values('Ionut Vilcu',1006);
insert into istoric_ospatar(nume,order_id) values('Grigore Mihai',1007);
insert into istoric_ospatar(nume,order_id) values('Ionut Vilcu',1008);
insert into istoric_ospatar(nume,order_id) values('Catalin Rotaru ',1009);

create table ospatar(
nume varchar(20) primary key,
varsta integer,
data_ang date
);

insert into ospatar(nume,varsta,data_ang) values ('Ionut Vilcu',18,TO_DATE('10-OCT-2017', 'dd-MON-yyyy'));
insert into ospatar(nume,varsta,data_ang) values ('Catalin Rotaru ',20,TO_DATE('18-OCT-2005', 'dd-MON-yyyy'));
insert into ospatar(nume,varsta,data_ang) values ('Viorel Samoila',22,TO_DATE('10-MAY-2000', 'dd-MON-yyyy'));
insert into ospatar(nume,varsta,data_ang) values ('Grigore Mihai',18,TO_DATE('11-NOV-2020', 'dd-MON-yyyy'));
insert into ospatar(nume,varsta,data_ang) values ('George Marius',31,TO_DATE('31-OCT-2012', 'dd-MON-yyyy'));

create table istoric_rezervare(
id_masa integer,
client_id integer,
data_rezervare date,
primary key(id_masa,client_id)
);

insert into istoric_rezervare(id_masa,client_id,data_rezervare) values (1,700,TO_DATE('31-MAY-2012', 'dd-MON-yyyy'));
insert into istoric_rezervare(id_masa,client_id,data_rezervare) values (2,701,TO_DATE('11-DEC-2020', 'dd-MON-yyyy'));
insert into istoric_rezervare(id_masa,client_id,data_rezervare) values (3,702,TO_DATE('12-Apr-2018', 'dd-MON-yyyy'));
insert into istoric_rezervare(id_masa,client_id,data_rezervare) values (4,700,TO_DATE('01-JAN-2007', 'dd-MON-yyyy'));
insert into istoric_rezervare(id_masa,client_id,data_rezervare) values (2,703,TO_DATE('23-OCT-2018', 'dd-MON-yyyy'));
insert into istoric_rezervare(id_masa,client_id,data_rezervare) values (3,704,TO_DATE('24-May-2019', 'dd-MON-yyyy'));
insert into istoric_rezervare(id_masa,client_id,data_rezervare) values (6,704,TO_DATE('25-FEB-2020', 'dd-MON-yyyy'));
insert into istoric_rezervare(id_masa,client_id,data_rezervare) values (5,702,TO_DATE('11-APR-2021', 'dd-MON-yyyy'));
insert into istoric_rezervare(id_masa,client_id,data_rezervare) values (2,700,TO_DATE('18-May-2020', 'dd-MON-yyyy'));
insert into istoric_rezervare(id_masa,client_id,data_rezervare) values (5,701,TO_DATE('26-JUN-2000', 'dd-MON-yyyy'));

create table masa(
id_masa integer primary key,
nr_persoane integer
);

insert into masa(id_masa, nr_persoane) values(1,4);
insert into masa(id_masa, nr_persoane) values(2,5);
insert into masa(id_masa, nr_persoane) values(3,6);
insert into masa(id_masa, nr_persoane) values(4,4);
insert into masa(id_masa, nr_persoane) values(5,8);
insert into masa(id_masa, nr_persoane) values(6,10);