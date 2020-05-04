create database VendasJoin_turma;
use VendasJoin_turma;

create table clientes(
codigo integer not null primary key,
nome varchar(80) not null,
endereco varchar(120) not null,
cidade varchar(45) not null,
email varchar(100) not null,
idade integer not null
);

insert into clientes(codigo,nome,endereco,cidade,email,idade)
values(1,'luiz henrique','rua bh','belo horizonte','luiz@mito',17);
insert into clientes(codigo,nome,endereco,cidade,email,idade)
values(5555,'carlos','rua jose','belo horizonte','caaa@a',18);
insert into clientes(codigo,nome,endereco,cidade,email,idade)
values(6667,'luiz henrique','rua anao','belo horizonte','reemit@o',19);

create table produtos(
codigo integer not null primary key,
descricao varchar(100) not null,
valor double(9,2) not null,
unidade varchar(20) not null,
quantidade integer not null
);

insert into produtos(codigo,descricao,valor,unidade,quantidade)
values(312312,'isso mesmo q leu',33,'A',55);
insert into produtos(codigo,descricao,valor,unidade,quantidade)
values(412113,'zapzap',63,'B',65);
insert into produtos(codigo,descricao,valor,unidade,quantidade)
values(87864,'manodoceu',53,'C',105);

create table usuarios(
codigo integer not null primary key,
nome varchar(70) not null,
login char(15) not null,
senha char(6)  not null
);

insert into usuarios(codigo,nome,login,senha)
values(21312,'Luiz','Lhuizito',231);
insert into usuarios(codigo,nome,login,senha)
values(4141,'Carlos','Carlao',0001);
insert into usuarios(codigo,nome,login,senha)
values(9865,'Ruben','Rubao',00909);

create table vendas(
numero integer not null primary key,
data_entrega date not null,
data_venda date not null,
valor double(9,2) not null,
clientes_codigo integer not null,
usuarios_codigo integer not null,
foreign key (clientes_codigo) references cliente(codigo),
foreign key (usuarios_codigo) references usuario(codigo)
);

insert into vendas(numero,data_entrega,data_venda,valor,clientes_codigo,usuarios_codigo)
values(31314,'20180102','20190106',31231,1,42321);
insert into vendas(numero,data_entrega,data_venda,valor,clientes_codigo,usuarios_codigo)
values(898312,'20190101','20190106',421421,41212,111123);
insert into vendas(numero,data_entrega,data_venda,valor,clientes_codigo,usuarios_codigo)
values(7765,'20150506','20160901',5556,887,5421);

create table itens_vendas(
codigo integer not null primary key,
quantidade integer not null,
valor_unitario double(9,2) not null,
vendas_numero integer not null,
produtos_codigo integer not null,
foreign key (produtos_codigo) references produtos(codigo),
foreign key (vendas_numero) references vendas(numero)
);

insert into itens_vendas(codigo,quantidade,valor_unitario,vendas_numero,produtos_codigo)
values(312312,2,312123,32123,12321);
insert into itens_vendas(codigo,quantidade,valor_unitario,vendas_numero,produtos_codigo)
values(41231231,88,111213,11123,884128);


create table boletas(
numero integer not null primary key,
descricao varchar(80) not null,
juros double(9,2) not null,
multa double(9,2) not null,
valor double(9,2) not null,
data date not null,
data_vencimento date not null,
vendas_numero integer not null,
foreign key (vendas_numero) references vendas(numero)
);

insert into boletas(numero,descricao,juros,multa,valor,data,data_vencimento,vendas_numero)
values(312312,'produto bom',312,132312,4213412,'20190603','20200708',33);
insert into boletas(numero,descricao,juros,multa,valor,data,data_vencimento,vendas_numero)
values(87554,' bom produto',7612,2312,3412,'20190603','20200708',33);

/*3*/
Select nome,endereco,cidade,valor
From clientes c  
join vendas v  
on c.codigo = v.clientes_codigo;
/*4*/
select nome,login, valor , data_venda
From usuarios u 
join vendas v  
on u.codigo = v.usuarios_codigo;
/*5*/
Select b.descricao, b.valor, b.data 
From vendas v 
join boletas b 
on v.numero = b.vendas_numero;
/*6*/
Select p.descricao, p.valor 
from produtos p
join itens_vendas i
On p.codigo = i.produtos_codigo;
/*7*/
SELECT NOME,ENDERECO ,VALOR 
FROM CLIENTES c
JOIN VENDAS v
ON c.codigo = v.clientes_codigo 
WHERE DATA_VENDA BETWEEN '01/01/2011' AND '20/05/2011';
/*8*/
Select nome, login
From usuarios u join vendas v on u.codigo = v.usuarios_codigo
Where data_venda <= 20110320;
/*9*/
Select nome, max(valor)
From usuarios u 
join vendas v 
on u.codigo = v.usuarios_codigo 
GROUP BY NOME;
/*10*/
Select nome, endereco, cidade, min(valor)
From clientes c
join vendas v 
on c.codigo = v.clientes_codigo
Where data_venda < 20110420 GROUP BY nome,endereco,cidade;
/*11*/
Select descricao, valor 
From produtos p  
join itens_vendas i 
on p.codigo = i.produtos_codigo;
/*12*/
Select sum(valor) AS TOTAL
From clientes c 
join vendas v on c.codigo = v.clientes_codigo
Where cidade='sp';
/*13*/

/*14*/