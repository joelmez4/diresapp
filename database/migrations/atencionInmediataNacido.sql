USE [HIS2018]
GO
/****** Object:  StoredProcedure [dbo].[atencionInmediataNacido]    Script Date: 12/11/2018 2:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[atencionInmediataNacido] @red varchar(50), @microred varchar(50), @provincia varchar(50), @distrito varchar(50), @startDate date, @endDate date
AS

SELECT convert(date, his_2018.FECHA) as fecha, ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist,
--SELECT ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,establec.desc_red,establec.desc_mred,establec.desc_prov,establec.desc_dist,establec.cod_ue,establec.unid_ejec,

-----ATENCIÓN INTEGRAL DE SALUD DEL NIÑO------------------------------------
-------REPORTE MENSUAL DE ACTIVIDADES---------
--- I. ATENCIÓN DEL RECIÉN NACIDO----
----A) Atención Inmediata----

----Atención Inmediata	Sumar LAB1 DE APP140 + DX1= 99460
--ATENCIÓN DEL RECIEN NÁCIDO NORMAL (33305)
--Sumar LAB1 DE APP140 + DX1= 99460


---------------------------------------VALIDADO---------------------------------------------------------------------------------------------------------------

SUM(CASE WHEN((fichafam='APP140' and CODIGO1='99460' and DIAGNOST1 ='D' AND (LABCONF1 >='1' and LABCONF1 < '999')))THEN LABCONF1 ELSE 0 END) +
SUM(CASE WHEN((fichafam='APP140' and CODIGO2='99460' and DIAGNOST2 ='D' and (LABCONF2 >='1' and LABCONF2 < '999')))THEN LABCONF2 ELSE 0 END) +
SUM(CASE WHEN((fichafam='APP140' and CODIGO3='99460' and DIAGNOST3 ='D' and  (LABCONF3 >='1' and LABCONF3 < '999')))THEN LABCONF3 ELSE 0 END) +
SUM(CASE WHEN((fichafam='APP140' and CODIGO4='99460' and DIAGNOST4 ='D' and  (LABCONF4 >='1' and LABCONF4 < '999')))THEN LABCONF4 ELSE 0 END) +
SUM(CASE WHEN((fichafam='APP140' and CODIGO5='99460' and DIAGNOST5 ='D' and  (LABCONF5 >='1' and LABCONF5 < '999')))THEN LABCONF5 ELSE 0 END) +
SUM(CASE WHEN((fichafam='APP140' and CODIGO5='99460' and DIAGNOST5 ='D' and  (LABCONF6 >='1' and LABCONF6 < '999')))
THEN LABCONF6 ELSE 0 END) as 'atc_rn',

----Tamizaje Neonatal (Enfermed. Metabólicas)--
----Sumar LAB2 DE APP140 + DX2= 80099

SUM( CASE WHEN SUBSTRING(FICHAFAM,1,6)='APP140' AND CODIGO2='80099' AND  isnumeric(labconf2)=1 then convert(numeric(6,0),labconf2)
else 0 end) AS 'tamizaje_neonatal',------Tamizaje Neonatal (Enfermed. Metabólicas)

--Tamizaje Visual y Auditivo
---Contar LAB="TVA" DE APP140 + DX1= 99460

SUM( CASE WHEN SUBSTRING(FICHAFAM,1,6)='APP140' AND (CODIGO1='99460' ) AND (LABCONF1='TVA' OR LABCONF2 ='TVA' OR LABCONF3='TVA')
THEN 1 ELSE 0 END) AS 'tamizaje_visual_auditivo',--Tamizaje Visual y Auditivo

----Contacto Piel a Piel con la madre
-- EDAD <= 2M + LAB= CPP

SUM( CASE WHEN EDAD <=52 AND (LABCONF1='CPP' OR LABCONF2='CPP' OR LABCONF3='CPP' OR LABCONF4='CPP' OR LABCONF5='CPP' OR LABCONF6='CPP')
THEN 1 ELSE 0 END) AS  'contacto_piel_madre',--Contacto Piel a Piel con la madre

---Alojamiento Conjunto
---EDAD <= 2M + LAB= AC

SUM( CASE WHEN EDAD <=52 AND (LABCONF1='AC' OR LABCONF2='AC' OR LABCONF3='AC' OR LABCONF4='AC' OR LABCONF5='AC' OR LABCONF6='AC')
THEN 1 ELSE 0 END) AS  'alojamiento_conjunto',--Alojamiento Conjunto

--Lactancia Materna en la 1º Hora
----EDAD <= 2M + TD=D + DX= Z391

SUM( CASE WHEN EDAD <=52 AND
((CODIGO1 IN ('Z391') AND DIAGNOST1='D') OR
(CODIGO2 IN ('Z391') AND DIAGNOST2='D') OR
(CODIGO3 IN ('Z391') AND DIAGNOST3='D') OR
(CODIGO4 IN ('Z391') AND DIAGNOST4='D') OR
(CODIGO5 IN ('Z391') AND DIAGNOST5='D') OR
(CODIGO6 IN ('Z391') AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'lactancia_materna_una_hora',--Lactancia Materna en la 1º Hora

---B) Resultados del Tamizaje Neonatal
--Hipotiroidismo Congénito
--	EDAD< 3M + TD=D + DX= E00

SUM( CASE WHEN EDAD <53 AND ((SUBSTRING(CODIGO1,1,3) IN('E00') AND DIAGNOST1='D') OR (SUBSTRING(CODIGO2,1,3) IN('E00') AND DIAGNOST2='D') OR (SUBSTRING(CODIGO3,1,3) IN('E00') AND DIAGNOST3='D') OR (SUBSTRING(CODIGO4,1,3) IN('E00') AND DIAGNOST4='D') OR (SUBSTRING(CODIGO5,1,3) IN('E00') AND DIAGNOST5='D') OR (SUBSTRING(CODIGO6,1,3) IN('E00') AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'hipotiroidismo_congenito',--Hipotiroidismo Congénito

----Fenilcetonuria
--EDAD< 3M + TD=D + DX= E700

SUM( CASE WHEN EDAD <53 AND ((SUBSTRING(CODIGO1,1,3) IN('E700') AND DIAGNOST1='D') OR (SUBSTRING(CODIGO2,1,3) IN('E700') AND DIAGNOST2='D') OR (SUBSTRING(CODIGO3,1,3) IN('E700') AND DIAGNOST3='D') OR (SUBSTRING(CODIGO4,1,3) IN('E700') AND DIAGNOST4='D') OR (SUBSTRING(CODIGO5,1,3) IN('E700') AND DIAGNOST5='D') OR (SUBSTRING(CODIGO6,1,3) IN('E700') AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'fenilcetonuria',--Fenilcetonuria

---Galactosemia	EDAD< 3M + TD=D + DX= E742

SUM( CASE WHEN EDAD <53 AND ((SUBSTRING(CODIGO1,1,3) IN('E742') AND DIAGNOST1='D') OR (SUBSTRING(CODIGO2,1,3) IN('E742') AND DIAGNOST2='D') OR (SUBSTRING(CODIGO3,1,3) IN('E742') AND DIAGNOST3='D') OR (SUBSTRING(CODIGO4,1,3) IN('E742') AND DIAGNOST4='D') OR (SUBSTRING(CODIGO5,1,3) IN('E742') AND DIAGNOST5='D') OR (SUBSTRING(CODIGO6,1,3) IN('E742') AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'galactosemia',--Galactosemia

--Hiperplasia Suprarrenal Congénita	EDAD< 3M + TD=D + DX= E250, E278

SUM( CASE WHEN EDAD<53 AND
((CODIGO1 IN ('E250','E278') AND DIAGNOST1='D') OR
(CODIGO2 IN ('E250','E278') AND DIAGNOST2='D') OR
(CODIGO3 IN ('E250','E278') AND DIAGNOST3='D') OR
(CODIGO4 IN ('E250','E278') AND DIAGNOST4='D') OR
(CODIGO5 IN ('E250','E278') AND DIAGNOST5='D') OR
(CODIGO6 IN ('E250','E278') AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'hiperplasia_suprarrenal_congenita',--Hiperplasia Suprarrenal Congénita

---Fibrosis Quística EDAD< 3M + TD=D + DX= E84

SUM( CASE WHEN EDAD <53 AND ((SUBSTRING(CODIGO1,1,3) IN('E84') AND DIAGNOST1='D') OR (SUBSTRING(CODIGO2,1,3) IN('E84') AND DIAGNOST2='D') OR (SUBSTRING(CODIGO3,1,3) IN('E84') AND DIAGNOST3='D') OR (SUBSTRING(CODIGO4,1,3) IN('E84') AND DIAGNOST4='D') OR (SUBSTRING(CODIGO5,1,3) IN('E84') AND DIAGNOST5='D') OR (SUBSTRING(CODIGO6,1,3) IN('E84') AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'fibrosis_quistica',--Fibrosis Quística

---Catarata Congénita EDAD< 3M + TD=D + DX= Q120, H269

SUM( CASE WHEN EDAD<53 AND
((CODIGO1 IN ('Q120','H269') AND DIAGNOST1='D') OR
(CODIGO2 IN ('Q120','H269') AND DIAGNOST2='D') OR
(CODIGO3 IN ('Q120','H269') AND DIAGNOST3='D') OR
(CODIGO4 IN ('Q120','H269') AND DIAGNOST4='D') OR
(CODIGO5 IN ('Q120','H269') AND DIAGNOST5='D') OR
(CODIGO6 IN ('Q120','H269') AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'catarata_congenita',--Catarata Congénita

---Hipoacusia (todas las clasificaciones)	EDAD< 3M + TD=D + DX= H90, H91

SUM( CASE WHEN EDAD <53 AND ((SUBSTRING(CODIGO1,1,3) IN('H90','H91') AND DIAGNOST1='D') OR (SUBSTRING(CODIGO2,1,3) IN('H90','H91') AND DIAGNOST2='D') OR (SUBSTRING(CODIGO3,1,3) IN('H90','H91') AND DIAGNOST3='D') OR (SUBSTRING(CODIGO4,1,3) IN('H90','H91') AND DIAGNOST4='D') OR (SUBSTRING(CODIGO5,1,3) IN('H90','H91') AND DIAGNOST5='D') OR (SUBSTRING(CODIGO6,1,3) IN('H90','H91') AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'hipoacusia',--Hipoacusia (todas las clasificaciones)

---D) Morbilidad Neonatal---------------------------------------------------------------
---Síndrome de Dristres Respiratorio	TD= D + DX= P22

SUM(CASE WHEN (EDAD>=0 AND EDAD <= 28) AND
((CODIGO1 IN('P220','P221','P228','P229','P230','P231','P232','P233','P234','P235','P236','P238','P239','P240') AND DIAGNOST1= 'D') OR
(CODIGO2 IN('P220','P221','P228','P229','P230','P231','P232','P233','P234','P235','P236','P238','P239','P240') AND DIAGNOST2= 'D') OR
(CODIGO3 IN('P220','P221','P228','P229','P230','P231','P232','P233','P234','P235','P236','P238','P239','P240') AND DIAGNOST3= 'D') OR
(CODIGO4 IN('P220','P221','P228','P229','P230','P231','P232','P233','P234','P235','P236','P238','P239','P240') AND DIAGNOST4= 'D') OR
(CODIGO5 IN('P220','P221','P228','P229','P230','P231','P232','P233','P234','P235','P236','P238','P239','P240') AND DIAGNOST5= 'D') OR
(CODIGO6 IN('P220','P221','P228','P229','P230','P231','P232','P233','P234','P235','P236','P238','P239','P240') AND DIAGNOST6= 'D')) THEN 1 ELSE 0 END) as 'sindrome_dristres_respiratorio',

--Síndromes de Aspiración Neonatal	TD= D + DX= P24

SUM( CASE WHEN
((SUBSTRING(CODIGO1,1,3)IN('P24') AND diagnost1='D') OR
(SUBSTRING(codigo2,1,3)IN('P24') AND diagnost2='D') OR
(SUBSTRING(codigo3,1,3)IN('P24') AND diagnost3='D') OR
(SUBSTRING(codigo4,1,3)IN('P24') AND diagnost4='D') OR
(SUBSTRING(codigo5,1,3)IN('P24') AND diagnost5='D') OR
(SUBSTRING(codigo6,1,3)IN('P24') AND diagnost6='D'))
THEN 1 else 0 end) AS 'sindromes_aspiracion_neonatal',--Síndromes de Aspiración Neonatal

-----Asfixia Neonatal	TD= D + DX= P21

SUM( CASE WHEN
((SUBSTRING(CODIGO1,1,3)IN('P21') AND diagnost1='D') OR
(SUBSTRING(codigo2,1,3)IN('P21') AND diagnost2='D') OR
(SUBSTRING(codigo3,1,3)IN('P21') AND diagnost3='D') OR
(SUBSTRING(codigo4,1,3)IN('P21') AND diagnost4='D') OR
(SUBSTRING(codigo5,1,3)IN('P21') AND diagnost5='D') OR
(SUBSTRING(codigo6,1,3)IN('P21') AND diagnost6='D'))
THEN 1 else 0 end) AS 'asfixia_neonatal',--Asfixia Neonatal

------Sepsis Neonatal	TD= D + DX= P36

SUM( CASE WHEN
((SUBSTRING(CODIGO1,1,3)IN('P36') AND diagnost1='D') OR
(SUBSTRING(codigo2,1,3)IN('P36') AND diagnost2='D') OR
(SUBSTRING(codigo3,1,3)IN('P36') AND diagnost3='D') OR
(SUBSTRING(codigo4,1,3)IN('P36') AND diagnost4='D') OR
(SUBSTRING(codigo5,1,3)IN('P36') AND diagnost5='D') OR
(SUBSTRING(codigo6,1,3)IN('P36') AND diagnost6='D'))
THEN 1 else 0 end) AS 'sepsis_neonatal',--Sepsis Neonatal

---Ictericia	TD= D + DX= P58, P59 --

SUM(CASE WHEN (EDAD>=0 AND EDAD <= 28) AND
((CODIGO1 IN('P550','P551','P558','P559','P580','P581','P582','P583','P584','P585','P588','P589','P590','P591','P592','P593','P598','P599','P560') AND DIAGNOST1= 'D') OR
(CODIGO2 IN('P550','P551','P558','P559','P580','P581','P582','P583','P584','P585','P588','P589','P590','P591','P592','P593','P598','P599','P560') AND DIAGNOST2= 'D') OR
(CODIGO3 IN('P550','P551','P558','P559','P580','P581','P582','P583','P584','P585','P588','P589','P590','P591','P592','P593','P598','P599','P560') AND DIAGNOST3= 'D') OR
(CODIGO4 IN('P550','P551','P558','P559','P580','P581','P582','P583','P584','P585','P588','P589','P590','P591','P592','P593','P598','P599','P560') AND DIAGNOST4= 'D') OR
(CODIGO5 IN('P550','P551','P558','P559','P580','P581','P582','P583','P584','P585','P588','P589','P590','P591','P592','P593','P598','P599','P560') AND DIAGNOST5= 'D') OR
(CODIGO6 IN('P550','P551','P558','P559','P580','P581','P582','P583','P584','P585','P588','P589','P590','P591','P592','P593','P598','P599','P560') AND DIAGNOST6= 'D')) THEN 1 ELSE 0 END) as 'ictericia',

----Hipoglucemia	TD= D + DX= P704 corregir

SUM( CASE WHEN
((CODIGO1 IN ('P704') AND DIAGNOST1='D') OR
(CODIGO2 IN ('P704') AND DIAGNOST2='D') OR
(CODIGO3 IN ('P704') AND DIAGNOST3='D') OR
(CODIGO4 IN ('P704') AND DIAGNOST4='D') OR
(CODIGO5 IN ('P704') AND DIAGNOST5='D') OR
(CODIGO6 IN ('P704') AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'hipoglucemia',--Hipoglucemia

--Sífilis Congénita	TD= D + DX= A50

SUM(CASE WHEN (EDAD>=0 AND EDAD <= 28) AND
((CODIGO1 IN('A500','A501','A502','A503','A504','A505','A506','A507','A509') AND DIAGNOST1= 'D') OR
(CODIGO2 IN('A500','A501','A502','A503','A504','A505','A506','A507','A509') AND DIAGNOST2= 'D') OR
(CODIGO3 IN('A500','A501','A502','A503','A504','A505','A506','A507','A509') AND DIAGNOST3= 'D') OR
(CODIGO4 IN('A500','A501','A502','A503','A504','A505','A506','A507','A509') AND DIAGNOST4= 'D') OR
(CODIGO5 IN('A500','A501','A502','A503','A504','A505','A506','A507','A509') AND DIAGNOST5= 'D') OR
(CODIGO6 IN('A500','A501','A502','A503','A504','A505','A506','A507','A509') AND DIAGNOST6= 'D')) THEN 1 ELSE 0 END) as 'sifilis_congenita',

----VIH Expuesto	TD= D + DX= Z206

SUM( CASE WHEN
((CODIGO1 IN ('Z206') AND DIAGNOST1='D') OR
(CODIGO2 IN ('Z206') AND DIAGNOST2='D') OR
(CODIGO3 IN ('Z206') AND DIAGNOST3='D') OR
(CODIGO4 IN ('Z206') AND DIAGNOST4='D') OR
(CODIGO5 IN ('Z206') AND DIAGNOST5='D') OR
(CODIGO6 IN ('Z206') AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'vih_expuesto',--VIH Expuesto

---Retinopatía de la Prematuridad	TD= D + DX= H351

SUM( CASE WHEN
((CODIGO1 IN ('H351') AND DIAGNOST1='D') OR
(CODIGO2 IN ('H351') AND DIAGNOST2='D') OR
(CODIGO3 IN ('H351') AND DIAGNOST3='D') OR
(CODIGO4 IN ('H351') AND DIAGNOST4='D') OR
(CODIGO5 IN ('H351') AND DIAGNOST5='D') OR
(CODIGO6 IN ('H351') AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'retinopatia_prematuridad'--Retinopatía de la Prematuridad


FROM his_2018 INNER JOIN ESTABLEC ON  his_2018.COD_ESTAB= ESTABLEC.COD_ESTAB
INNER JOIN red  ON establec.ubi_red = red.Ubi_Red
INNER JOIN mred ON establec.ubi_mred = mred.Ubi_mred
INNER JOIN provincia ON establec.ubi_prov = provincia.Ubi_Prov
INNER JOIN distrito ON establec.ubi_dist = distrito.ubi_dist

WHERE
	(@provincia IS NULL OR @provincia = '') AND (@microred IS NULL OR @microred = '') AND (convert(date, his_2018.FECHA) between @startDate and @endDate) AND red.cod_red = @red
OR
	(@provincia IS NULL OR @provincia = '') AND (convert(date, his_2018.FECHA) between @startDate and @endDate) AND red.cod_red = @red AND mred.cod_mic = @microred
OR
	(@red IS NULL OR @red = '') AND (@distrito IS NULL OR @distrito = '') AND (convert(date, his_2018.FECHA) between @startDate and @endDate) AND provincia.cod_prov = @provincia
OR
	(@red IS NULL OR @red = '') AND (convert(date, his_2018.FECHA) between @startDate and @endDate) AND (provincia.cod_prov = @provincia AND distrito.cod_dist = @distrito)
OR
	(@red IS NULL OR @red = '') AND (@provincia IS NULL OR @provincia = '') AND (convert(date, his_2018.FECHA) between @startDate and @endDate)

GROUP BY ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist, FECHA


--EXEC [atencionInmediataNacido] @red = '', @microred = '', @provincia = '', @distrito = '', @startDate='2018-01-01', @endDate='2018-01-01'
