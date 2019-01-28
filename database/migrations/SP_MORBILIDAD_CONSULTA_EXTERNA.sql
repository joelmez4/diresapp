USE [HIS2018]
GO
/****** Object:  StoredProcedure [dbo].[SP_MORBILIDAD_CONSULTA_EXTERNA]    Script Date: 1/28/2019 12:34:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_MORBILIDAD_CONSULTA_EXTERNA]
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

    -- Insert statements for procedure here

	SET LANGUAGE SPANISH
SELECT DISTINCT GRUPO.COD_GRU,GRUPO.DESC_GRU,ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist,datename(month,fecha) as meses,


--codigo1--

SUM(CASE WHEN EDAD BETWEEN 0 AND 111 THEN 1 ELSE 0 END) AS 'morb_0_11a_nino',
SUM(CASE WHEN EDAD BETWEEN 112 AND 117 THEN 1 ELSE 0 END) AS 'morb_12_17a_adolescente',
SUM(CASE WHEN EDAD BETWEEN 118 AND 129 THEN 1 ELSE 0 END) AS 'morb_18_29a_joven',
SUM(CASE WHEN EDAD BETWEEN 130 AND 159 THEN 1 ELSE 0 END) AS 'morb_30_59a_adulto',
SUM(CASE WHEN EDAD BETWEEN 160 AND 199 THEN 1 ELSE 0 END) AS 'morb_60a_a_mas_adulto_mayor',
SUM(CASE WHEN SUBSTRING(Categoria.COD_CAT,1,1)='O' THEN 1 ELSE 0 END) AS 'morb_materna'


FROM his_2018 INNER JOIN TABDIAG ON his_2018.CODIGO1=TABDIAG.DIAG
INNER JOIN GRUPO ON TABDIAG.COD_GRU=GRUPO.COD_GRU
INNER JOIN Categoria  ON TABDIAG.COD_CAT =Categoria.COD_CAT
INNER JOIN ESTABLEC ON  his_2018.COD_ESTAB= ESTABLEC.COD_ESTAB
INNER JOIN red  ON establec.ubi_red = red.Ubi_Red
INNER JOIN mred ON establec.ubi_mred = mred.Ubi_mred
INNER JOIN provincia ON establec.ubi_prov = provincia.Ubi_Prov
INNER JOIN distrito ON establec.ubi_dist = distrito.ubi_dist
WHERE
	( (CAST(ESTABLEC.cod_2000 AS INT) = @establecimiento) AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST1='D'))
	OR
	( (red.cod_red = @red) AND (mred.cod_mic = @mred)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST1='D'))
	OR
	( (red.cod_red = @red)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST1='D'))
	OR
	( (provincia.cod_prov = @provincia) AND (distrito.cod_dist = @distrito)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST1='D'))
	OR
	( (provincia.cod_prov = @provincia) AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST1='D'))
GROUP BY GRUPO.COD_GRU,GRUPO.DESC_GRU,ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist,datename(month,fecha)

---codigo2

UNION ALL

SELECT DISTINCT GRUPO.COD_GRU,GRUPO.DESC_GRU,ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist,datename(month,fecha) as meses,

SUM(CASE WHEN EDAD BETWEEN 0 AND 111 THEN 1 ELSE 0 END) AS 'morb_0_11a_nino',
SUM(CASE WHEN EDAD BETWEEN 112 AND 117 THEN 1 ELSE 0 END) AS 'morb_12_17a_adolescente',
SUM(CASE WHEN EDAD BETWEEN 118 AND 129 THEN 1 ELSE 0 END) AS 'morb_18_29a_joven',
SUM(CASE WHEN EDAD BETWEEN 130 AND 159 THEN 1 ELSE 0 END) AS 'morb_30_59a_adulto',
SUM(CASE WHEN EDAD BETWEEN 160 AND 199 THEN 1 ELSE 0 END) AS 'morb_60a_a_mas_adulto_mayor',
SUM(CASE WHEN SUBSTRING(Categoria.COD_CAT,1,1)='O' THEN 1 ELSE 0 END) AS 'morb_materna'

FROM his_2018 INNER JOIN TABDIAG ON his_2018.CODIGO2=TABDIAG.DIAG
INNER JOIN GRUPO ON TABDIAG.COD_GRU=GRUPO.COD_GRU
INNER JOIN Categoria  ON TABDIAG.COD_CAT =Categoria.COD_CAT
INNER JOIN ESTABLEC ON  his_2018.COD_ESTAB= ESTABLEC.COD_ESTAB
INNER JOIN red  ON establec.ubi_red = red.Ubi_Red
INNER JOIN mred ON establec.ubi_mred = mred.Ubi_mred
INNER JOIN provincia ON establec.ubi_prov = provincia.Ubi_Prov
INNER JOIN distrito ON establec.ubi_dist = distrito.ubi_dist
WHERE
	( (CAST(ESTABLEC.cod_2000 AS INT) = @establecimiento) AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST2='D'))
	OR
	( (red.cod_red = @red) AND (mred.cod_mic = @mred)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST2='D'))
	OR
	( (red.cod_red = @red)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST2='D'))
	OR
	( (provincia.cod_prov = @provincia) AND (distrito.cod_dist = @distrito)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST2='D'))
	OR
	( (provincia.cod_prov = @provincia) AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST2='D'))
GROUP BY GRUPO.COD_GRU,GRUPO.DESC_GRU,ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist,datename(month,fecha)

--codigo3

UNION ALL

SELECT DISTINCT GRUPO.COD_GRU,GRUPO.DESC_GRU,ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist,datename(month,fecha) as meses,


SUM(CASE WHEN EDAD BETWEEN 0 AND 111 THEN 1 ELSE 0 END) AS 'morb_0_11a_nino',
SUM(CASE WHEN EDAD BETWEEN 112 AND 117 THEN 1 ELSE 0 END) AS 'morb_12_17a_adolescente',
SUM(CASE WHEN EDAD BETWEEN 118 AND 129 THEN 1 ELSE 0 END) AS 'morb_18_29a_joven',
SUM(CASE WHEN EDAD BETWEEN 130 AND 159 THEN 1 ELSE 0 END) AS 'morb_30_59a_adulto',
SUM(CASE WHEN EDAD BETWEEN 160 AND 199 THEN 1 ELSE 0 END) AS 'morb_60a_a_mas_adulto_mayor',
SUM(CASE WHEN SUBSTRING(Categoria.COD_CAT,1,1)='O' THEN 1 ELSE 0 END) AS 'morb_materna'

FROM his_2018 INNER JOIN TABDIAG ON his_2018.CODIGO3=TABDIAG.DIAG
INNER JOIN GRUPO ON TABDIAG.COD_GRU=GRUPO.COD_GRU
INNER JOIN Categoria  ON TABDIAG.COD_CAT =Categoria.COD_CAT
INNER JOIN ESTABLEC ON  his_2018.COD_ESTAB= ESTABLEC.COD_ESTAB
INNER JOIN red  ON establec.ubi_red = red.Ubi_Red
INNER JOIN mred ON establec.ubi_mred = mred.Ubi_mred
INNER JOIN provincia ON establec.ubi_prov = provincia.Ubi_Prov
INNER JOIN distrito ON establec.ubi_dist = distrito.ubi_dist
WHERE
	( (CAST(ESTABLEC.cod_2000 AS INT) = @establecimiento) AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST3='D'))
	OR
	( (red.cod_red = @red) AND (mred.cod_mic = @mred)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST3='D'))
	OR
	( (red.cod_red = @red)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST3='D'))
	OR
	( (provincia.cod_prov = @provincia) AND (distrito.cod_dist = @distrito)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST3='D'))
	OR
	( (provincia.cod_prov = @provincia) AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST3='D'))
GROUP BY GRUPO.COD_GRU,GRUPO.DESC_GRU,ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist,datename(month,fecha)

--codigo4

UNION ALL

SELECT DISTINCT GRUPO.COD_GRU,GRUPO.DESC_GRU,ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist,datename(month,fecha) as meses,

SUM(CASE WHEN EDAD BETWEEN 0 AND 111 THEN 1 ELSE 0 END) AS 'morb_0_11a_nino',
SUM(CASE WHEN EDAD BETWEEN 112 AND 117 THEN 1 ELSE 0 END) AS 'morb_12_17a_adolescente',
SUM(CASE WHEN EDAD BETWEEN 118 AND 129 THEN 1 ELSE 0 END) AS 'morb_18_29a_joven',
SUM(CASE WHEN EDAD BETWEEN 130 AND 159 THEN 1 ELSE 0 END) AS 'morb_30_59a_adulto',
SUM(CASE WHEN EDAD BETWEEN 160 AND 199 THEN 1 ELSE 0 END) AS 'morb_60a_a_mas_adulto_mayor',
SUM(CASE WHEN SUBSTRING(Categoria.COD_CAT,1,1)='O' THEN 1 ELSE 0 END) AS 'morb_materna'

FROM his_2018 INNER JOIN TABDIAG ON his_2018.CODIGO4=TABDIAG.DIAG
INNER JOIN GRUPO ON TABDIAG.COD_GRU=GRUPO.COD_GRU
INNER JOIN Categoria  ON TABDIAG.COD_CAT =Categoria.COD_CAT
INNER JOIN ESTABLEC ON  his_2018.COD_ESTAB= ESTABLEC.COD_ESTAB
INNER JOIN red  ON establec.ubi_red = red.Ubi_Red
INNER JOIN mred ON establec.ubi_mred = mred.Ubi_mred
INNER JOIN provincia ON establec.ubi_prov = provincia.Ubi_Prov
INNER JOIN distrito ON establec.ubi_dist = distrito.ubi_dist
WHERE
	( (CAST(ESTABLEC.cod_2000 AS INT) = @establecimiento) AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST4='D'))
	OR
	( (red.cod_red = @red) AND (mred.cod_mic = @mred)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST4='D'))
	OR
	( (red.cod_red = @red)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST4='D'))
	OR
	( (provincia.cod_prov = @provincia) AND (distrito.cod_dist = @distrito)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST4='D'))
	OR
	( (provincia.cod_prov = @provincia) AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST4='D'))
GROUP BY GRUPO.COD_GRU,GRUPO.DESC_GRU,ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist,datename(month,fecha)

---Codigo5

UNION ALL

SELECT DISTINCT GRUPO.COD_GRU,GRUPO.DESC_GRU,ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist,datename(month,fecha) as meses,

SUM(CASE WHEN EDAD BETWEEN 0 AND 111 THEN 1 ELSE 0 END) AS 'morb_0_11a_nino',
SUM(CASE WHEN EDAD BETWEEN 112 AND 117 THEN 1 ELSE 0 END) AS 'morb_12_17a_adolescente',
SUM(CASE WHEN EDAD BETWEEN 118 AND 129 THEN 1 ELSE 0 END) AS 'morb_18_29a_joven',
SUM(CASE WHEN EDAD BETWEEN 130 AND 159 THEN 1 ELSE 0 END) AS 'morb_30_59a_adulto',
SUM(CASE WHEN EDAD BETWEEN 160 AND 199 THEN 1 ELSE 0 END) AS 'morb_60a_a_mas_adulto_mayor',
SUM(CASE WHEN SUBSTRING(Categoria.COD_CAT,1,1)='O' THEN 1 ELSE 0 END) AS 'morb_materna'


FROM his_2018 INNER JOIN TABDIAG ON his_2018.CODIGO5=TABDIAG.DIAG
INNER JOIN GRUPO ON TABDIAG.COD_GRU=GRUPO.COD_GRU
INNER JOIN Categoria  ON TABDIAG.COD_CAT =Categoria.COD_CAT
INNER JOIN ESTABLEC ON  his_2018.COD_ESTAB= ESTABLEC.COD_ESTAB
INNER JOIN red  ON establec.ubi_red = red.Ubi_Red
INNER JOIN mred ON establec.ubi_mred = mred.Ubi_mred
INNER JOIN provincia ON establec.ubi_prov = provincia.Ubi_Prov
INNER JOIN distrito ON establec.ubi_dist = distrito.ubi_dist
WHERE
	( (CAST(ESTABLEC.cod_2000 AS INT) = @establecimiento) AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST5='D'))
	OR
	( (red.cod_red = @red) AND (mred.cod_mic = @mred)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST5='D'))
	OR
	( (red.cod_red = @red)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST5='D'))
	OR
	( (provincia.cod_prov = @provincia) AND (distrito.cod_dist = @distrito)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST5='D'))
	OR
	( (provincia.cod_prov = @provincia) AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST5='D'))

GROUP BY GRUPO.COD_GRU,GRUPO.DESC_GRU,ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist,datename(month,fecha)

--codigo6

UNION ALL

SELECT DISTINCT GRUPO.COD_GRU,GRUPO.DESC_GRU,ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist,datename(month,fecha) as meses,

SUM(CASE WHEN EDAD BETWEEN 0 AND 111 THEN 1 ELSE 0 END) AS 'morb_0_11a_nino',
SUM(CASE WHEN EDAD BETWEEN 112 AND 117 THEN 1 ELSE 0 END) AS 'morb_12_17a_adolescente',
SUM(CASE WHEN EDAD BETWEEN 118 AND 129 THEN 1 ELSE 0 END) AS 'morb_18_29a_joven',
SUM(CASE WHEN EDAD BETWEEN 130 AND 159 THEN 1 ELSE 0 END) AS 'morb_30_59a_adulto',
SUM(CASE WHEN EDAD BETWEEN 160 AND 199 THEN 1 ELSE 0 END) AS 'morb_60a_a_mas_adulto_mayor',
SUM(CASE WHEN SUBSTRING(Categoria.COD_CAT,1,1)='O' THEN 1 ELSE 0 END) AS 'morb_materna'

FROM his_2018 INNER JOIN TABDIAG ON his_2018.CODIGO6=TABDIAG.DIAG
INNER JOIN GRUPO ON TABDIAG.COD_GRU=GRUPO.COD_GRU
INNER JOIN Categoria  ON TABDIAG.COD_CAT =Categoria.COD_CAT
INNER JOIN ESTABLEC ON  his_2018.COD_ESTAB= ESTABLEC.COD_ESTAB
INNER JOIN red  ON establec.ubi_red = red.Ubi_Red
INNER JOIN mred ON establec.ubi_mred = mred.Ubi_mred
INNER JOIN provincia ON establec.ubi_prov = provincia.Ubi_Prov
INNER JOIN distrito ON establec.ubi_dist = distrito.ubi_dist
WHERE
	( (CAST(ESTABLEC.cod_2000 AS INT) = @establecimiento) AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST6='D'))
	OR
	( (red.cod_red = @red) AND (mred.cod_mic = @mred)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST6='D'))
	OR
	( (red.cod_red = @red)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST6='D'))
	OR
	( (provincia.cod_prov = @provincia) AND (distrito.cod_dist = @distrito)  AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST6='D'))
	OR
	( (provincia.cod_prov = @provincia) AND (convert(date,Fecha) between @startDate and @endDate) AND (CLASE='1' AND DIAGNOST6='D'))


GROUP BY GRUPO.COD_GRU,GRUPO.DESC_GRU,ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist,datename(month,fecha)


END
