-- Consultar numero de caracter en codigo ASCII
select chr(65) from dual;

select ascii('d') from dual;

-- Funcion concat
select concat('string_1', 'string_2') from dual;

-- Funcion initcap
select initcap('buenas tardes') from dual;

-- Funcion lower
select lower('MARIA MEDINA') from dual;

-- Funcion upper
select upper('maria medina') from dual;

-- Funcion lpad
select lpad('maria', 28, 'medina') from dual;

-- Funcion rpad
select rpad('maria', 28, 'medina') from dual;

-- Funcion ltrim
select ltrim('maria medina medina', 'ma') from dual;

-- Funcion rtrim
select rtrim('maria medina medina', 'na') from dual;

-- Funcion trim
select trim('       maria     ') from dual;

-- Funcion replace
select replace('wwww.oracle.com', 'w', 'p') from dual;

-- Funcion substr
select substr('wwww.oracle.com', 1, 10) from dual;
select substr('wwww.oracle.com', -3) from dual;

-- Funcion length
select length('www.oracle.com') as ctd from dual;

-- Funcion instr
select instr('curso de oracle sql', 'cle') from dual;

-- Funcion translate 
select translate('maria medina gordillo', 'gro', '123') from dual;
