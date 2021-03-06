USE [HIS2018]
GO
/****** Object:  StoredProcedure [dbo].[SP_ADMIN_PROFILAXIS_ANTIPARASITARIA]    Script Date: 1/26/2019 10:20:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_ADMIN_PROFILAXIS_ANTIPARASITARIA]
	-- Add the parameters for the stored procedure here
	@picked varchar(50),
	@red varchar(100),
	@mred varchar(100),
	@provincia varchar(100),
	@distrito varchar(100),
	@establecimiento int,
	@startDate date,
	@endDate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--SET @month = '10';

    -- Insert statements for procedure here
	SELECT ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist, convert(date,Fecha) as fecha,
---IV. ADMINISTRACIÓN DE PROFILAXIS ANTIPARASITARIA-------------------------------------------------
---Administración de Profilaxis Antiparasitaria

---TD= D + DX= Z292 + LAB=1 DE--- 1AÑO

SUM( CASE WHEN EDAD=101 AND ((CODIGO1='Z292' AND LABCONF1='1' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='1' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='1' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='1' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='1' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_1A_LAB1',--Administración de Profilaxis Antiparasitaria

SUM( CASE WHEN EDAD=101 AND ((CODIGO1='Z292' AND LABCONF1='2' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='2' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='2' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='2' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='2' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_1A_LAB2',--Administración de Profilaxis Antiparasitaria


---D= D + DX= Z292 + LAB=1	----TD= D + DX= Z292 + LAB=2  2 AÑOS

SUM( CASE WHEN EDAD=102 AND ((CODIGO1='Z292' AND LABCONF1='1' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='1' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='1' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='1' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='1' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_2A_LAB1',--Administración de Profilaxis Antiparasitaria

SUM( CASE WHEN EDAD=102 AND ((CODIGO1='Z292' AND LABCONF1='2' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='2' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='2' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='2' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='2' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_2A_LAB2',--Administración de Profilaxis Antiparasitaria


---D= D + DX= Z292 + LAB=1	----TD= D + DX= Z292 + LAB=2  3 AÑOS

SUM( CASE WHEN EDAD=103 AND ((CODIGO1='Z292' AND LABCONF1='1' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='1' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='1' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='1' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='1' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_3A_LAB1',--Administración de Profilaxis Antiparasitaria

SUM( CASE WHEN EDAD=103 AND ((CODIGO1='Z292' AND LABCONF1='2' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='2' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='2' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='2' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='2' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_3A_LAB2',--Administración de Profilaxis Antiparasitaria


---D= D + DX= Z292 + LAB=1	----TD= D + DX= Z292 + LAB=2  4 AÑOS

SUM( CASE WHEN EDAD=104 AND ((CODIGO1='Z292' AND LABCONF1='1' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='1' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='1' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='1' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='1' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_4A_LAB1',--Administración de Profilaxis Antiparasitaria

SUM( CASE WHEN EDAD=104 AND ((CODIGO1='Z292' AND LABCONF1='2' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='2' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='2' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='2' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='2' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_4A_LAB2',--Administración de Profilaxis Antiparasitaria

---D= D + DX= Z292 + LAB=1	----TD= D + DX= Z292 + LAB=2  5 A 11 AÑOS

SUM( CASE WHEN EDAD BETWEEN 105 AND 111 AND ((CODIGO1='Z292' AND LABCONF1='1' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='1' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='1' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='1' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='1' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_5_11a_LAB1',--Administración de Profilaxis Antiparasitaria

SUM( CASE WHEN EDAD BETWEEN 105 AND 111 AND ((CODIGO1='Z292' AND LABCONF1='2' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='2' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='2' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='2' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='2' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_5_11a_LAB2',--Administración de Profilaxis Antiparasitaria

-------GRADES GRUPOS-------------------------------------

SUM (CASE WHEN EDAD BETWEEN 0 AND 111 AND ((CODIGO1='Z292' AND LABCONF1='1' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='1' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='1' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='1' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='1' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_0_11a_LAB1',--Administración de Profilaxis Antiparasitaria
SUM( CASE WHEN EDAD BETWEEN 0 AND 111 AND ((CODIGO1='Z292' AND LABCONF1='2' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='2' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='2' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='2' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='2' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_0_11a_LAB2',--Administración de Profilaxis Antiparasitaria

SUM (CASE WHEN EDAD BETWEEN 112 AND 117 AND ((CODIGO1='Z292' AND LABCONF1='1' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='1' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='1' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='1' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='1' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_12_17a_LAB1',--Administración de Profilaxis Antiparasitaria
SUM( CASE WHEN EDAD BETWEEN 112 AND 117 AND ((CODIGO1='Z292' AND LABCONF1='2' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='2' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='2' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='2' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='2' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_12_17a_LAB2',--Administración de Profilaxis Antiparasitaria

SUM (CASE WHEN EDAD BETWEEN 118 AND 129 AND ((CODIGO1='Z292' AND LABCONF1='1' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='1' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='1' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='1' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='1' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_18_29a_LAB1',--Administración de Profilaxis Antiparasitaria
SUM( CASE WHEN EDAD BETWEEN 118 AND 129 AND ((CODIGO1='Z292' AND LABCONF1='2' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='2' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='2' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='2' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='2' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_18_29a_LAB2',--Administración de Profilaxis Antiparasitaria

SUM (CASE WHEN EDAD BETWEEN 130 AND 159 AND ((CODIGO1='Z292' AND LABCONF1='1' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='1' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='1' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='1' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='1' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_30_59a_LAB1',--Administración de Profilaxis Antiparasitaria
SUM( CASE WHEN EDAD BETWEEN 130 AND 159 AND ((CODIGO1='Z292' AND LABCONF1='2' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='2' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='2' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='2' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='2' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_30_59a_LAB2',--Administración de Profilaxis Antiparasitaria

SUM (CASE WHEN EDAD BETWEEN 160 AND 199 AND ((CODIGO1='Z292' AND LABCONF1='1' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='1' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='1' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='1' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='1' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_60_a_mas_LAB1',--Administración de Profilaxis Antiparasitaria
SUM( CASE WHEN EDAD BETWEEN 160 AND 199 AND ((CODIGO1='Z292' AND LABCONF1='2' AND DIAGNOST1='D' ) OR (CODIGO2='Z292' AND LABCONF2='2' AND DIAGNOST2='D') OR (CODIGO3='Z292' AND LABCONF3='2' AND DIAGNOST3='D') OR (CODIGO4='Z292' AND LABCONF4='2' AND DIAGNOST4='D') OR (CODIGO5='Z292' AND LABCONF5='2' AND DIAGNOST5='D') OR (CODIGO6='Z292' AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 ELSE 0 END) AS 'admin_profilaxis_antiparasitaria_60_a_mas_LAB2'--Administración de Profilaxis Antiparasitaria

FROM his_2018 INNER JOIN ESTABLEC ON  his_2018.COD_ESTAB= ESTABLEC.COD_ESTAB
INNER JOIN red  ON establec.ubi_red = red.Ubi_Red
INNER JOIN mred ON establec.ubi_mred = mred.Ubi_mred
INNER JOIN provincia ON establec.ubi_prov = provincia.Ubi_Prov
INNER JOIN distrito ON establec.ubi_dist = distrito.ubi_dist
WHERE
	( (CAST(ESTABLEC.cod_2000 AS INT) = @establecimiento) AND (convert(date,Fecha) between @startDate and @endDate) )
	OR
	( (red.cod_red = @red) AND (mred.cod_mic = @mred)  AND (convert(date,Fecha) between @startDate and @endDate) )
	OR
	( (red.cod_red = @red)  AND (convert(date,Fecha) between @startDate and @endDate) )
	OR
	( (provincia.cod_prov = @provincia) AND (distrito.cod_dist = @distrito)  AND (convert(date,Fecha) between @startDate and @endDate) )
	OR
	( (provincia.cod_prov = @provincia) AND (convert(date,Fecha) between @startDate and @endDate) )


GROUP BY ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist,Fecha


END
