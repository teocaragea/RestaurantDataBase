---11.Formula?i în  limbaj  natural ?i  implementa?i 5 cereri  SQL  complexece  vor  utiliza,  în ansamblul lor, urm?toarele elemente: 


---afisati numele, anul platii, id-ul comenzii si valoarea platii facute de toti clientii pe nume George si ordonati crescator dupa valoare.
select c.nume,extract(year from cc.data) as Anul_Platii ,cc.order_id,p.valoare from client c join istoric_comenzi ic on(c.client_id= ic.client_id) 
                            join comanda cc on(cc.order_id=ic.order_id)
                            join plata p on(p.plata_id=cc.plata_id)
                            where c.nume like '%George%'
                            order by p.valoare;
                            
---afisati maximul platii facute de fiecare client cu lungimea numelui mai mare decat 5 si gatite de Cheful tudoran
                            
select distinct c.nume,max(p.valoare) from client c join istoric_comenzi ic on(c.client_id= ic.client_id) 
                            join comanda cc on(cc.order_id=ic.order_id)
                            join bucatar b on(b.chef_id=cc.chef_id)
                            join plata p on(p.plata_id=cc.plata_id)
                            where length(c.nume)>5 and c.nume in (select c.nume from client c join istoric_comenzi ic on(c.client_id= ic.client_id) 
                            join comanda cc on(cc.order_id=ic.order_id)
                            join bucatar b on(b.chef_id=cc.chef_id)
                            where b.nume like 'tudoran')
                            group by c.nume;
    

---sa se afiseze valoarea platii,id-ul platii,numarul de zile de la plata, id_ul livrarii(0 in caz ca a fost servita in restaurant si sa se specifice asta) si categoria bucatarului

select p.plata_id,p.valoare,round(sysdate-c.data) as Zile,NVL(c.id_livrare,0),
decode(c.id_livrare,null, 'Comanda a fost adusa de ospatar','Comanda livrata') as Comanda,
CASE
    when b.chef_id=200 then 'Gatita de bucatarul chef'
    when b.chef_id=200 then 'Gatita de masterchef'
    else 'Gatita de ajutorul de bucatar'
end as Bucatar
from plata p join comanda c on(p.plata_id=c.plata_id)
join bucatar b on(b.chef_id=c.chef_id)
where p.valoare >(select avg(valoare) from plata);



--- sa se afiseze mancarurile,ingredientele fara ingrediente de la auchan, ordonate crescator dupa nume si cu un nr de calorii mai mic decat 1000

select m.nume,i.nume from mancare m join ingrediente_mancare im on(m.nume=im.mancare_nume)
                            join ingredient i on(i.nume=im.nume_ingredient) where m.nume in (select m.nume from mancare m join ingrediente_mancare im on(m.nume=im.mancare_nume)
                            join ingredient i on(i.nume=im.nume_ingredient)
                            join furnizor f on(f.furnizor_id=i.furnizor_id) where f.nume like '%auchan%') and calorii<1000
                            order by i.nume;


---sa se afiseze platile cu valoare peste medie ordonate descrescator

WITH temporaryTable(averageValue) as
    (SELECT avg(valoare)
    from plata) 
        SELECT plata_id,valoare
        FROM  plata,temporaryTable
        WHERE plata.valoare > temporaryTable.averageValue
        order by valoare desc;
        


---12.Implementarea a 3 opera?ii de actualizare sau suprimare a datelor utilizând subcereri.


---Sa se mareasca timpul de asteptare cu 10% pentru un fel de mancare cu ingrediente furnizate de saltempo.
update mancare
set timp=timp+timp*0.1
where nume in (select mancare_nume from ingrediente_mancare m join ingredient i on (m.nume_ingredient=i.nume) join furnizor f on(i.furnizor_id=f.furnizor_id) where f.nume like 'saltempo' group by mancare_nume);

---Sa se mareasca cu 20% valoarea platilor facute de clientul Mihai Leca

update plata
set valoare=valoare+valoare*0.2
where plata_id in (select co.plata_id from comanda co join istoric_comenzi ic on(co.order_id=ic.order_id) join client c on(ic.client_id=c.client_id) where c.nume like 'Mihai Leca');

---Sa se rupa colaborarea cu furnizorul cu cele mai putine ingrediente furnizate

delete from furnizor
where furnizor_id=
(select furnizor_id from(
select furnizor_id,count(*)
from ingredient
group by furnizor_id
having count(*)=(select min(cnt) from (select count(*) AS cnt from ingredient group by furnizor_id))));

---13.Crearea unei secven?e ce va fi utilizat?în inserarea înregistr?rilor în tabele(punctul 10).
CREATE SEQUENCE sequence_2
start with 306
increment by 1
minvalue 306
maxvalue 490
cycle;

insert into furnizor(furnizor_id,locatie,nume,nr_telefon) values (sequence_2.nextval,'bucuresti','crissfoods','0751100284');
insert into furnizor(furnizor_id,locatie,nume,nr_telefon) values (sequence_2.nextval,'galati','galmopan','0744884424');

---14.Crearea  unei  vizualiz?ri  compuse.  Da?i  un  exemplu  de  opera?ie  LMD permis?pe vizualizarea respectiv? ?i un exemplu de opera?ie LMD nepermis?.

---tabela compusa
create view furnizori_income AS
select f.nume , sum(i.pret) suma
from furnizor f  join ingredient i on(f.furnizor_id=i.furnizor_id)
group by f.nume;


---exemplu de operatie lmd permisa
SELECT * 
FROM furnizori_income;

---exemplu de operatie lmd nepermisa
update furnizori_income
set suma=2*suma
where nume='magom';


---15.Crearea  unui  index  care  s?optimizeze  o  cerere  de  tip  c?utare  cu  2  criterii.  Specifica?i cererea.

create index idx_furnizor
on bucatar(chef_ID,NUME);


---16.Formula?i în limbaj natural ?i implementa?i în SQL: o cerere ce utilizeaz? opera?ia outer-joinpe minimum 4 tabele ?i dou?cererice utilizeaz? opera?ia division.

---Afisati toate comenzile servite in restaurant si preparate de tudoran
select * from comanda
Minus
select * from comanda where chef_id!=(select chef_id from bucatar where nume='tudoran')
or id_livrare is  NULL;

---Afisati toate mancarurile care nu contin ingrediente de la auchan si au mai putin de 600 calorii
select * from mancare where calorii<600
minus
select m.nume,m.timp,m.calorii from mancare m  join ingrediente_mancare im on(m.nume=im.mancare_nume)
join ingredient i on(i.nume=im.nume_ingredient)
join furnizor f on(f.furnizor_id=i.furnizor_id)
where f.nume='auchan';


---Afisati toate incasarile restaurantului si numele ospatarului care a incasat banii, in cazul in care aceasta comanda a fost servita in restaurant.
select o.nume,sum(p.valoare) from ospatar o full outer join istoric_ospatar io on(o.nume=io.nume)
full outer join comanda c on(c.order_id=io.order_id)
full outer join plata p on(c.plata_id=p.plata_id)
group by o.nume;




