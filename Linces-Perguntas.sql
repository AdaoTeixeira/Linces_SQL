--Linces.
-- 1 Quais os linces femias (id_lince, nome) que no ultimo control
-- realizado tinham peso superior à media dos controles anteriores. 
CREATE VIEW peso_medio_lince (id_lince, peso_medio) as
select id_lince,AVG (peso) from controlos group by id_lince;
select id_lince, nome from lince L where genero "F"
and (select peso_medio from peso_medio_lince PML where PML.id_lince = L.id_lince)
<
(select peso from controlos C1 where C1.id_lince = L.id_lince
and C1.data =(select MAX(C2:data) from controlos C2
where C2.id_lince = L.id_lince));  


-- 2 Quais os LINCES (id_lince e nome) que já acasalaram entre si.
Select distinct L1.id_pai, L2.nome, L1.id_mae, L3.nome
from LINCES L1, LINCES L2, LINCES L3
where L1.id_pai = L2.id_lince and L1.id_mae = L3.id_lince;

-- 3 Quais os tecnicos (num_tecnico e nome) que em fereveiro de 2016 só 
--fizeram controles a machos.
select num_tecnico, nome from TECNICOS
where num_tecnico in (select C.num_tecnico from CONTROLOS C, LINCES L,
where C.id_lince = L.id_Lince and L.genero ="M"
and C.data between "2016.02.01" and "2016.02.29")




create function vivo(id int) returns bool
begin 
	declare obito data;
	select data_obito into obito from LINCES where id_lince = id;
	if(obito is null) then 
		return true;
	else
		return false;
	end if;
end;

create procedure agendar_controlo (id int, dt data)
begin
	if(vivo(id) and dt > NEW()) then
	insert into CONTROLOS(id_lince, data) value (id, dt);
	commit;
    END if;
END;

create procedure registar_controlo(id int, dt date, tecnico int, peso_reg decimal (4,2),
begin
	UPDATA CONTROLOS set num_tecnico = tecnico, peso = peso_reg, estado = saude
	where id_lince = id and data = dt;
END;
