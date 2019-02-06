USE [HIS2018]
GO
/****** Object:  StoredProcedure [dbo].[SP_SALUD_OCULAR]    Script Date: 2/6/2019 2:33:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_SALUD_OCULAR]
	-- Add the parameters for the stored procedure here
	@picked varchar(50),
	@red varchar(100),
	@mred varchar(100),
	@establec_red int,
	@provincia varchar(100),
	@distrito varchar(100),
	@establec_prov int,
	@establecimiento int,
	@startDate date,
	@endDate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist,

--TAMIZAJE Y DETECCIÓN
--99173 Determinación de la Agudeza Visual
--TD=D + DX= 99173
--NIÑO----
SUM (CASE WHEN EDAD<103 and
((CODIGO1='99173' AND diagnost1 ='D')OR
(CODIGO2='99173' AND diagnost2 ='D')OR
(CODIGO3='99173' AND diagnost3 ='D')OR
(CODIGO4='99173' AND diagnost4 ='D')OR
(CODIGO5='99173' AND diagnost5 ='D')OR
(CODIGO6='99173' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DET_AGUD_V_NINO_0d-2a', --99173 Determinación de la Agudeza Visual

SUM (CASE WHEN (EDAD>=103 and EDAD <=105) and
((CODIGO1='99173' AND diagnost1 ='D')OR
(CODIGO2='99173' AND diagnost2 ='D')OR
(CODIGO3='99173' AND diagnost3 ='D')OR
(CODIGO4='99173' AND diagnost4 ='D')OR
(CODIGO5='99173' AND diagnost5 ='D')OR
(CODIGO6='99173' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DET_AGUD_V_NINO_3-5a', --99173 Determinación de la Agudeza Visual

SUM (CASE WHEN (EDAD>=106 and EDAD <=111) and
((CODIGO1='99173' AND diagnost1 ='D')OR
(CODIGO2='99173' AND diagnost2 ='D')OR
(CODIGO3='99173' AND diagnost3 ='D')OR
(CODIGO4='99173' AND diagnost4 ='D')OR
(CODIGO5='99173' AND diagnost5 ='D')OR
(CODIGO6='99173' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DET_AGUD_V_NINO_6-11a', --99173 Determinación de la Agudeza Visual

-----ADOLESCENTE------

SUM (CASE WHEN (EDAD>=112 and EDAD <=117) and
((CODIGO1='99173' AND diagnost1 ='D')OR
(CODIGO2='99173' AND diagnost2 ='D')OR
(CODIGO3='99173' AND diagnost3 ='D')OR
(CODIGO4='99173' AND diagnost4 ='D')OR
(CODIGO5='99173' AND diagnost5 ='D')OR
(CODIGO6='99173' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DET_AGUD_V_ADOLES_12-17a', --99173 Determinación de la Agudeza Visual

---JOVEN-----

SUM (CASE WHEN (EDAD>=118 and EDAD <=129) and
((CODIGO1='99173' AND diagnost1 ='D')OR
(CODIGO2='99173' AND diagnost2 ='D')OR
(CODIGO3='99173' AND diagnost3 ='D')OR
(CODIGO4='99173' AND diagnost4 ='D')OR
(CODIGO5='99173' AND diagnost5 ='D')OR
(CODIGO6='99173' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DET_AGUD_V_JOVEN_18-29a', --99173 Determinación de la Agudeza Visual

-----ADULTO-------------------
SUM (CASE WHEN (EDAD>=130 and EDAD <=149) and
((CODIGO1='99173' AND diagnost1 ='D')OR
(CODIGO2='99173' AND diagnost2 ='D')OR
(CODIGO3='99173' AND diagnost3 ='D')OR
(CODIGO4='99173' AND diagnost4 ='D')OR
(CODIGO5='99173' AND diagnost5 ='D')OR
(CODIGO6='99173' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DET_AGUD_V_ADUL1_30-49a', --99173 Determinación de la Agudeza Visual

SUM (CASE WHEN (EDAD>=150 and EDAD <=159) and
((CODIGO1='99173' AND diagnost1 ='D')OR
(CODIGO2='99173' AND diagnost2 ='D')OR
(CODIGO3='99173' AND diagnost3 ='D')OR
(CODIGO4='99173' AND diagnost4 ='D')OR
(CODIGO5='99173' AND diagnost5 ='D')OR
(CODIGO6='99173' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DET_AGUD_V_ADUL2_50-59a', --99173 Determinación de la Agudeza Visual

-----ADULTO MAYOR-----
SUM (CASE WHEN (EDAD>=160 and EDAD <=199) and
((CODIGO1='99173' AND diagnost1 ='D')OR
(CODIGO2='99173' AND diagnost2 ='D')OR
(CODIGO3='99173' AND diagnost3 ='D')OR
(CODIGO4='99173' AND diagnost4 ='D')OR
(CODIGO5='99173' AND diagnost5 ='D')OR
(CODIGO6='99173' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DET_AGUD_V_ADUL_MAY_60a_Mas', --99173 Determinación de la Agudeza Visual

---TAMIZAJE Y DETECCIÓN
---Z010  Examen de los Ojos y de la Visión
--NIÑO----
SUM (CASE WHEN EDAD<103 and
((CODIGO1='Z010' AND diagnost1 ='D')OR
(CODIGO2='Z010' AND diagnost2 ='D')OR
(CODIGO3='Z010' AND diagnost3 ='D')OR
(CODIGO4='Z010' AND diagnost4 ='D')OR
(CODIGO5='Z010' AND diagnost5 ='D')OR
(CODIGO6='Z010' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXA_OJOS_VISION_NINO_0d-2a', --Z010 Examen de los Ojos y de la Visión

SUM (CASE WHEN (EDAD>=103 and EDAD <=105) and
((CODIGO1='Z010' AND diagnost1 ='D')OR
(CODIGO2='Z010' AND diagnost2 ='D')OR
(CODIGO3='Z010' AND diagnost3 ='D')OR
(CODIGO4='Z010' AND diagnost4 ='D')OR
(CODIGO5='Z010' AND diagnost5 ='D')OR
(CODIGO6='Z010' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXA_OJOS_VISION_NINO_3-5a', --Z010 Examen de los Ojos y de la Visión

SUM (CASE WHEN (EDAD>=106 and EDAD <=111) and
((CODIGO1='Z010' AND diagnost1 ='D')OR
(CODIGO2='Z010' AND diagnost2 ='D')OR
(CODIGO3='Z010' AND diagnost3 ='D')OR
(CODIGO4='Z010' AND diagnost4 ='D')OR
(CODIGO5='Z010' AND diagnost5 ='D')OR
(CODIGO6='Z010' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXA_OJOS_VISION_NINO_6-11a', --Z010 Examen de los Ojos y de la Visión

-----ADOLESCENTE------

SUM (CASE WHEN (EDAD>=112 and EDAD <=117) and
((CODIGO1='Z010' AND diagnost1 ='D')OR
(CODIGO2='Z010' AND diagnost2 ='D')OR
(CODIGO3='Z010' AND diagnost3 ='D')OR
(CODIGO4='Z010' AND diagnost4 ='D')OR
(CODIGO5='Z010' AND diagnost5 ='D')OR
(CODIGO6='Z010' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXA_OJOS_VISION_ADOLES_12-17a', --Z010 Examen de los Ojos y de la Visión

---JOVEN-----

SUM (CASE WHEN (EDAD>=118 and EDAD <=129) and
((CODIGO1='Z010' AND diagnost1 ='D')OR
(CODIGO2='Z010' AND diagnost2 ='D')OR
(CODIGO3='Z010' AND diagnost3 ='D')OR
(CODIGO4='Z010' AND diagnost4 ='D')OR
(CODIGO5='Z010' AND diagnost5 ='D')OR
(CODIGO6='Z010' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXA_OJOS_VISION_JOVEN_18-29a', --Z010 Examen de los Ojos y de la Visión

-----ADULTO-------------------
SUM (CASE WHEN (EDAD>=130 and EDAD <=149) and
((CODIGO1='Z010' AND diagnost1 ='D')OR
(CODIGO2='Z010' AND diagnost2 ='D')OR
(CODIGO3='Z010' AND diagnost3 ='D')OR
(CODIGO4='Z010' AND diagnost4 ='D')OR
(CODIGO5='Z010' AND diagnost5 ='D')OR
(CODIGO6='Z010' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXA_OJOS_VISION_ADUL1_30-49a', --Z010 Examen de los Ojos y de la Visión

SUM (CASE WHEN (EDAD>=150 and EDAD <=159) and
((CODIGO1='Z010' AND diagnost1 ='D')OR
(CODIGO2='Z010' AND diagnost2 ='D')OR
(CODIGO3='Z010' AND diagnost3 ='D')OR
(CODIGO4='Z010' AND diagnost4 ='D')OR
(CODIGO5='Z010' AND diagnost5 ='D')OR
(CODIGO6='Z010' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXA_OJOS_VISION_ADUL2_50-59a', --Z010 Examen de los Ojos y de la Visión

-----ADULTO MAYOR-----
SUM (CASE WHEN (EDAD>=160 and EDAD <=199) and
((CODIGO1='Z010' AND diagnost1 ='D')OR
(CODIGO2='Z010' AND diagnost2 ='D')OR
(CODIGO3='Z010' AND diagnost3 ='D')OR
(CODIGO4='Z010' AND diagnost4 ='D')OR
(CODIGO5='Z010' AND diagnost5 ='D')OR
(CODIGO6='Z010' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXA_OJOS_VISION_ADUL_MAY_60a_Mas', --Z010 Examen de los Ojos y de la Visión

-------99401 Consejería Integral
--(TD=D + DX= 99401 + LAB=1
--NIÑO----
SUM(CASE WHEN (EDAD>=0 AND EDAD <= 102) AND
((CODIGO1='99401' AND DIAGNOST1= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO2='99401' AND DIAGNOST2= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO3='99401' AND DIAGNOST3= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO4='99401' AND DIAGNOST4= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO5='99401' AND DIAGNOST5= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
(CODIGO6='99401' AND DIAGNOST6= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6)))) then 1 else 0 end) AS 'Consejeria_Integral_01d-02a',
SUM(CASE WHEN (EDAD>=103 AND EDAD <= 105) AND
((CODIGO1='99401' AND DIAGNOST1= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO2='99401' AND DIAGNOST2= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO3='99401' AND DIAGNOST3= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO4='99401' AND DIAGNOST4= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO5='99401' AND DIAGNOST5= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
(CODIGO6='99401' AND DIAGNOST6= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6)))) then 1 else 0 end) AS 'Consejeria_Integral_03-05a',
SUM(CASE WHEN (EDAD>=106 AND EDAD <= 111) AND
((CODIGO1='99401' AND DIAGNOST1= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO2='99401' AND DIAGNOST2= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO3='99401' AND DIAGNOST3= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO4='99401' AND DIAGNOST4= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO5='99401' AND DIAGNOST5= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
(CODIGO6='99401' AND DIAGNOST6= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6)))) then 1 else 0 end) AS 'Consejeria_Integral_06-11a',
SUM(CASE WHEN (EDAD>=112 AND EDAD <= 117) AND
((CODIGO1='99401' AND DIAGNOST1= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO2='99401' AND DIAGNOST2= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO3='99401' AND DIAGNOST3= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO4='99401' AND DIAGNOST4= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO5='99401' AND DIAGNOST5= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
(CODIGO6='99401' AND DIAGNOST6= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6)))) then 1 else 0 end) AS 'Consejeria_Integral_12-17a',
SUM(CASE WHEN (EDAD>=118 AND EDAD <= 129) AND
((CODIGO1='99401' AND DIAGNOST1= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO2='99401' AND DIAGNOST2= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO3='99401' AND DIAGNOST3= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO4='99401' AND DIAGNOST4= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO5='99401' AND DIAGNOST5= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
(CODIGO6='99401' AND DIAGNOST6= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6)))) then 1 else 0 end) AS 'Consejeria_Integral_18-29a',
SUM(CASE WHEN (EDAD>=130 AND EDAD <= 149) AND
((CODIGO1='99401' AND DIAGNOST1= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO2='99401' AND DIAGNOST2= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO3='99401' AND DIAGNOST3= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO4='99401' AND DIAGNOST4= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO5='99401' AND DIAGNOST5= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
(CODIGO6='99401' AND DIAGNOST6= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6)))) then 1 else 0 end) AS 'Consejeria_Integral_30-49a',
SUM(CASE WHEN (EDAD>=150 AND EDAD <= 159) AND
((CODIGO1='99401' AND DIAGNOST1= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO2='99401' AND DIAGNOST2= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO3='99401' AND DIAGNOST3= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO4='99401' AND DIAGNOST4= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO5='99401' AND DIAGNOST5= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
(CODIGO6='99401' AND DIAGNOST6= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6)))) then 1 else 0 end) AS 'Consejeria_Integral_50-59',
SUM(CASE WHEN (EDAD>=160 AND EDAD <= 199) AND
((CODIGO1='99401' AND DIAGNOST1= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO2='99401' AND DIAGNOST2= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO3='99401' AND DIAGNOST3= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO4='99401' AND DIAGNOST4= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
 (CODIGO5='99401' AND DIAGNOST5= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6))) OR
(CODIGO6='99401' AND DIAGNOST6= 'D' AND ('SO' IN(LABCONF1,LABCONF2,LABCONF3,LABCONF4,LABCONF5,LABCONF6)))) then 1 else 0 end) AS 'Consejeria_Integral_60a_mas',

-------Z006 Normal (SO en LAB)----
--NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='Z006' AND LABCONF1='SO') OR
(CODIGO2='Z006' AND LABCONF2='SO') OR
(CODIGO3='Z006' AND LABCONF3='SO') OR
(CODIGO4='Z006' AND LABCONF4='SO') OR
(CODIGO5='Z006' AND LABCONF5='SO') OR
(CODIGO6='Z006' AND LABCONF6='SO'))
THEN 1 ELSE 0 END) AS 'NORMAL_NINO_0D-2a',--Z006 Normal (SO en LAB)

SUM (CASE WHEN (EDAD>=103 and EDAD <=105) and
((CODIGO1='Z006' AND LABCONF1='SO') OR
(CODIGO2='Z006' AND LABCONF2='SO') OR
(CODIGO3='Z006' AND LABCONF3='SO') OR
(CODIGO4='Z006' AND LABCONF4='SO') OR
(CODIGO5='Z006' AND LABCONF5='SO') OR
(CODIGO6='Z006' AND LABCONF6='SO'))
THEN 1 ELSE 0 END) AS 'NORMAL_NINO_3-5a', --Z006 Normal (SO en LAB)

SUM (CASE WHEN (EDAD>=106 and EDAD <=111) and
((CODIGO1='Z006' AND LABCONF1='SO') OR
(CODIGO2='Z006' AND LABCONF2='SO') OR
(CODIGO3='Z006' AND LABCONF3='SO') OR
(CODIGO4='Z006' AND LABCONF4='SO') OR
(CODIGO5='Z006' AND LABCONF5='SO') OR
(CODIGO6='Z006' AND LABCONF6='SO'))
THEN 1 ELSE 0 END) AS 'NORMAL_NINO_6-11a', --Z006 Normal (SO en LAB)

-----ADOLESCENTE------

SUM (CASE WHEN (EDAD>=112 and EDAD <=117) and
((CODIGO1='Z006' AND LABCONF1='SO') OR
(CODIGO2='Z006' AND LABCONF2='SO') OR
(CODIGO3='Z006' AND LABCONF3='SO') OR
(CODIGO4='Z006' AND LABCONF4='SO') OR
(CODIGO5='Z006' AND LABCONF5='SO') OR
(CODIGO6='Z006' AND LABCONF6='SO'))
THEN 1 ELSE 0 END) AS 'NORMAL_ADOLES_12-17a',--Z006 Normal (SO en LAB)

---JOVEN-----

SUM (CASE WHEN (EDAD>=118 and EDAD <=129) and
((CODIGO1='Z006' AND LABCONF1='SO') OR
(CODIGO2='Z006' AND LABCONF2='SO') OR
(CODIGO3='Z006' AND LABCONF3='SO') OR
(CODIGO4='Z006' AND LABCONF4='SO') OR
(CODIGO5='Z006' AND LABCONF5='SO') OR
(CODIGO6='Z006' AND LABCONF6='SO'))
THEN 1 ELSE 0 END) AS 'NORMAL_JOVEN_18-29a',--Z006 Normal (SO en LAB)

-----ADULTO-------------------
SUM (CASE WHEN (EDAD>=130 and EDAD <=149) and
((CODIGO1='Z006' AND LABCONF1='SO') OR
(CODIGO2='Z006' AND LABCONF2='SO') OR
(CODIGO3='Z006' AND LABCONF3='SO') OR
(CODIGO4='Z006' AND LABCONF4='SO') OR
(CODIGO5='Z006' AND LABCONF5='SO') OR
(CODIGO6='Z006' AND LABCONF6='SO'))
THEN 1 ELSE 0 END) AS 'NORMAL_ADUL1_30-49a', --Z006 Normal (SO en LAB)

SUM (CASE WHEN (EDAD>=150 and EDAD <=159) and
((CODIGO1='Z006' AND LABCONF1='SO') OR
(CODIGO2='Z006' AND LABCONF2='SO') OR
(CODIGO3='Z006' AND LABCONF3='SO') OR
(CODIGO4='Z006' AND LABCONF4='SO') OR
(CODIGO5='Z006' AND LABCONF5='SO') OR
(CODIGO6='Z006' AND LABCONF6='SO'))
THEN 1 ELSE 0 END) AS 'NORMAL_ADUL2_50-59a', --Z006 Normal (SO en LAB)

-----ADULTO MAYOR-----
SUM (CASE WHEN (EDAD>=160 and EDAD <=199) and
((CODIGO1='Z006' AND LABCONF1='SO') OR
(CODIGO2='Z006' AND LABCONF2='SO') OR
(CODIGO3='Z006' AND LABCONF3='SO') OR
(CODIGO4='Z006' AND LABCONF4='SO') OR
(CODIGO5='Z006' AND LABCONF5='SO') OR
(CODIGO6='Z006' AND LABCONF6='SO'))
THEN 1 ELSE 0 END) AS 'NORMAL_ADUL_MAY_60a_Mas',--Z006 Normal (SO en LAB)

------------92250 Examen de fondo de ojo (Oftalmoscopia Directa)--
--TD=D + DX= 92250

--NIÑO----
SUM (CASE WHEN EDAD<103 and
((CODIGO1='92250' AND diagnost1 ='D')OR
(CODIGO2='92250' AND diagnost2 ='D')OR
(CODIGO3='92250' AND diagnost3 ='D')OR
(CODIGO4='92250' AND diagnost4 ='D')OR
(CODIGO5='92250' AND diagnost5 ='D')OR
(CODIGO6='92250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXAMEN_F_OJO_NINO_0d-2a', --92250 Examen de fondo de ojo (Oftalmoscopia Directa)--

SUM (CASE WHEN (EDAD>=103 and EDAD <=105) and
((CODIGO1='92250' AND diagnost1 ='D')OR
(CODIGO2='92250' AND diagnost2 ='D')OR
(CODIGO3='92250' AND diagnost3 ='D')OR
(CODIGO4='92250' AND diagnost4 ='D')OR
(CODIGO5='92250' AND diagnost5 ='D')OR
(CODIGO6='92250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXAMEN_F_OJO_NINO_3-5a', --92250 Examen de fondo de ojo (Oftalmoscopia Directa)--

SUM (CASE WHEN (EDAD>=106 and EDAD <=111) and
((CODIGO1='92250' AND diagnost1 ='D')OR
(CODIGO2='92250' AND diagnost2 ='D')OR
(CODIGO3='92250' AND diagnost3 ='D')OR
(CODIGO4='92250' AND diagnost4 ='D')OR
(CODIGO5='92250' AND diagnost5 ='D')OR
(CODIGO6='92250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXAMEN_F_OJO_NINO_6-11a', --92250 Examen de fondo de ojo (Oftalmoscopia Directa)--

-----ADOLESCENTE------

SUM (CASE WHEN (EDAD>=112 and EDAD <=117) and
((CODIGO1='92250' AND diagnost1 ='D')OR
(CODIGO2='92250' AND diagnost2 ='D')OR
(CODIGO3='92250' AND diagnost3 ='D')OR
(CODIGO4='92250' AND diagnost4 ='D')OR
(CODIGO5='92250' AND diagnost5 ='D')OR
(CODIGO6='92250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXAMEN_F_OJO_ADOLES_12-17a', --92250 Examen de fondo de ojo (Oftalmoscopia Directa)--

---JOVEN-----

SUM (CASE WHEN (EDAD>=118 and EDAD <=129) and
((CODIGO1='92250' AND diagnost1 ='D')OR
(CODIGO2='92250' AND diagnost2 ='D')OR
(CODIGO3='92250' AND diagnost3 ='D')OR
(CODIGO4='92250' AND diagnost4 ='D')OR
(CODIGO5='92250' AND diagnost5 ='D')OR
(CODIGO6='92250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXAMEN_F_OJO_JOVEN_18-29a', --92250 Examen de fondo de ojo (Oftalmoscopia Directa)--

-----ADULTO-------------------
SUM (CASE WHEN (EDAD>=130 and EDAD <=149) and
((CODIGO1='92250' AND diagnost1 ='D')OR
(CODIGO2='92250' AND diagnost2 ='D')OR
(CODIGO3='92250' AND diagnost3 ='D')OR
(CODIGO4='92250' AND diagnost4 ='D')OR
(CODIGO5='92250' AND diagnost5 ='D')OR
(CODIGO6='92250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXAMEN_F_OJO_ADUL1_30-49a', --92250 Examen de fondo de ojo (Oftalmoscopia Directa)--

SUM (CASE WHEN (EDAD>=150 and EDAD <=159) and
((CODIGO1='92250' AND diagnost1 ='D')OR
(CODIGO2='92250' AND diagnost2 ='D')OR
(CODIGO3='92250' AND diagnost3 ='D')OR
(CODIGO4='92250' AND diagnost4 ='D')OR
(CODIGO5='92250' AND diagnost5 ='D')OR
(CODIGO6='92250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXAMEN_F_OJO_ADUL2_50-59a', --92250 Examen de fondo de ojo (Oftalmoscopia Directa)--

-----ADULTO MAYOR-----
SUM (CASE WHEN (EDAD>=160 and EDAD <=199) and
((CODIGO1='92250' AND diagnost1 ='D')OR
(CODIGO2='92250' AND diagnost2 ='D')OR
(CODIGO3='92250' AND diagnost3 ='D')OR
(CODIGO4='92250' AND diagnost4 ='D')OR
(CODIGO5='92250' AND diagnost5 ='D')OR
(CODIGO6='92250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'EXAMEN_F_OJO_ADUL_MAY_60a_Mas', --92250 Examen de fondo de ojo (Oftalmoscopia Directa)--

-----CATEGORÍA DE DISCAPACIDAD VISUAL (a través de Agudeza Visual)-----
---Ojo Derecho Normal (20/20 a 20/30)
--TD=D + DX= 99173 + LAB1=20,25 ó 30
--NIÑO---

SUM (CASE WHEN EDAD<103 and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('20','25','30'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('20','25','30'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('20','25','30'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('20','25','30'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('20','25','30'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_DER_NORMAL_NINO_0d-2a', --Ojo Derecho Normal (20/20 a 20/30)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('20','25','30'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('20','25','30'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('20','25','30'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('20','25','30'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('20','25','30'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_DER_NORMAL_NINO_3-5a', --Ojo Derecho Normal (20/20 a 20/30)

SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('20','25','30'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('20','25','30'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('20','25','30'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('20','25','30'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('20','25','30'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_DER_NORMAL_NINO_6-11a', --Ojo Derecho Normal (20/20 a 20/30)

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('20','25','30'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('20','25','30'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('20','25','30'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('20','25','30'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('20','25','30'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_DER_NORMAL_ADOLES_3-5a', --Ojo Derecho Normal (20/20 a 20/30)

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('20','25','30'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('20','25','30'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('20','25','30'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('20','25','30'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('20','25','30'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_DER_NORMAL_JOVEN_18-29a', --Ojo Derecho Normal (20/20 a 20/30)

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('20','25','30'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('20','25','30'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('20','25','30'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('20','25','30'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('20','25','30'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_DER_NORMAL_ADUL1_30-49a', --Ojo Derecho Normal (20/20 a 20/30)

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('20','25','30'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('20','25','30'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('20','25','30'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('20','25','30'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('20','25','30'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_DER_NORMAL_ADUL2_50-59a', --Ojo Derecho Normal (20/20 a 20/30)

---ADULTO MAYOR

SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('20','25','30'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('20','25','30'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('20','25','30'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('20','25','30'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('20','25','30'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_DER_NORMAL_ADUL_MAY_60a_Mas', --Ojo Derecho Normal (20/20 a 20/30)

------------Ojo Izquierdo Normal (20/20 a 20/30)------
---TD=D + DX= 99173 + LAB2=20,25 ó 30
SUM (CASE WHEN EDAD<103 and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('20','25','30'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('20','25','30'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('20','25','30'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('20','25','30'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_NINO_0d-2a', --Ojo Izquierdo Normal (20/20 a 20/30)------


---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('20','25','30'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('20','25','30'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('20','25','30'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('20','25','30'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_NINO_3-5a', --Ojo Izquierdo Normal (20/20 a 20/30)------

SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('20','25','30'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('20','25','30'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('20','25','30'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('20','25','30'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_NINO_6-11a', --Ojo Izquierdo Normal (20/20 a 20/30)------

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('20','25','30'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('20','25','30'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('20','25','30'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('20','25','30'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_NINO_12-17a', --Ojo Izquierdo Normal (20/20 a 20/30)------

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('20','25','30'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('20','25','30'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('20','25','30'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('20','25','30'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_NINO_18-29a', --Ojo Izquierdo Normal (20/20 a 20/30)------

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('20','25','30'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('20','25','30'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('20','25','30'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('20','25','30'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_NINO_30-49a', --Ojo Izquierdo Normal (20/20 a 20/30)------

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('20','25','30'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('20','25','30'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('20','25','30'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('20','25','30'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_NINO_50-59a', --Ojo Izquierdo Normal (20/20 a 20/30)------

---ADULTO MAYOR

SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('20','25','30'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('20','25','30'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('20','25','30'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('20','25','30'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('20','25','30')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_NINO_60a_Mas', --Ojo Izquierdo Normal (20/20 a 20/30)------

------Ojo Derecho Limitación visual leve (20/40 a 20/60)
----TD=D + DX= 99173 + LAB1=40,50 ó 60

--NIÑO---

SUM (CASE WHEN EDAD<103 and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('40','50','60'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('40','50','60'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('40','50','60'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('40','50','60'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('40','50','60'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_LEVE_NINO_0d-2a', --Ojo Derecho Limitación visual leve (20/40 a 20/60)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('40','50','60'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('40','50','60'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('40','50','60'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('40','50','60'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('40','50','60'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_LEVE_NINO_3-5a', --Ojo Derecho Limitación visual leve (20/40 a 20/60)

SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('40','50','60'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('40','50','60'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('40','50','60'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('40','50','60'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('40','50','60'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_LEVE_NINO_6-11a', --Ojo Derecho Limitación visual leve (20/40 a 20/60)

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('40','50','60'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('40','50','60'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('40','50','60'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('40','50','60'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('40','50','60'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_LEVE_ADOLES_3-5a', --Ojo Derecho Limitación visual leve (20/40 a 20/60)

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('40','50','60'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('40','50','60'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('40','50','60'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('40','50','60'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('40','50','60'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_LEVE_JOVEN_18-29a', --Ojo Derecho Limitación visual leve (20/40 a 20/60)

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('40','50','60'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('40','50','60'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('40','50','60'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('40','50','60'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('40','50','60'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_LEVE_ADUL1_30-49a', --Ojo Derecho Limitación visual leve (20/40 a 20/60)

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('40','50','60'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('40','50','60'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('40','50','60'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('40','50','60'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('40','50','60'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_LEVE_ADUL2_50-59a', --Ojo Derecho Limitación visual leve (20/40 a 20/60)

---ADULTO MAYOR

SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('40','50','60'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('40','50','60'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('40','50','60'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('40','50','60'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('40','50','60'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_LEVE_ADUL_MAY_60a_Mas', --Ojo Derecho Limitación visual leve (20/40 a 20/60)

---Ojo Izquierdo Limitación visual leve (20/40 a 20/60)------
----TD=D + DX= 99173 + LAB2=40,50 ó 60---

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('40','50','60'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('40','50','60'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('40','50','60'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('40','50','60'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_LEVE_NINO_0d-2a', --Ojo Izquierdo Limitación visual leve (20/40 a 20/60)------

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('40','50','60'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('40','50','60'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('40','50','60'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('40','50','60'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_LEVE_NINO_3-5a', --Ojo Izquierdo Limitación visual leve (20/40 a 20/60)------
--NIÑO-----------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('40','50','60'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('40','50','60'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('40','50','60'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('40','50','60'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_LEVE_NINO_6-11a', --Ojo Izquierdo Limitación visual leve (20/40 a 20/60)------

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('40','50','60'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('40','50','60'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('40','50','60'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('40','50','60'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_LEVE_ADOLES_12-17a', --Ojo Izquierdo Limitación visual leve (20/40 a 20/60)------

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('40','50','60'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('40','50','60'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('40','50','60'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('40','50','60'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_LEVE_JOV_18-29a', --Ojo Izquierdo Limitación visual leve (20/40 a 20/60)------

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('40','50','60'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('40','50','60'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('40','50','60'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('40','50','60'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_LEVE_ADUL1_30-49a', --Ojo Izquierdo Limitación visual leve (20/40 a 20/60)------

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('40','50','60'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('40','50','60'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('40','50','60'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('40','50','60'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_LEVE_ADUL2_50-59a', --Ojo Izquierdo Limitación visual leve (20/40 a 20/60)------

---ADULTO MAYOR

SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('40','50','60'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('40','50','60'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('40','50','60'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('40','50','60'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('40','50','60')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_LEVE_ADUL_MAY_60a_Mas', --Ojo Izquierdo Limitación visual leve (20/40 a 20/60)------

------Ojo Derecho Limitación visual moderada (20/70 a 20/200)----
----TD=D + DX= 99173 + LAB1=70,100 ó 200--

--NIÑO---

SUM (CASE WHEN EDAD<103 and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('70','100','200'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('70','100','200'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('70','100','200'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('70','100','200'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('70','100','200'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_MOD_NINO_0d-2a', --Ojo Derecho Limitación visual moderada (20/70 a 20/200)----

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('70','100','200'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('70','100','200'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('70','100','200'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('70','100','200'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('70','100','200'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_MOD_NINO_3-5a', --Ojo Derecho Limitación visual moderada (20/70 a 20/200)----

SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('70','100','200'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('70','100','200'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('70','100','200'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('70','100','200'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('70','100','200'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_MOD_NINO_6-11a', --Ojo Derecho Limitación visual moderada (20/70 a 20/200)----

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('70','100','200'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('70','100','200'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('70','100','200'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('70','100','200'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('70','100','200'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_MOD_ADOLES_3-5a', --Ojo Derecho Limitación visual moderada (20/70 a 20/200)----

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('70','100','200'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('70','100','200'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('70','100','200'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('70','100','200'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('70','100','200'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_MOD_JOVEN_18-29a', --Ojo Derecho Limitación visual moderada (20/70 a 20/200)----

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('70','100','200'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('70','100','200'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('70','100','200'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('70','100','200'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('70','100','200'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_MOD_ADUL1_30-49a', --Ojo Derecho Limitación visual moderada (20/70 a 20/200)----

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('70','100','200'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('70','100','200'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('70','100','200'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('70','100','200'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('70','100','200'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_MOD_ADUL2_50-59a', --Ojo Derecho Limitación visual moderada (20/70 a 20/200)----

---ADULTO MAYOR

SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('70','100','200'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('70','100','200'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('70','100','200'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('70','100','200'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('70','100','200'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_MOD_ADUL_MAY_60a_Mas', --Ojo Derecho Limitación visual moderada (20/70 a 20/200)----


---Ojo Izquierdo Limitación visual moderada (20/70 a 20/200)
--TD=D + DX= 99173 + LAB2=70,100 ó 200
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('70','100','200'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('70','100','200'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('70','100','200'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('70','100','200'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_MOD_NINO_0d-2a', --Ojo Izquierdo Limitación visual moderada (20/70 a 20/200)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('70','100','200'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('70','100','200'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('70','100','200'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('70','100','200'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_MOD_NINO_3-5a', --Ojo Izquierdo Limitación visual moderada (20/70 a 20/200)
--NIÑO-----------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('70','100','200'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('70','100','200'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('70','100','200'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('70','100','200'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_MOD_NINO_6-11a', --Ojo Izquierdo Limitación visual moderada (20/70 a 20/200)

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('70','100','200'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('70','100','200'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('70','100','200'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('70','100','200'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_MOD_ADOLES_12-17a', --Ojo Izquierdo Limitación visual moderada (20/70 a 20/200)

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('70','100','200'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('70','100','200'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('70','100','200'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('70','100','200'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_MOD_JOV_18-29a', --Ojo Izquierdo Limitación visual moderada (20/70 a 20/200)

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('70','100','200'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('70','100','200'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('70','100','200'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('70','100','200'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_MOD_ADUL1_30-49a', --Ojo Izquierdo Limitación visual moderada (20/70 a 20/200)

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('70','100','200'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('70','100','200'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('70','100','200'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('70','100','200'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_MOD_ADUL2_50-59a', --Ojo Izquierdo Limitación visual moderada (20/70 a 20/200)

---ADULTO MAYOR

SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('70','100','200'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('70','100','200'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('70','100','200'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('70','100','200'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('70','100','200')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_MOD_ADUL_MAY_60a_Mas', --Ojo Izquierdo Limitación visual moderada (20/70 a 20/200)

----Ojo Derecho Limitación visual severa (< 20/200 a 20/400)
---TD=D + DX= 99173 + LAB1= 400
--NIÑO---

SUM (CASE WHEN EDAD<103 and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('400'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('400'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('400'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('400'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('400'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_SEV_NINO_0d-2a', --Ojo Derecho Limitación visual severa (< 20/200 a 20/400)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('400'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('400'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('400'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('400'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('400'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_SEV_NINO_3-5a', --Ojo Derecho Limitación visual severa (< 20/200 a 20/400)

SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('400'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('400'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('400'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('400'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('400'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_SEV_NINO_6-11a', --Ojo Derecho Limitación visual severa (< 20/200 a 20/400)

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('400'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('400'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('400'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('400'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('400'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_SEV_ADOLES_3-5a', --Ojo Derecho Limitación visual severa (< 20/200 a 20/400)

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('400'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('400'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('400'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('400'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('400'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_SEV_JOVEN_18-29a', --Ojo Derecho Limitación visual severa (< 20/200 a 20/400)

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('400'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('400'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('400'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('400'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('400'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_SEV_ADUL1_30-49a', --Ojo Derecho Limitación visual severa (< 20/200 a 20/400)

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('400'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('400'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('400'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('400'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('400'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_SEV_ADUL2_50-59a', --Ojo Derecho Limitación visual severa (< 20/200 a 20/400)

---ADULTO MAYOR

SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('400'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('400'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('400'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('400'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('400'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_DER_LIM_VIS_SEV_ADUL_MAY_60a_Mas', --Ojo Derecho Limitación visual severa (< 20/200 a 20/400)

----Ojo Izquierdo Limitación visual severa (< 20/200 a 20/400)
---TD=D + DX= 99173 + LAB2=400
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('400'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('400'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('400'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('400'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_SEV_NINO_0d-2a', --Ojo Izquierdo Limitación visual severa (< 20/200 a 20/400)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('400'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('400'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('400'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('400'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_SEV_NINO_3-5a', --Ojo Izquierdo Limitación visual severa (< 20/200 a 20/400)
--NIÑO-----------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('400'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('400'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('400'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('400'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_SEV_NINO_6-11a', --Ojo Izquierdo Limitación visual severa (< 20/200 a 20/400)

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('400'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('400'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('400'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('400'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_SEV_ADOLES_12-17a', --Ojo Izquierdo Limitación visual severa (< 20/200 a 20/400)

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('400'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('400'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('400'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('400'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_SEV_JOV_18-29a', --Ojo Izquierdo Limitación visual severa (< 20/200 a 20/400)
-----ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('400'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('400'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('400'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('400'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_SEV_ADUL1_30-49a', --Ojo Izquierdo Limitación visual severa (< 20/200 a 20/400)

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('400'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('400'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('400'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('400'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_SEV_ADUL2_50-59a', --Ojo Izquierdo Limitación visual severa (< 20/200 a 20/400)

---ADULTO MAYOR

SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('400'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('400'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('400'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('400'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('400')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_LIM_VIS_SEV_ADUL_MAY_60a_Mas', --Ojo Izquierdo Limitación visual severa (< 20/200 a 20/400)

--Ojo Derecho Ceguera (< 20/400 a NPL1/)
---TD=D + DX= 99173 + LAB1=800
--NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('800'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('800'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('800'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('800'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('800'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_DER_CEGUERA_NINO_0d-2a', --Ojo Derecho Ceguera (< 20/400 a NPL1/)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('800'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('800'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('800'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('800'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('800'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_DER_CEGUERA_NINO_3-5a', --Ojo Derecho Ceguera (< 20/400 a NPL1/)

SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('800'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('800'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('800'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('800'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('800'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_DER_CEGUERA_NINO_6-11a', --Ojo Derecho Ceguera (< 20/400 a NPL1/)

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('800'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('800'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('800'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('800'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('800'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_DER_CEGUERA_ADOLES_3-5a', --Ojo Derecho Ceguera (< 20/400 a NPL1/)

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('800'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('800'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('800'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('800'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('800'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_DER_CEGUERA_JOVEN_18-29a', --Ojo Derecho Ceguera (< 20/400 a NPL1/)

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('800'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('800'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('800'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('800'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('800'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_DER_CEGUERA_ADUL1_30-49a', --Ojo Derecho Ceguera (< 20/400 a NPL1/)

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('800'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('800'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('800'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('800'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('800'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_DER_CEGUERA_ADUL2_50-59a', --Ojo Derecho Ceguera (< 20/400 a NPL1/)

---ADULTO MAYOR

SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='99173' AND diagnost1 ='D' AND labconf1 IN ('800'))OR
(CODIGO2='99173' AND diagnost2 ='D' AND labconf2 IN ('800'))OR
(CODIGO3='99173' AND diagnost3 ='D' AND labconf3 IN ('800'))OR
(CODIGO4='99173' AND diagnost4 ='D' AND labconf4 IN ('800'))OR
(CODIGO5='99173' AND diagnost5 ='D' AND labconf5 IN ('800'))OR
(CODIGO6='99173' AND diagnost6 ='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_DER_CEGUERA_ADUL_MAY_60a_Mas', --Ojo Derecho Ceguera (< 20/400 a NPL1/)

--Ojo Izquierdo Ceguera (< 20/400 a NPL1/)
---TD=D + DX= 99173 + LAB2=800
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('800'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('800'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('800'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('800'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_CEGUERA_NINO_0d-2a', --Ojo Izquierdo Ceguera (< 20/400 a NPL1/)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('800'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('800'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('800'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('800'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_CEGUERA_NINO_3-5a', --Ojo Izquierdo Ceguera (< 20/400 a NPL1/)
--NIÑO-----------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('800'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('800'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('800'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('800'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_CEGUERA_NINO_6-11a', --Ojo Izquierdo Ceguera (< 20/400 a NPL1/)

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('800'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('800'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('800'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('800'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_CEGUERA_ADOLES_12-17a', --Ojo Izquierdo Ceguera (< 20/400 a NPL1/)

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('800'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('800'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('800'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('800'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_CEGUERA_JOV_18-29a', --Ojo Izquierdo Ceguera (< 20/400 a NPL1/)

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('800'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('800'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('800'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('800'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_CEGUERA_ADUL1_30-49a', --Ojo Izquierdo Ceguera (< 20/400 a NPL1/)

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('800'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('800'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('800'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('800'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_CEGUERA_ADUL2_50-59a', --Ojo Izquierdo Ceguera (< 20/400 a NPL1/)

---ADULTO MAYOR

SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((codigo1='99173' AND diagnost1='D' AND labconf2 IN ('800'))OR
(codigo2='99173' AND diagnost2='D' AND labconf3 IN ('800'))OR
(codigo3='99173' AND diagnost3='D' AND labconf4 IN ('800'))OR
(codigo4='99173' AND diagnost4='D' AND labconf5 IN ('800'))OR
(codigo5='99173' AND diagnost5='D' AND labconf6 IN ('800')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_CEGUERA_ADUL_MAY_60a_Mas', --Ojo Izquierdo Ceguera (< 20/400 a NPL1/)

-----DETERMINACIÓN DE LA PRESIÓN INTRAOCULAR--------------------------------
---Ojo Derecho Normal (10 – 20 mm Hg)
---TD=D + DX= 92100 + LAB1= N

SUM (CASE WHEN EDAD<103 and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('N'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('N'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('N'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('N'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('N'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_NORMAL_NINO_0d-2a', --Ojo Derecho Normal (10 – 20 mm Hg)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('N'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('N'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('N'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('N'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('N'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_NORMAL_NINO_3-5a', --Ojo Derecho Normal (10 – 20 mm Hg)

SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('N'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('N'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('N'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('N'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('N'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_NORMAL_NINO_6-11a', --Ojo Derecho Normal (10 – 20 mm Hg)

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('N'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('N'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('N'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('N'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('N'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_NORMAL_ADOLES_3-5a', --Ojo Derecho Normal (10 – 20 mm Hg)

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('N'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('N'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('N'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('N'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('N'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_NORMAL_JOVEN_18-29a', --Ojo Derecho Normal (10 – 20 mm Hg)

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('N'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('N'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('N'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('N'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('N'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_NORMAL_ADUL1_30-49a', --Ojo Derecho Normal (10 – 20 mm Hg)

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('N'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('N'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('N'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('N'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('N'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_NORMAL_ADUL2_50-59a', --Ojo Derecho Normal (10 – 20 mm Hg)

---ADULTO MAYOR

SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('N'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('N'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('N'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('N'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('N'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_NORMAL_ADUL_MAY_60a_Mas', --Ojo Derecho Normal (10 – 20 mm Hg)

---Ojo Derecho Anormal (> 20 mm Hg)
--TD=D + DX= 92100 + LAB1= A
--NIÑO----------------
SUM (CASE WHEN EDAD<103 and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('A'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('A'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('A'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('A'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('A'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_ANORMAL_NINO_0d-2a', --Ojo Derecho Anormal (> 20 mm Hg)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('A'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('A'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('A'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('A'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('A'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_ANORMAL_NINO_3-5a', --Ojo Derecho Anormal (> 20 mm Hg)

SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('A'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('A'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('A'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('A'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('A'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_ANORMAL_NINO_6-11a', --Ojo Derecho Anormal (> 20 mm Hg)

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('A'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('A'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('A'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('A'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('A'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_ANORMAL_ADOLES_3-5a', --Ojo Derecho Anormal (> 20 mm Hg)

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('A'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('A'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('A'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('A'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('A'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_ANORMAL_JOVEN_18-29a', --Ojo Derecho Anormal (> 20 mm Hg)

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('A'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('A'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('A'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('A'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('A'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_ANORMAL_ADUL1_30-49a', --Ojo Derecho Anormal (> 20 mm Hg)

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('A'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('A'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('A'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('A'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('A'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_ANORMAL_ADUL2_50-59a', --Ojo Derecho Anormal (> 20 mm Hg)

---ADULTO MAYOR

SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='92100' AND diagnost1 ='D' AND labconf1 IN ('A'))OR
(CODIGO2='92100' AND diagnost2 ='D' AND labconf2 IN ('A'))OR
(CODIGO3='92100' AND diagnost3 ='D' AND labconf3 IN ('A'))OR
(CODIGO4='92100' AND diagnost4 ='D' AND labconf4 IN ('A'))OR
(CODIGO5='92100' AND diagnost5 ='D' AND labconf5 IN ('A'))OR
(CODIGO6='92100' AND diagnost6 ='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_DERECHO_ANORMAL_ADUL_MAY_60a_Mas', --Ojo Derecho Anormal (> 20 mm Hg)

---Ojo Izquierdo Normal (10 – 20 mm Hg)----
---TD=D + DX= 92100 + LAB2= N---
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('N'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('N'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('N'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('N'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_NINO_0d-2a', --Ojo Izquierdo Normal (10 – 20 mm Hg)----

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('N'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('N'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('N'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('N'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_NINO_3-5a', --Ojo Izquierdo Normal (10 – 20 mm Hg)----
--NIÑO-----------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('N'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('N'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('N'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('N'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_NINO_6-11a', --Ojo Izquierdo Normal (10 – 20 mm Hg)----

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('N'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('N'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('N'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('N'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_ADOLES_12-17a', --Ojo Izquierdo Normal (10 – 20 mm Hg)----

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('N'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('N'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('N'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('N'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_JOV_18-29a', --Ojo Izquierdo Normal (10 – 20 mm Hg)----

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('N'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('N'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('N'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('N'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_ADUL1_30-49a', --Ojo Izquierdo Normal (10 – 20 mm Hg)----

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('N'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('N'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('N'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('N'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_ADUL2_50-59a', --Ojo Izquierdo Normal (10 – 20 mm Hg)----

---ADULTO MAYOR

SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('N'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('N'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('N'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('N'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('N')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_NORMAL_ADUL_MAY_60a_Mas', --Ojo Izquierdo Normal (10 – 20 mm Hg)----

--Ojo Izquierdo Anormal (> 20 mm Hg)
--TD=D + DX= 92100 + LAB2= A
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('A'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('A'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('A'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('A'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_ANORMAL1_NINO_0d-2a', --Ojo Izquierdo Anormal (> 20 mm Hg)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('A'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('A'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('A'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('A'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_ANORMAL1_NINO_3-5a', --Ojo Izquierdo Anormal (> 20 mm Hg)
--NIÑO-----------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('A'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('A'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('A'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('A'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_ANORMAL1_NINO_6-11a', --Ojo Izquierdo Anormal (> 20 mm Hg)

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('A'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('A'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('A'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('A'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_ANORMAL1_ADOLES_12-17a', --Ojo Izquierdo Anormal (> 20 mm Hg)

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('A'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('A'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('A'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('A'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_ANORMAL1_JOV_18-29a', --Ojo Izquierdo Anormal (> 20 mm Hg)

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('A'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('A'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('A'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('A'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_ANORMAL1_ADUL1_30-49a', --Ojo Izquierdo Anormal (> 20 mm Hg)

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('A'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('A'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('A'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('A'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_ANORMAL1_ADUL2_50-59a', --Ojo Izquierdo Anormal (> 20 mm Hg)

---ADULTO MAYOR

SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((codigo1='92100' AND diagnost1='D' AND labconf2 IN ('A'))OR
(codigo2='92100' AND diagnost2='D' AND labconf3 IN ('A'))OR
(codigo3='92100' AND diagnost3='D' AND labconf4 IN ('A'))OR
(codigo4='92100' AND diagnost4='D' AND labconf5 IN ('A'))OR
(codigo5='92100' AND diagnost5='D' AND labconf6 IN ('A')))
THEN 1 ELSE 0 END) AS 'OJO_IZQ_ANORMAL1_ADUL_MAY_60a_Mas', --Ojo Izquierdo Anormal (> 20 mm Hg)

------------PATOLOGÍAS----------------------
---H543 Discapacidad visual leve
---TD=D + DX= H543 ---
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H543' AND diagnost1 ='D')OR
(CODIGO2='H543' AND diagnost2 ='D')OR
(CODIGO3='H543' AND diagnost3 ='D')OR
(CODIGO4='H543' AND diagnost4 ='D')OR
(CODIGO5='H543' AND diagnost5 ='D')OR
(CODIGO6='H543' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCAP_VISUAL_LEV_0d-2a', --H543 Discapacidad visual leve

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H543' AND diagnost1 ='D')OR
(CODIGO2='H543' AND diagnost2 ='D')OR
(CODIGO3='H543' AND diagnost3 ='D')OR
(CODIGO4='H543' AND diagnost4 ='D')OR
(CODIGO5='H543' AND diagnost5 ='D')OR
(CODIGO6='H543' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCAP_VISUAL_LEV_3-5a', --H543 Discapacidad visual leve


SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H543' AND diagnost1 ='D')OR
(CODIGO2='H543' AND diagnost2 ='D')OR
(CODIGO3='H543' AND diagnost3 ='D')OR
(CODIGO4='H543' AND diagnost4 ='D')OR
(CODIGO5='H543' AND diagnost5 ='D')OR
(CODIGO6='H543' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCAP_VISUAL_LEV_6-11a', --H543 Discapacidad visual leve


---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H543' AND diagnost1 ='D')OR
(CODIGO2='H543' AND diagnost2 ='D')OR
(CODIGO3='H543' AND diagnost3 ='D')OR
(CODIGO4='H543' AND diagnost4 ='D')OR
(CODIGO5='H543' AND diagnost5 ='D')OR
(CODIGO6='H543' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCAP_VISUAL_LEV_12-17a', --H543 Discapacidad visual leve

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H543' AND diagnost1 ='D')OR
(CODIGO2='H543' AND diagnost2 ='D')OR
(CODIGO3='H543' AND diagnost3 ='D')OR
(CODIGO4='H543' AND diagnost4 ='D')OR
(CODIGO5='H543' AND diagnost5 ='D')OR
(CODIGO6='H543' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCAP_VISUAL_LEV_18-29a', --H543 Discapacidad visual leve

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H543' AND diagnost1 ='D')OR
(CODIGO2='H543' AND diagnost2 ='D')OR
(CODIGO3='H543' AND diagnost3 ='D')OR
(CODIGO4='H543' AND diagnost4 ='D')OR
(CODIGO5='H543' AND diagnost5 ='D')OR
(CODIGO6='H543' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCAP_VISUAL_LEV_30-49a', --H543 Discapacidad visual leve

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H543' AND diagnost1 ='D')OR
(CODIGO2='H543' AND diagnost2 ='D')OR
(CODIGO3='H543' AND diagnost3 ='D')OR
(CODIGO4='H543' AND diagnost4 ='D')OR
(CODIGO5='H543' AND diagnost5 ='D')OR
(CODIGO6='H543' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCAP_VISUAL_LEV_50-59a', --H543 Discapacidad visual leve

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H543' AND diagnost1 ='D')OR
(CODIGO2='H543' AND diagnost2 ='D')OR
(CODIGO3='H543' AND diagnost3 ='D')OR
(CODIGO4='H543' AND diagnost4 ='D')OR
(CODIGO5='H543' AND diagnost5 ='D')OR
(CODIGO6='H543' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCAP_VISUAL_LEV_60a_Mas', --H543 Discapacidad visual leve

---H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)
----TD=D + DX= H546
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_OJO_DVMM_0d-2a', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_OJO_DVMM_3-5a', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)


SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_OJO_DVMM_6-11a', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)


---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_OJO_DVMM_12-17a', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_OJO_DVMM_18-29a', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_OJO_DVMM_30-49a', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_OJO_DVMM_50-59a', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_OJO_DVMM_60a_Mas', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

--H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)
---TD=D + DX= H542
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_AMB_OJOS_DVMB_0d-2a', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_AMB_OJOS_DVMB_3-5a', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)


SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_AMB_OJOS_DVMB_6-11a', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)


---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_AMB_OJOS_DVMB_12-17a', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_AMB_OJOS_DVMB_18-29a', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_AMB_OJOS_DVMB_30-49a', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_AMB_OJOS_DVMB_50-59a', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDET_AGU_V_AMB_OJOS_DVMB_60a_Mas', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

---H545 Discapacidad visual grave, monocular
---TD=D + DX= H545
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H545' AND diagnost1 ='D')OR
(CODIGO2='H545' AND diagnost2 ='D')OR
(CODIGO3='H545' AND diagnost3 ='D')OR
(CODIGO4='H545' AND diagnost4 ='D')OR
(CODIGO5='H545' AND diagnost5 ='D')OR
(CODIGO6='H545' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_0d-2a', --H545 Discapacidad visual grave, monocular

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H545' AND diagnost1 ='D')OR
(CODIGO2='H545' AND diagnost2 ='D')OR
(CODIGO3='H545' AND diagnost3 ='D')OR
(CODIGO4='H545' AND diagnost4 ='D')OR
(CODIGO5='H545' AND diagnost5 ='D')OR
(CODIGO6='H545' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_3-5a', --H545 Discapacidad visual grave, monocular


SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H545' AND diagnost1 ='D')OR
(CODIGO2='H545' AND diagnost2 ='D')OR
(CODIGO3='H545' AND diagnost3 ='D')OR
(CODIGO4='H545' AND diagnost4 ='D')OR
(CODIGO5='H545' AND diagnost5 ='D')OR
(CODIGO6='H545' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_6-11a', --H545 Discapacidad visual grave, monocular


---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H545' AND diagnost1 ='D')OR
(CODIGO2='H545' AND diagnost2 ='D')OR
(CODIGO3='H545' AND diagnost3 ='D')OR
(CODIGO4='H545' AND diagnost4 ='D')OR
(CODIGO5='H545' AND diagnost5 ='D')OR
(CODIGO6='H545' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_12-17a', --H545 Discapacidad visual grave, monocular

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H545' AND diagnost1 ='D')OR
(CODIGO2='H545' AND diagnost2 ='D')OR
(CODIGO3='H545' AND diagnost3 ='D')OR
(CODIGO4='H545' AND diagnost4 ='D')OR
(CODIGO5='H545' AND diagnost5 ='D')OR
(CODIGO6='H545' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_18-29a', --H545 Discapacidad visual grave, monocular

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H545' AND diagnost1 ='D')OR
(CODIGO2='H545' AND diagnost2 ='D')OR
(CODIGO3='H545' AND diagnost3 ='D')OR
(CODIGO4='H545' AND diagnost4 ='D')OR
(CODIGO5='H545' AND diagnost5 ='D')OR
(CODIGO6='H545' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_30-49a', --H545 Discapacidad visual grave, monocular

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H545' AND diagnost1 ='D')OR
(CODIGO2='H545' AND diagnost2 ='D')OR
(CODIGO3='H545' AND diagnost3 ='D')OR
(CODIGO4='H545' AND diagnost4 ='D')OR
(CODIGO5='H545' AND diagnost5 ='D')OR
(CODIGO6='H545' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_50-59a', --H545 Discapacidad visual grave, monocular

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H545' AND diagnost1 ='D')OR
(CODIGO2='H545' AND diagnost2 ='D')OR
(CODIGO3='H545' AND diagnost3 ='D')OR
(CODIGO4='H545' AND diagnost4 ='D')OR
(CODIGO5='H545' AND diagnost5 ='D')OR
(CODIGO6='H545' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_60a_Mas', --H545 Discapacidad visual grave, monocular

--H541 Discapacidad visual grave, binocular
--TD=D + DX= H541
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H541' AND diagnost1 ='D')OR
(CODIGO2='H541' AND diagnost2 ='D')OR
(CODIGO3='H541' AND diagnost3 ='D')OR
(CODIGO4='H541' AND diagnost4 ='D')OR
(CODIGO5='H541' AND diagnost5 ='D')OR
(CODIGO6='H541' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_B_0d-2a', --H541 Discapacidad visual grave, binocular

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H541' AND diagnost1 ='D')OR
(CODIGO2='H541' AND diagnost2 ='D')OR
(CODIGO3='H541' AND diagnost3 ='D')OR
(CODIGO4='H541' AND diagnost4 ='D')OR
(CODIGO5='H541' AND diagnost5 ='D')OR
(CODIGO6='H541' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_B_3-5a', --H541 Discapacidad visual grave, binocular


SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H541' AND diagnost1 ='D')OR
(CODIGO2='H541' AND diagnost2 ='D')OR
(CODIGO3='H541' AND diagnost3 ='D')OR
(CODIGO4='H541' AND diagnost4 ='D')OR
(CODIGO5='H541' AND diagnost5 ='D')OR
(CODIGO6='H541' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_B_6-11a', --H541 Discapacidad visual grave, binocular


---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H541' AND diagnost1 ='D')OR
(CODIGO2='H541' AND diagnost2 ='D')OR
(CODIGO3='H541' AND diagnost3 ='D')OR
(CODIGO4='H541' AND diagnost4 ='D')OR
(CODIGO5='H541' AND diagnost5 ='D')OR
(CODIGO6='H541' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_B_12-17a', --H541 Discapacidad visual grave, binocular

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H541' AND diagnost1 ='D')OR
(CODIGO2='H541' AND diagnost2 ='D')OR
(CODIGO3='H541' AND diagnost3 ='D')OR
(CODIGO4='H541' AND diagnost4 ='D')OR
(CODIGO5='H541' AND diagnost5 ='D')OR
(CODIGO6='H541' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_B_18-29a', --H541 Discapacidad visual grave, binocular

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H541' AND diagnost1 ='D')OR
(CODIGO2='H541' AND diagnost2 ='D')OR
(CODIGO3='H541' AND diagnost3 ='D')OR
(CODIGO4='H541' AND diagnost4 ='D')OR
(CODIGO5='H541' AND diagnost5 ='D')OR
(CODIGO6='H541' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_B_30-49a', --H541 Discapacidad visual grave, binocular

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H541' AND diagnost1 ='D')OR
(CODIGO2='H541' AND diagnost2 ='D')OR
(CODIGO3='H541' AND diagnost3 ='D')OR
(CODIGO4='H541' AND diagnost4 ='D')OR
(CODIGO5='H541' AND diagnost5 ='D')OR
(CODIGO6='H541' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_B_50-59a', --H541 Discapacidad visual grave, binocular

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H541' AND diagnost1 ='D')OR
(CODIGO2='H541' AND diagnost2 ='D')OR
(CODIGO3='H541' AND diagnost3 ='D')OR
(CODIGO4='H541' AND diagnost4 ='D')OR
(CODIGO5='H541' AND diagnost5 ='D')OR
(CODIGO6='H541' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISCP_VISUAL_GRAVE_B_60a_Mas', --H541 Discapacidad visual grave, binocular

--H544 Ceguera de un ojo (ceguera monocular)
--TD=D + DX= H544
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H544' AND diagnost1 ='D')OR
(CODIGO2='H544' AND diagnost2 ='D')OR
(CODIGO3='H544' AND diagnost3 ='D')OR
(CODIGO4='H544' AND diagnost4 ='D')OR
(CODIGO5='H544' AND diagnost5 ='D')OR
(CODIGO6='H544' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_DE_UN_OJO_CM_0d-2a', --H544 Ceguera de un ojo (ceguera monocular)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H544' AND diagnost1 ='D')OR
(CODIGO2='H544' AND diagnost2 ='D')OR
(CODIGO3='H544' AND diagnost3 ='D')OR
(CODIGO4='H544' AND diagnost4 ='D')OR
(CODIGO5='H544' AND diagnost5 ='D')OR
(CODIGO6='H544' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_DE_UN_OJO_CM_3-5a', --H544 Ceguera de un ojo (ceguera monocular)


SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H544' AND diagnost1 ='D')OR
(CODIGO2='H544' AND diagnost2 ='D')OR
(CODIGO3='H544' AND diagnost3 ='D')OR
(CODIGO4='H544' AND diagnost4 ='D')OR
(CODIGO5='H544' AND diagnost5 ='D')OR
(CODIGO6='H544' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_DE_UN_OJO_CM_6-11a', --H544 Ceguera de un ojo (ceguera monocular)


---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H544' AND diagnost1 ='D')OR
(CODIGO2='H544' AND diagnost2 ='D')OR
(CODIGO3='H544' AND diagnost3 ='D')OR
(CODIGO4='H544' AND diagnost4 ='D')OR
(CODIGO5='H544' AND diagnost5 ='D')OR
(CODIGO6='H544' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_DE_UN_OJO_CM_12-17a', --H544 Ceguera de un ojo (ceguera monocular)

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H544' AND diagnost1 ='D')OR
(CODIGO2='H544' AND diagnost2 ='D')OR
(CODIGO3='H544' AND diagnost3 ='D')OR
(CODIGO4='H544' AND diagnost4 ='D')OR
(CODIGO5='H544' AND diagnost5 ='D')OR
(CODIGO6='H544' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_DE_UN_OJO_CM_18-29a', --H544 Ceguera de un ojo (ceguera monocular)

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H544' AND diagnost1 ='D')OR
(CODIGO2='H544' AND diagnost2 ='D')OR
(CODIGO3='H544' AND diagnost3 ='D')OR
(CODIGO4='H544' AND diagnost4 ='D')OR
(CODIGO5='H544' AND diagnost5 ='D')OR
(CODIGO6='H544' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_DE_UN_OJO_CM_30-49a', --H544 Ceguera de un ojo (ceguera monocular)

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H544' AND diagnost1 ='D')OR
(CODIGO2='H544' AND diagnost2 ='D')OR
(CODIGO3='H544' AND diagnost3 ='D')OR
(CODIGO4='H544' AND diagnost4 ='D')OR
(CODIGO5='H544' AND diagnost5 ='D')OR
(CODIGO6='H544' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_DE_UN_OJO_CM_50-59a', --H544 Ceguera de un ojo (ceguera monocular)

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H544' AND diagnost1 ='D')OR
(CODIGO2='H544' AND diagnost2 ='D')OR
(CODIGO3='H544' AND diagnost3 ='D')OR
(CODIGO4='H544' AND diagnost4 ='D')OR
(CODIGO5='H544' AND diagnost5 ='D')OR
(CODIGO6='H544' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_DE_UN_OJO_CM_60a_Mas', --H544 Ceguera de un ojo (ceguera monocular)

---H540 Ceguera en ambos ojos (ceguera binocular)
--TD=D + DX= H540
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H540' AND diagnost1 ='D')OR
(CODIGO2='H540' AND diagnost2 ='D')OR
(CODIGO3='H540' AND diagnost3 ='D')OR
(CODIGO4='H540' AND diagnost4 ='D')OR
(CODIGO5='H540' AND diagnost5 ='D')OR
(CODIGO6='H540' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_AMBOS_OJOS_CB_0d-2a', --H540 Ceguera en ambos ojos (ceguera binocular)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H540' AND diagnost1 ='D')OR
(CODIGO2='H540' AND diagnost2 ='D')OR
(CODIGO3='H540' AND diagnost3 ='D')OR
(CODIGO4='H540' AND diagnost4 ='D')OR
(CODIGO5='H540' AND diagnost5 ='D')OR
(CODIGO6='H540' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_AMBOS_OJOS_CB_3-5a', --H540 Ceguera en ambos ojos (ceguera binocular)
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H540' AND diagnost1 ='D')OR
(CODIGO2='H540' AND diagnost2 ='D')OR
(CODIGO3='H540' AND diagnost3 ='D')OR
(CODIGO4='H540' AND diagnost4 ='D')OR
(CODIGO5='H540' AND diagnost5 ='D')OR
(CODIGO6='H540' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_AMBOS_OJOS_CB_6-11a', --H540 Ceguera en ambos ojos (ceguera binocular)

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H540' AND diagnost1 ='D')OR
(CODIGO2='H540' AND diagnost2 ='D')OR
(CODIGO3='H540' AND diagnost3 ='D')OR
(CODIGO4='H540' AND diagnost4 ='D')OR
(CODIGO5='H540' AND diagnost5 ='D')OR
(CODIGO6='H540' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_AMBOS_OJOS_CB_12-17a', --H540 Ceguera en ambos ojos (ceguera binocular)

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H540' AND diagnost1 ='D')OR
(CODIGO2='H540' AND diagnost2 ='D')OR
(CODIGO3='H540' AND diagnost3 ='D')OR
(CODIGO4='H540' AND diagnost4 ='D')OR
(CODIGO5='H540' AND diagnost5 ='D')OR
(CODIGO6='H540' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_AMBOS_OJOS_CB_18-29a', --H540 Ceguera en ambos ojos (ceguera binocular)

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H540' AND diagnost1 ='D')OR
(CODIGO2='H540' AND diagnost2 ='D')OR
(CODIGO3='H540' AND diagnost3 ='D')OR
(CODIGO4='H540' AND diagnost4 ='D')OR
(CODIGO5='H540' AND diagnost5 ='D')OR
(CODIGO6='H540' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_AMBOS_OJOS_CB_30-49a', --H540 Ceguera en ambos ojos (ceguera binocular)
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H540' AND diagnost1 ='D')OR
(CODIGO2='H540' AND diagnost2 ='D')OR
(CODIGO3='H540' AND diagnost3 ='D')OR
(CODIGO4='H540' AND diagnost4 ='D')OR
(CODIGO5='H540' AND diagnost5 ='D')OR
(CODIGO6='H540' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_AMBOS_OJOS_CB_50-59a', --H540 Ceguera en ambos ojos (ceguera binocular)

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H540' AND diagnost1 ='D')OR
(CODIGO2='H540' AND diagnost2 ='D')OR
(CODIGO3='H540' AND diagnost3 ='D')OR
(CODIGO4='H540' AND diagnost4 ='D')OR
(CODIGO5='H540' AND diagnost5 ='D')OR
(CODIGO6='H540' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'CEGUERA_AMBOS_OJOS_CB_60a_Mas', --H540 Ceguera en ambos ojos (ceguera binocular)

-----REFERENCIA DE PACIENTES----------------------------
--Pacientes Referidos para Diagnóstico
--TD=D + DX= (H250, H251, H252, H258, H259, H260, H261, H262, H263, H264, H268, H269, H280, H400,
--H409, H543, H546, H542, H545, H541, H544,H540) + LAB= DVR
--NIÑO---
SUM (CASE WHEN EDAD<103 and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVR' OR LABCONF2='DVR' OR LABCONF3='DVR' OR LABCONF4='DVR' OR LABCONF5='DVR' OR LABCONF6='DVR')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_DX_0d-2a', --Pacientes Referidos para Diagnóstico

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVR' OR LABCONF2='DVR' OR LABCONF3='DVR' OR LABCONF4='DVR' OR LABCONF5='DVR' OR LABCONF6='DVR')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_DX_3-5a', --Pacientes Referidos para Diagnóstico

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVR' OR LABCONF2='DVR' OR LABCONF3='DVR' OR LABCONF4='DVR' OR LABCONF5='DVR' OR LABCONF6='DVR')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_DX_6-11a', --Pacientes Referidos para Diagnóstico

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVR' OR LABCONF2='DVR' OR LABCONF3='DVR' OR LABCONF4='DVR' OR LABCONF5='DVR' OR LABCONF6='DVR')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_DX_12-17a', --Pacientes Referidos para Diagnóstico

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVR' OR LABCONF2='DVR' OR LABCONF3='DVR' OR LABCONF4='DVR' OR LABCONF5='DVR' OR LABCONF6='DVR')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_DX_18-29a', --Pacientes Referidos para Diagnóstico

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVR' OR LABCONF2='DVR' OR LABCONF3='DVR' OR LABCONF4='DVR' OR LABCONF5='DVR' OR LABCONF6='DVR')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_DX_30-49a', --Pacientes Referidos para Diagnóstico

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVR' OR LABCONF2='DVR' OR LABCONF3='DVR' OR LABCONF4='DVR' OR LABCONF5='DVR' OR LABCONF6='DVR')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_DX_50-59a', --Pacientes Referidos para Diagnóstico

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVR' OR LABCONF2='DVR' OR LABCONF3='DVR' OR LABCONF4='DVR' OR LABCONF5='DVR' OR LABCONF6='DVR')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_DX_60a_Mas', --Pacientes Referidos para Diagnóstico

-----Pacientes Referidos que llegaron a EESS para Diagnóstico
---TD=D + DX= (H250, H251, H252, H258, H259, H260, H261, H262, H263, H264, H268, H269, H280,
---H400, H409, H543, H546, H542, H545, H541, H544,H540) + LAB= DVC

--NIÑO---
SUM (CASE WHEN EDAD<103 and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVC' OR LABCONF2='DVC' OR LABCONF3='DVC' OR LABCONF4='DVC' OR LABCONF5='DVC' OR LABCONF6='DVC')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_EESS_DX_0d-2a', --Pacientes Referidos que llegaron a EESS para Diagnóstico

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVC' OR LABCONF2='DVC' OR LABCONF3='DVC' OR LABCONF4='DVC' OR LABCONF5='DVC' OR LABCONF6='DVC')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_EESS_DX_3-5a', --Pacientes Referidos que llegaron a EESS para Diagnóstico

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVC' OR LABCONF2='DVC' OR LABCONF3='DVC' OR LABCONF4='DVC' OR LABCONF5='DVC' OR LABCONF6='DVC')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_EESS_DX_6-11a', --Pacientes Referidos que llegaron a EESS para Diagnóstico

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVC' OR LABCONF2='DVC' OR LABCONF3='DVC' OR LABCONF4='DVC' OR LABCONF5='DVC' OR LABCONF6='DVC')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_EESS_DX_12-17a', --Pacientes Referidos que llegaron a EESS para Diagnóstico

----JOVEN-------

SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVC' OR LABCONF2='DVC' OR LABCONF3='DVC' OR LABCONF4='DVC' OR LABCONF5='DVC' OR LABCONF6='DVC')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_EESS_DX_18-29a', --Pacientes Referidos que llegaron a EESS para Diagnóstico

------ADULTO--------

SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVC' OR LABCONF2='DVC' OR LABCONF3='DVC' OR LABCONF4='DVC' OR LABCONF5='DVC' OR LABCONF6='DVC')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_EESS_DX_30-49a', --Pacientes Referidos que llegaron a EESS para Diagnóstico

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVC' OR LABCONF2='DVC' OR LABCONF3='DVC' OR LABCONF4='DVC' OR LABCONF5='DVC' OR LABCONF6='DVC')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_EESS_DX_50-59a', --Pacientes Referidos que llegaron a EESS para Diagnóstico

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((codigo1 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo2 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo3 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo4 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo5 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540'))OR
(codigo6 IN ('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409','H543','H546','H542','H545','H541','H544','H540')))AND
(LABCONF1='DVC' OR LABCONF2='DVC' OR LABCONF3='DVC' OR LABCONF4='DVC' OR LABCONF5='DVC' OR LABCONF6='DVC')
THEN 1 ELSE 0 END) AS 'PACIENTES_REF_EESS_DX_60a_Mas', --Pacientes Referidos que llegaron a EESS para Diagnóstico

----DIAGNÓSTICO DE CEGUERA POR CATARATA------------------------------------------------------------------------------
---PROCEDIMIENTOS--------------------
--99173 Determinación de la Agudeza Visual-----
--TD=D + DX= 99173 + DX= (H250, H251, H252, H258, H259, H260, H261, H262, H263, H264, H268, H269, H280, H400, H409)
SUM (CASE WHEN EDAD<103 and
((codigo1 ='99173' AND DIAGNOST1='D')OR
(codigo2 ='99173' AND DIAGNOST2='D')OR
(codigo3 ='99173' AND DIAGNOST3='D')OR
(codigo4 ='99173' AND DIAGNOST4='D')OR
(codigo5 ='99173' AND DIAGNOST5='D')OR
(codigo6 ='99173' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_AGUDEZA_VISUAL_0d-2a', --99173 Determinación de la Agudeza Visual-----

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((codigo1 ='99173' AND DIAGNOST1='D')OR
(codigo2 ='99173' AND DIAGNOST2='D')OR
(codigo3 ='99173' AND DIAGNOST3='D')OR
(codigo4 ='99173' AND DIAGNOST4='D')OR
(codigo5 ='99173' AND DIAGNOST5='D')OR
(codigo6 ='99173' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_AGUDEZA_VISUAL_3-5a', --99173 Determinación de la Agudeza Visual-----

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((codigo1 ='99173' AND DIAGNOST1='D')OR
(codigo2 ='99173' AND DIAGNOST2='D')OR
(codigo3 ='99173' AND DIAGNOST3='D')OR
(codigo4 ='99173' AND DIAGNOST4='D')OR
(codigo5 ='99173' AND DIAGNOST5='D')OR
(codigo6 ='99173' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_AGUDEZA_VISUAL_6-11a', --99173 Determinación de la Agudeza Visual-----

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((codigo1 ='99173' AND DIAGNOST1='D')OR
(codigo2 ='99173' AND DIAGNOST2='D')OR
(codigo3 ='99173' AND DIAGNOST3='D')OR
(codigo4 ='99173' AND DIAGNOST4='D')OR
(codigo5 ='99173' AND DIAGNOST5='D')OR
(codigo6 ='99173' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_AGUDEZA_VISUAL_12-17a', --99173 Determinación de la Agudeza Visual-----

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((codigo1 ='99173' AND DIAGNOST1='D')OR
(codigo2 ='99173' AND DIAGNOST2='D')OR
(codigo3 ='99173' AND DIAGNOST3='D')OR
(codigo4 ='99173' AND DIAGNOST4='D')OR
(codigo5 ='99173' AND DIAGNOST5='D')OR
(codigo6 ='99173' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_AGUDEZA_VISUAL_18-29a', --99173 Determinación de la Agudeza Visual-----

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((codigo1 ='99173' AND DIAGNOST1='D')OR
(codigo2 ='99173' AND DIAGNOST2='D')OR
(codigo3 ='99173' AND DIAGNOST3='D')OR
(codigo4 ='99173' AND DIAGNOST4='D')OR
(codigo5 ='99173' AND DIAGNOST5='D')OR
(codigo6 ='99173' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_AGUDEZA_VISUAL_30-49a', --99173 Determinación de la Agudeza Visual-----

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((codigo1 ='99173' AND DIAGNOST1='D')OR
(codigo2 ='99173' AND DIAGNOST2='D')OR
(codigo3 ='99173' AND DIAGNOST3='D')OR
(codigo4 ='99173' AND DIAGNOST4='D')OR
(codigo5 ='99173' AND DIAGNOST5='D')OR
(codigo6 ='99173' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_AGUDEZA_VISUAL_50-59a', --99173 Determinación de la Agudeza Visual-----

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((codigo1 ='99173' AND DIAGNOST1='D')OR
(codigo2 ='99173' AND DIAGNOST2='D')OR
(codigo3 ='99173' AND DIAGNOST3='D')OR
(codigo4 ='99173' AND DIAGNOST4='D')OR
(codigo5 ='99173' AND DIAGNOST5='D')OR
(codigo6 ='99173' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_AGUDEZA_VISUAL_60a_Mas', --99173 Determinación de la Agudeza Visual-----

---92100 Determinación de la Presión Intraocular Bilateral
---TD=D + DX= 92100 + DX= (H250, H251, H252, H258, H259, H260, H261, H262, H263, H264, H268, H269, H280, H400, H409)

--NIÑO
SUM (CASE WHEN EDAD<103 and
((codigo1 ='92100' AND DIAGNOST1='D')OR
(codigo2 ='92100' AND DIAGNOST2='D')OR
(codigo3 ='92100' AND DIAGNOST3='D')OR
(codigo4 ='92100' AND DIAGNOST4='D')OR
(codigo5 ='92100' AND DIAGNOST5='D')OR
(codigo6 ='92100' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_PRES_INTRA_BILAT_0d-2a', --92100 Determinación de la Presión Intraocular Bilateral

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((codigo1 ='92100' AND DIAGNOST1='D')OR
(codigo2 ='92100' AND DIAGNOST2='D')OR
(codigo3 ='92100' AND DIAGNOST3='D')OR
(codigo4 ='92100' AND DIAGNOST4='D')OR
(codigo5 ='92100' AND DIAGNOST5='D')OR
(codigo6 ='92100' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_PRES_INTRA_BILAT_3-5a', --92100 Determinación de la Presión Intraocular Bilateral

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((codigo1 ='92100' AND DIAGNOST1='D')OR
(codigo2 ='92100' AND DIAGNOST2='D')OR
(codigo3 ='92100' AND DIAGNOST3='D')OR
(codigo4 ='92100' AND DIAGNOST4='D')OR
(codigo5 ='92100' AND DIAGNOST5='D')OR
(codigo6 ='92100' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_PRES_INTRA_BILAT_6-11a', --92100 Determinación de la Presión Intraocular Bilateral

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((codigo1 ='92100' AND DIAGNOST1='D')OR
(codigo2 ='92100' AND DIAGNOST2='D')OR
(codigo3 ='92100' AND DIAGNOST3='D')OR
(codigo4 ='92100' AND DIAGNOST4='D')OR
(codigo5 ='92100' AND DIAGNOST5='D')OR
(codigo6 ='92100' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_PRES_INTRA_BILAT_12-17a', --92100 Determinación de la Presión Intraocular Bilateral

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((codigo1 ='92100' AND DIAGNOST1='D')OR
(codigo2 ='92100' AND DIAGNOST2='D')OR
(codigo3 ='92100' AND DIAGNOST3='D')OR
(codigo4 ='92100' AND DIAGNOST4='D')OR
(codigo5 ='92100' AND DIAGNOST5='D')OR
(codigo6 ='92100' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_PRES_INTRA_BILAT_18-29a', --92100 Determinación de la Presión Intraocular Bilateral

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((codigo1 ='92100' AND DIAGNOST1='D')OR
(codigo2 ='92100' AND DIAGNOST2='D')OR
(codigo3 ='92100' AND DIAGNOST3='D')OR
(codigo4 ='92100' AND DIAGNOST4='D')OR
(codigo5 ='92100' AND DIAGNOST5='D')OR
(codigo6 ='92100' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_PRES_INTRA_BILAT_30-49a', --92100 Determinación de la Presión Intraocular Bilateral

SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((codigo1 ='92100' AND DIAGNOST1='D')OR
(codigo2 ='92100' AND DIAGNOST2='D')OR
(codigo3 ='92100' AND DIAGNOST3='D')OR
(codigo4 ='92100' AND DIAGNOST4='D')OR
(codigo5 ='92100' AND DIAGNOST5='D')OR
(codigo6 ='92100' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_PRES_INTRA_BILAT_50-59a', --92100 Determinación de la Presión Intraocular Bilateral

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((codigo1 ='92100' AND DIAGNOST1='D')OR
(codigo2 ='92100' AND DIAGNOST2='D')OR
(codigo3 ='92100' AND DIAGNOST3='D')OR
(codigo4 ='92100' AND DIAGNOST4='D')OR
(codigo5 ='92100' AND DIAGNOST5='D')OR
(codigo6 ='92100' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'DETER_PRES_INTRA_BILAT_60a_Mas', --92100 Determinación de la Presión Intraocular Bilateral

---76516 Biometría ocular por ultrasonido-----
--TD=D + DX= 76516

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='76516' AND diagnost1 ='D')OR
(CODIGO2='76516' AND diagnost2 ='D')OR
(CODIGO3='76516' AND diagnost3 ='D')OR
(CODIGO4='76516' AND diagnost4 ='D')OR
(CODIGO5='76516' AND diagnost5 ='D')OR
(CODIGO6='76516' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'BIOMETRIA_OCU_ULTRAS_CB_0d-2a', --76516 Biometría ocular por ultrasonido-----

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='76516' AND diagnost1 ='D')OR
(CODIGO2='76516' AND diagnost2 ='D')OR
(CODIGO3='76516' AND diagnost3 ='D')OR
(CODIGO4='76516' AND diagnost4 ='D')OR
(CODIGO5='76516' AND diagnost5 ='D')OR
(CODIGO6='76516' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'BIOMETRIA_OCU_ULTRAS_CB_3-5a', --76516 Biometría ocular por ultrasonido-----
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='76516' AND diagnost1 ='D')OR
(CODIGO2='76516' AND diagnost2 ='D')OR
(CODIGO3='76516' AND diagnost3 ='D')OR
(CODIGO4='76516' AND diagnost4 ='D')OR
(CODIGO5='76516' AND diagnost5 ='D')OR
(CODIGO6='76516' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'BIOMETRIA_OCU_ULTRAS_CB_6-11a', --76516 Biometría ocular por ultrasonido-----

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='76516' AND diagnost1 ='D')OR
(CODIGO2='76516' AND diagnost2 ='D')OR
(CODIGO3='76516' AND diagnost3 ='D')OR
(CODIGO4='76516' AND diagnost4 ='D')OR
(CODIGO5='76516' AND diagnost5 ='D')OR
(CODIGO6='76516' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'BIOMETRIA_OCU_ULTRAS_CB_12-17a', --76516 Biometría ocular por ultrasonido-----

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='76516' AND diagnost1 ='D')OR
(CODIGO2='76516' AND diagnost2 ='D')OR
(CODIGO3='76516' AND diagnost3 ='D')OR
(CODIGO4='76516' AND diagnost4 ='D')OR
(CODIGO5='76516' AND diagnost5 ='D')OR
(CODIGO6='76516' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'BIOMETRIA_OCU_ULTRAS_CB_18-29a', --76516 Biometría ocular por ultrasonido-----

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='76516' AND diagnost1 ='D')OR
(CODIGO2='76516' AND diagnost2 ='D')OR
(CODIGO3='76516' AND diagnost3 ='D')OR
(CODIGO4='76516' AND diagnost4 ='D')OR
(CODIGO5='76516' AND diagnost5 ='D')OR
(CODIGO6='76516' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'BIOMETRIA_OCU_ULTRAS_CB_30-49a', --76516 Biometría ocular por ultrasonido-----
--ADULTO-----------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='76516' AND diagnost1 ='D')OR
(CODIGO2='76516' AND diagnost2 ='D')OR
(CODIGO3='76516' AND diagnost3 ='D')OR
(CODIGO4='76516' AND diagnost4 ='D')OR
(CODIGO5='76516' AND diagnost5 ='D')OR
(CODIGO6='76516' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'BIOMETRIA_OCU_ULTRAS_CB_50-59a', --76516 Biometría ocular por ultrasonido-----

---ADULTO MAYOR---
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='76516' AND diagnost1 ='D')OR
(CODIGO2='76516' AND diagnost2 ='D')OR
(CODIGO3='76516' AND diagnost3 ='D')OR
(CODIGO4='76516' AND diagnost4 ='D')OR
(CODIGO5='76516' AND diagnost5 ='D')OR
(CODIGO6='76516' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'BIOMETRIA_OCU_ULTRAS_CB_60a_Mas', --76516 Biometría ocular por ultrasonido-----

--82947 Glucosa cuantitativa en sangre
---TD=D + DX= 82947 + DX= (H250, H251, H252, H258, H259, H260, H261, H262, H263, H264, H268, H269, H280, H400, H409)

--NIÑO
SUM (CASE WHEN EDAD<103 and
((codigo1 ='82947' AND DIAGNOST1='D')OR
(codigo2 ='82947' AND DIAGNOST2='D')OR
(codigo3 ='82947' AND DIAGNOST3='D')OR
(codigo4 ='82947' AND DIAGNOST4='D')OR
(codigo5 ='82947' AND DIAGNOST5='D')OR
(codigo6 ='82947' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'GLUCOSA_CUANT_SANGRE_0d-2a', --82947 Glucosa cuantitativa en sangre

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((codigo1 ='82947' AND DIAGNOST1='D')OR
(codigo2 ='82947' AND DIAGNOST2='D')OR
(codigo3 ='82947' AND DIAGNOST3='D')OR
(codigo4 ='82947' AND DIAGNOST4='D')OR
(codigo5 ='82947' AND DIAGNOST5='D')OR
(codigo6 ='82947' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'GLUCOSA_CUANT_SANGRE_3-5a', --82947 Glucosa cuantitativa en sangre

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((codigo1 ='82947' AND DIAGNOST1='D')OR
(codigo2 ='82947' AND DIAGNOST2='D')OR
(codigo3 ='82947' AND DIAGNOST3='D')OR
(codigo4 ='82947' AND DIAGNOST4='D')OR
(codigo5 ='82947' AND DIAGNOST5='D')OR
(codigo6 ='82947' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'GLUCOSA_CUANT_SANGRE_6-11a', --82947 Glucosa cuantitativa en sangre

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((codigo1 ='82947' AND DIAGNOST1='D')OR
(codigo2 ='82947' AND DIAGNOST2='D')OR
(codigo3 ='82947' AND DIAGNOST3='D')OR
(codigo4 ='82947' AND DIAGNOST4='D')OR
(codigo5 ='82947' AND DIAGNOST5='D')OR
(codigo6 ='82947' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'GLUCOSA_CUANT_SANGRE_12-17a', --82947 Glucosa cuantitativa en sangre

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((codigo1 ='82947' AND DIAGNOST1='D')OR
(codigo2 ='82947' AND DIAGNOST2='D')OR
(codigo3 ='82947' AND DIAGNOST3='D')OR
(codigo4 ='82947' AND DIAGNOST4='D')OR
(codigo5 ='82947' AND DIAGNOST5='D')OR
(codigo6 ='82947' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'GLUCOSA_CUANT_SANGRE_18-29a', --82947 Glucosa cuantitativa en sangre

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((codigo1 ='82947' AND DIAGNOST1='D')OR
(codigo2 ='82947' AND DIAGNOST2='D')OR
(codigo3 ='82947' AND DIAGNOST3='D')OR
(codigo4 ='82947' AND DIAGNOST4='D')OR
(codigo5 ='82947' AND DIAGNOST5='D')OR
(codigo6 ='82947' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'GLUCOSA_CUANT_SANGRE_30-49a', --82947 Glucosa cuantitativa en sangre
-----ADULTO----------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((codigo1 ='82947' AND DIAGNOST1='D')OR
(codigo2 ='82947' AND DIAGNOST2='D')OR
(codigo3 ='82947' AND DIAGNOST3='D')OR
(codigo4 ='82947' AND DIAGNOST4='D')OR
(codigo5 ='82947' AND DIAGNOST5='D')OR
(codigo6 ='82947' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'GLUCOSA_CUANT_SANGRE_50-59a', --82947 Glucosa cuantitativa en sangre

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((codigo1 ='82947' AND DIAGNOST1='D')OR
(codigo2 ='82947' AND DIAGNOST2='D')OR
(codigo3 ='82947' AND DIAGNOST3='D')OR
(codigo4 ='82947' AND DIAGNOST4='D')OR
(codigo5 ='82947' AND DIAGNOST5='D')OR
(codigo6 ='82947' AND DIAGNOST6='D'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')) OR
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')))
THEN 1 ELSE 0 END) AS 'GLUCOSA_CUANT_SANGRE_60a_Mas', --82947 Glucosa cuantitativa en sangre

----DIAGNÓSTICOS-----------------------
--H250 Catarata Senil Incipiente
---TD=D + DX= H250

SUM (CASE WHEN EDAD<103 and
((CODIGO1='H250' AND diagnost1 ='D')OR
(CODIGO2='H250' AND diagnost2 ='D')OR
(CODIGO3='H250' AND diagnost3 ='D')OR
(CODIGO4='H250' AND diagnost4 ='D')OR
(CODIGO5='H250' AND diagnost5 ='D')OR
(CODIGO6='H250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Incip_0d-2a', --H250 Catarata Senil Incipiente

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H250' AND diagnost1 ='D')OR
(CODIGO2='H250' AND diagnost2 ='D')OR
(CODIGO3='H250' AND diagnost3 ='D')OR
(CODIGO4='H250' AND diagnost4 ='D')OR
(CODIGO5='H250' AND diagnost5 ='D')OR
(CODIGO6='H250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Incip_3-5a', --H250 Catarata Senil Incipiente
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H250' AND diagnost1 ='D')OR
(CODIGO2='H250' AND diagnost2 ='D')OR
(CODIGO3='H250' AND diagnost3 ='D')OR
(CODIGO4='H250' AND diagnost4 ='D')OR
(CODIGO5='H250' AND diagnost5 ='D')OR
(CODIGO6='H250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Incip_6-11a', --H250 Catarata Senil Incipiente

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H250' AND diagnost1 ='D')OR
(CODIGO2='H250' AND diagnost2 ='D')OR
(CODIGO3='H250' AND diagnost3 ='D')OR
(CODIGO4='H250' AND diagnost4 ='D')OR
(CODIGO5='H250' AND diagnost5 ='D')OR
(CODIGO6='H250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Incip_12-17a', --H250 Catarata Senil Incipiente

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H250' AND diagnost1 ='D')OR
(CODIGO2='H250' AND diagnost2 ='D')OR
(CODIGO3='H250' AND diagnost3 ='D')OR
(CODIGO4='H250' AND diagnost4 ='D')OR
(CODIGO5='H250' AND diagnost5 ='D')OR
(CODIGO6='H250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Incip_18-29a', --H250 Catarata Senil Incipiente

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H250' AND diagnost1 ='D')OR
(CODIGO2='H250' AND diagnost2 ='D')OR
(CODIGO3='H250' AND diagnost3 ='D')OR
(CODIGO4='H250' AND diagnost4 ='D')OR
(CODIGO5='H250' AND diagnost5 ='D')OR
(CODIGO6='H250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Incip_30-49a', --H250 Catarata Senil Incipiente
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H250' AND diagnost1 ='D')OR
(CODIGO2='H250' AND diagnost2 ='D')OR
(CODIGO3='H250' AND diagnost3 ='D')OR
(CODIGO4='H250' AND diagnost4 ='D')OR
(CODIGO5='H250' AND diagnost5 ='D')OR
(CODIGO6='H250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Incip_50-59a', --H250 Catarata Senil Incipiente

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H250' AND diagnost1 ='D')OR
(CODIGO2='H250' AND diagnost2 ='D')OR
(CODIGO3='H250' AND diagnost3 ='D')OR
(CODIGO4='H250' AND diagnost4 ='D')OR
(CODIGO5='H250' AND diagnost5 ='D')OR
(CODIGO6='H250' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Incip_60a_Mas', --H250 Catarata Senil Incipiente

----H251 Catarata Senil Nuclear--
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H251' AND diagnost1 ='D')OR
(CODIGO2='H251' AND diagnost2 ='D')OR
(CODIGO3='H251' AND diagnost3 ='D')OR
(CODIGO4='H251' AND diagnost4 ='D')OR
(CODIGO5='H251' AND diagnost5 ='D')OR
(CODIGO6='H251' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Nuclear_0d-2a', --H251 Catarata Senil Nuclear

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H251' AND diagnost1 ='D')OR
(CODIGO2='H251' AND diagnost2 ='D')OR
(CODIGO3='H251' AND diagnost3 ='D')OR
(CODIGO4='H251' AND diagnost4 ='D')OR
(CODIGO5='H251' AND diagnost5 ='D')OR
(CODIGO6='H251' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Nuclear_3-5a', --H251 Catarata Senil Nuclear
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H251' AND diagnost1 ='D')OR
(CODIGO2='H251' AND diagnost2 ='D')OR
(CODIGO3='H251' AND diagnost3 ='D')OR
(CODIGO4='H251' AND diagnost4 ='D')OR
(CODIGO5='H251' AND diagnost5 ='D')OR
(CODIGO6='H251' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Nuclear_6-11a', --H251 Catarata Senil Nuclear

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H251' AND diagnost1 ='D')OR
(CODIGO2='H251' AND diagnost2 ='D')OR
(CODIGO3='H251' AND diagnost3 ='D')OR
(CODIGO4='H251' AND diagnost4 ='D')OR
(CODIGO5='H251' AND diagnost5 ='D')OR
(CODIGO6='H251' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Nuclear_12-17a', --H251 Catarata Senil Nuclear

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H251' AND diagnost1 ='D')OR
(CODIGO2='H251' AND diagnost2 ='D')OR
(CODIGO3='H251' AND diagnost3 ='D')OR
(CODIGO4='H251' AND diagnost4 ='D')OR
(CODIGO5='H251' AND diagnost5 ='D')OR
(CODIGO6='H251' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Nuclear_18-29a', --H251 Catarata Senil Nuclear

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H251' AND diagnost1 ='D')OR
(CODIGO2='H251' AND diagnost2 ='D')OR
(CODIGO3='H251' AND diagnost3 ='D')OR
(CODIGO4='H251' AND diagnost4 ='D')OR
(CODIGO5='H251' AND diagnost5 ='D')OR
(CODIGO6='H251' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Nuclear_30-49a', --H251 Catarata Senil Nuclear
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H251' AND diagnost1 ='D')OR
(CODIGO2='H251' AND diagnost2 ='D')OR
(CODIGO3='H251' AND diagnost3 ='D')OR
(CODIGO4='H251' AND diagnost4 ='D')OR
(CODIGO5='H251' AND diagnost5 ='D')OR
(CODIGO6='H251' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Nuclear_50-59a', --H251 Catarata Senil Nuclear

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H251' AND diagnost1 ='D')OR
(CODIGO2='H251' AND diagnost2 ='D')OR
(CODIGO3='H251' AND diagnost3 ='D')OR
(CODIGO4='H251' AND diagnost4 ='D')OR
(CODIGO5='H251' AND diagnost5 ='D')OR
(CODIGO6='H251' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Nuclear_60a_Mas', --H251 Catarata Senil Nuclear

---H252 Catarata Senil, Tipo Morgagnian
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H252' AND diagnost1 ='D')OR
(CODIGO2='H252' AND diagnost2 ='D')OR
(CODIGO3='H252' AND diagnost3 ='D')OR
(CODIGO4='H252' AND diagnost4 ='D')OR
(CODIGO5='H252' AND diagnost5 ='D')OR
(CODIGO6='H252' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Tip_Morgagnian_0d-2a', --H252 Catarata Senil, Tipo Morgagnian

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H252' AND diagnost1 ='D')OR
(CODIGO2='H252' AND diagnost2 ='D')OR
(CODIGO3='H252' AND diagnost3 ='D')OR
(CODIGO4='H252' AND diagnost4 ='D')OR
(CODIGO5='H252' AND diagnost5 ='D')OR
(CODIGO6='H252' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Tip_Morgagnian_3-5a', --H252 Catarata Senil, Tipo Morgagnian
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H252' AND diagnost1 ='D')OR
(CODIGO2='H252' AND diagnost2 ='D')OR
(CODIGO3='H252' AND diagnost3 ='D')OR
(CODIGO4='H252' AND diagnost4 ='D')OR
(CODIGO5='H252' AND diagnost5 ='D')OR
(CODIGO6='H252' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Tip_Morgagnian_6-11a', --H252 Catarata Senil, Tipo Morgagnian

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H252' AND diagnost1 ='D')OR
(CODIGO2='H252' AND diagnost2 ='D')OR
(CODIGO3='H252' AND diagnost3 ='D')OR
(CODIGO4='H252' AND diagnost4 ='D')OR
(CODIGO5='H252' AND diagnost5 ='D')OR
(CODIGO6='H252' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Tip_Morgagnian_12-17a', --H252 Catarata Senil, Tipo Morgagnian

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H252' AND diagnost1 ='D')OR
(CODIGO2='H252' AND diagnost2 ='D')OR
(CODIGO3='H252' AND diagnost3 ='D')OR
(CODIGO4='H252' AND diagnost4 ='D')OR
(CODIGO5='H252' AND diagnost5 ='D')OR
(CODIGO6='H252' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Tip_Morgagnian_18-29a', --H252 Catarata Senil, Tipo Morgagnian

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H252' AND diagnost1 ='D')OR
(CODIGO2='H252' AND diagnost2 ='D')OR
(CODIGO3='H252' AND diagnost3 ='D')OR
(CODIGO4='H252' AND diagnost4 ='D')OR
(CODIGO5='H252' AND diagnost5 ='D')OR
(CODIGO6='H252' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Tip_Morgagnian_30-49a', --H252 Catarata Senil, Tipo Morgagnian
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H252' AND diagnost1 ='D')OR
(CODIGO2='H252' AND diagnost2 ='D')OR
(CODIGO3='H252' AND diagnost3 ='D')OR
(CODIGO4='H252' AND diagnost4 ='D')OR
(CODIGO5='H252' AND diagnost5 ='D')OR
(CODIGO6='H252' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Tip_Morgagnian_50-59a', --H252 Catarata Senil, Tipo Morgagnian

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H252' AND diagnost1 ='D')OR
(CODIGO2='H252' AND diagnost2 ='D')OR
(CODIGO3='H252' AND diagnost3 ='D')OR
(CODIGO4='H252' AND diagnost4 ='D')OR
(CODIGO5='H252' AND diagnost5 ='D')OR
(CODIGO6='H252' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_Tip_ Morgagnian_60a_Mas', --H252 Catarata Senil, Tipo Morgagnian

---H258 Otras Cataratas Seniles
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H258' AND diagnost1 ='D')OR
(CODIGO2='H258' AND diagnost2 ='D')OR
(CODIGO3='H258' AND diagnost3 ='D')OR
(CODIGO4='H258' AND diagnost4 ='D')OR
(CODIGO5='H258' AND diagnost5 ='D')OR
(CODIGO6='H258' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Cataratas_Seniles_0d-2a', --H258 Otras Cataratas Seniles

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H258' AND diagnost1 ='D')OR
(CODIGO2='H258' AND diagnost2 ='D')OR
(CODIGO3='H258' AND diagnost3 ='D')OR
(CODIGO4='H258' AND diagnost4 ='D')OR
(CODIGO5='H258' AND diagnost5 ='D')OR
(CODIGO6='H258' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Cataratas_Seniles_3-5a', --H258 Otras Cataratas Seniles
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H258' AND diagnost1 ='D')OR
(CODIGO2='H258' AND diagnost2 ='D')OR
(CODIGO3='H258' AND diagnost3 ='D')OR
(CODIGO4='H258' AND diagnost4 ='D')OR
(CODIGO5='H258' AND diagnost5 ='D')OR
(CODIGO6='H258' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Cataratas_Seniles_6-11a', --H258 Otras Cataratas Seniles

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H258' AND diagnost1 ='D')OR
(CODIGO2='H258' AND diagnost2 ='D')OR
(CODIGO3='H258' AND diagnost3 ='D')OR
(CODIGO4='H258' AND diagnost4 ='D')OR
(CODIGO5='H258' AND diagnost5 ='D')OR
(CODIGO6='H258' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Cataratas_Seniles_12-17a', --H258 Otras Cataratas Seniles

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H258' AND diagnost1 ='D')OR
(CODIGO2='H258' AND diagnost2 ='D')OR
(CODIGO3='H258' AND diagnost3 ='D')OR
(CODIGO4='H258' AND diagnost4 ='D')OR
(CODIGO5='H258' AND diagnost5 ='D')OR
(CODIGO6='H258' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Cataratas_Seniles_18-29a', --H258 Otras Cataratas Seniles

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H258' AND diagnost1 ='D')OR
(CODIGO2='H258' AND diagnost2 ='D')OR
(CODIGO3='H258' AND diagnost3 ='D')OR
(CODIGO4='H258' AND diagnost4 ='D')OR
(CODIGO5='H258' AND diagnost5 ='D')OR
(CODIGO6='H258' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Cataratas_Seniles_30-49a', --H258 Otras Cataratas Seniles
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H258' AND diagnost1 ='D')OR
(CODIGO2='H258' AND diagnost2 ='D')OR
(CODIGO3='H258' AND diagnost3 ='D')OR
(CODIGO4='H258' AND diagnost4 ='D')OR
(CODIGO5='H258' AND diagnost5 ='D')OR
(CODIGO6='H258' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Cataratas_Seniles_50-59a', --H258 Otras Cataratas Seniles

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H258' AND diagnost1 ='D')OR
(CODIGO2='H258' AND diagnost2 ='D')OR
(CODIGO3='H258' AND diagnost3 ='D')OR
(CODIGO4='H258' AND diagnost4 ='D')OR
(CODIGO5='H258' AND diagnost5 ='D')OR
(CODIGO6='H258' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Cataratas_Seniles_60a_Mas', --H258 Otras Cataratas Seniles

----H259 Catarata Senil, no Especificada
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H259' AND diagnost1 ='D')OR
(CODIGO2='H259' AND diagnost2 ='D')OR
(CODIGO3='H259' AND diagnost3 ='D')OR
(CODIGO4='H259' AND diagnost4 ='D')OR
(CODIGO5='H259' AND diagnost5 ='D')OR
(CODIGO6='H259' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_no_Especificada_0d-2a', --H259 Catarata Senil, no Especificada

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H259' AND diagnost1 ='D')OR
(CODIGO2='H259' AND diagnost2 ='D')OR
(CODIGO3='H259' AND diagnost3 ='D')OR
(CODIGO4='H259' AND diagnost4 ='D')OR
(CODIGO5='H259' AND diagnost5 ='D')OR
(CODIGO6='H259' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_no_Especificada_3-5a', --H259 Catarata Senil, no Especificada
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H259' AND diagnost1 ='D')OR
(CODIGO2='H259' AND diagnost2 ='D')OR
(CODIGO3='H259' AND diagnost3 ='D')OR
(CODIGO4='H259' AND diagnost4 ='D')OR
(CODIGO5='H259' AND diagnost5 ='D')OR
(CODIGO6='H259' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_no_Especificada_6-11a', --H259 Catarata Senil, no Especificada

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H259' AND diagnost1 ='D')OR
(CODIGO2='H259' AND diagnost2 ='D')OR
(CODIGO3='H259' AND diagnost3 ='D')OR
(CODIGO4='H259' AND diagnost4 ='D')OR
(CODIGO5='H259' AND diagnost5 ='D')OR
(CODIGO6='H259' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_no_Especificada_12-17a', --H259 Catarata Senil, no Especificada

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H259' AND diagnost1 ='D')OR
(CODIGO2='H259' AND diagnost2 ='D')OR
(CODIGO3='H259' AND diagnost3 ='D')OR
(CODIGO4='H259' AND diagnost4 ='D')OR
(CODIGO5='H259' AND diagnost5 ='D')OR
(CODIGO6='H259' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_no_Especificada_18-29a', --H259 Catarata Senil, no Especificada

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H259' AND diagnost1 ='D')OR
(CODIGO2='H259' AND diagnost2 ='D')OR
(CODIGO3='H259' AND diagnost3 ='D')OR
(CODIGO4='H259' AND diagnost4 ='D')OR
(CODIGO5='H259' AND diagnost5 ='D')OR
(CODIGO6='H259' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_no_Especificada_30-49a', --H259 Catarata Senil, no Especificada
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H259' AND diagnost1 ='D')OR
(CODIGO2='H259' AND diagnost2 ='D')OR
(CODIGO3='H259' AND diagnost3 ='D')OR
(CODIGO4='H259' AND diagnost4 ='D')OR
(CODIGO5='H259' AND diagnost5 ='D')OR
(CODIGO6='H259' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_no_Especificada_50-59a', --H259 Catarata Senil, no Especificada

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H259' AND diagnost1 ='D')OR
(CODIGO2='H259' AND diagnost2 ='D')OR
(CODIGO3='H259' AND diagnost3 ='D')OR
(CODIGO4='H259' AND diagnost4 ='D')OR
(CODIGO5='H259' AND diagnost5 ='D')OR
(CODIGO6='H259' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Senil_no_Especificada_60a_Mas', --H259 Catarata Senil, no Especificada

---H260 Catarata Infantil, Juvenil y Presenil
--TD=D + DX= H260
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H260' AND diagnost1 ='D')OR
(CODIGO2='H260' AND diagnost2 ='D')OR
(CODIGO3='H260' AND diagnost3 ='D')OR
(CODIGO4='H260' AND diagnost4 ='D')OR
(CODIGO5='H260' AND diagnost5 ='D')OR
(CODIGO6='H260' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inf_Juv_Presenil_0d-2a', --H260 Catarata Infantil, Juvenil y Presenil

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H260' AND diagnost1 ='D')OR
(CODIGO2='H260' AND diagnost2 ='D')OR
(CODIGO3='H260' AND diagnost3 ='D')OR
(CODIGO4='H260' AND diagnost4 ='D')OR
(CODIGO5='H260' AND diagnost5 ='D')OR
(CODIGO6='H260' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inf_Juv_Presenil_3-5a', --H260 Catarata Infantil, Juvenil y Presenil
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H260' AND diagnost1 ='D')OR
(CODIGO2='H260' AND diagnost2 ='D')OR
(CODIGO3='H260' AND diagnost3 ='D')OR
(CODIGO4='H260' AND diagnost4 ='D')OR
(CODIGO5='H260' AND diagnost5 ='D')OR
(CODIGO6='H260' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inf_Juv_Presenil_6-11a', --H260 Catarata Infantil, Juvenil y Presenil

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H260' AND diagnost1 ='D')OR
(CODIGO2='H260' AND diagnost2 ='D')OR
(CODIGO3='H260' AND diagnost3 ='D')OR
(CODIGO4='H260' AND diagnost4 ='D')OR
(CODIGO5='H260' AND diagnost5 ='D')OR
(CODIGO6='H260' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inf_Juv_Presenil_12-17a', --H260 Catarata Infantil, Juvenil y Presenil

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H260' AND diagnost1 ='D')OR
(CODIGO2='H260' AND diagnost2 ='D')OR
(CODIGO3='H260' AND diagnost3 ='D')OR
(CODIGO4='H260' AND diagnost4 ='D')OR
(CODIGO5='H260' AND diagnost5 ='D')OR
(CODIGO6='H260' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inf_Juv_Presenil_18-29a', --H260 Catarata Infantil, Juvenil y Presenil

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H260' AND diagnost1 ='D')OR
(CODIGO2='H260' AND diagnost2 ='D')OR
(CODIGO3='H260' AND diagnost3 ='D')OR
(CODIGO4='H260' AND diagnost4 ='D')OR
(CODIGO5='H260' AND diagnost5 ='D')OR
(CODIGO6='H260' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inf_Juv_Presenil_30-49a', --H260 Catarata Infantil, Juvenil y Presenil
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H260' AND diagnost1 ='D')OR
(CODIGO2='H260' AND diagnost2 ='D')OR
(CODIGO3='H260' AND diagnost3 ='D')OR
(CODIGO4='H260' AND diagnost4 ='D')OR
(CODIGO5='H260' AND diagnost5 ='D')OR
(CODIGO6='H260' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inf_Juv_Presenil_50-59a', --H260 Catarata Infantil, Juvenil y Presenil

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H260' AND diagnost1 ='D')OR
(CODIGO2='H260' AND diagnost2 ='D')OR
(CODIGO3='H260' AND diagnost3 ='D')OR
(CODIGO4='H260' AND diagnost4 ='D')OR
(CODIGO5='H260' AND diagnost5 ='D')OR
(CODIGO6='H260' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inf_Juv_Presenil_60a_Mas', --H260 Catarata Infantil, Juvenil y Presenil

----H261 Catarata Traumática
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H261' AND diagnost1 ='D')OR
(CODIGO2='H261' AND diagnost2 ='D')OR
(CODIGO3='H261' AND diagnost3 ='D')OR
(CODIGO4='H261' AND diagnost4 ='D')OR
(CODIGO5='H261' AND diagnost5 ='D')OR
(CODIGO6='H261' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Traumatica_0d-2a', --H261 Catarata Traumática

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H261' AND diagnost1 ='D')OR
(CODIGO2='H261' AND diagnost2 ='D')OR
(CODIGO3='H261' AND diagnost3 ='D')OR
(CODIGO4='H261' AND diagnost4 ='D')OR
(CODIGO5='H261' AND diagnost5 ='D')OR
(CODIGO6='H261' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Traumatica_3-5a', --H261 Catarata Traumática
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H261' AND diagnost1 ='D')OR
(CODIGO2='H261' AND diagnost2 ='D')OR
(CODIGO3='H261' AND diagnost3 ='D')OR
(CODIGO4='H261' AND diagnost4 ='D')OR
(CODIGO5='H261' AND diagnost5 ='D')OR
(CODIGO6='H261' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Traumatica_6-11a', --H261 Catarata Traumática

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H261' AND diagnost1 ='D')OR
(CODIGO2='H261' AND diagnost2 ='D')OR
(CODIGO3='H261' AND diagnost3 ='D')OR
(CODIGO4='H261' AND diagnost4 ='D')OR
(CODIGO5='H261' AND diagnost5 ='D')OR
(CODIGO6='H261' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Traumatica_12-17a', --H261 Catarata Traumática

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H261' AND diagnost1 ='D')OR
(CODIGO2='H261' AND diagnost2 ='D')OR
(CODIGO3='H261' AND diagnost3 ='D')OR
(CODIGO4='H261' AND diagnost4 ='D')OR
(CODIGO5='H261' AND diagnost5 ='D')OR
(CODIGO6='H261' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Traumatica_18-29a', --H261 Catarata Traumática

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H261' AND diagnost1 ='D')OR
(CODIGO2='H261' AND diagnost2 ='D')OR
(CODIGO3='H261' AND diagnost3 ='D')OR
(CODIGO4='H261' AND diagnost4 ='D')OR
(CODIGO5='H261' AND diagnost5 ='D')OR
(CODIGO6='H261' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Traumatica_30-49a', --H261 Catarata Traumática
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H261' AND diagnost1 ='D')OR
(CODIGO2='H261' AND diagnost2 ='D')OR
(CODIGO3='H261' AND diagnost3 ='D')OR
(CODIGO4='H261' AND diagnost4 ='D')OR
(CODIGO5='H261' AND diagnost5 ='D')OR
(CODIGO6='H261' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Traumatica_50-59a', --H261 Catarata Traumática

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H261' AND diagnost1 ='D')OR
(CODIGO2='H261' AND diagnost2 ='D')OR
(CODIGO3='H261' AND diagnost3 ='D')OR
(CODIGO4='H261' AND diagnost4 ='D')OR
(CODIGO5='H261' AND diagnost5 ='D')OR
(CODIGO6='H261' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Traumatica_60a_Mas', --H261 Catarata Traumática

-----H262 Catarata Complicada----
--TD=D + DX= H262

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H262' AND diagnost1 ='D')OR
(CODIGO2='H262' AND diagnost2 ='D')OR
(CODIGO3='H262' AND diagnost3 ='D')OR
(CODIGO4='H262' AND diagnost4 ='D')OR
(CODIGO5='H262' AND diagnost5 ='D')OR
(CODIGO6='H262' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Complicada_0d-2a', --H262 Catarata Complicada----

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H262' AND diagnost1 ='D')OR
(CODIGO2='H262' AND diagnost2 ='D')OR
(CODIGO3='H262' AND diagnost3 ='D')OR
(CODIGO4='H262' AND diagnost4 ='D')OR
(CODIGO5='H262' AND diagnost5 ='D')OR
(CODIGO6='H262' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Complicada_3-5a', --H262 Catarata Complicada----
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H262' AND diagnost1 ='D')OR
(CODIGO2='H262' AND diagnost2 ='D')OR
(CODIGO3='H262' AND diagnost3 ='D')OR
(CODIGO4='H262' AND diagnost4 ='D')OR
(CODIGO5='H262' AND diagnost5 ='D')OR
(CODIGO6='H262' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Complicada_6-11a', --H262 Catarata Complicada----

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H262' AND diagnost1 ='D')OR
(CODIGO2='H262' AND diagnost2 ='D')OR
(CODIGO3='H262' AND diagnost3 ='D')OR
(CODIGO4='H262' AND diagnost4 ='D')OR
(CODIGO5='H262' AND diagnost5 ='D')OR
(CODIGO6='H262' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Complicada_12-17a', --H262 Catarata Complicada----

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H262' AND diagnost1 ='D')OR
(CODIGO2='H262' AND diagnost2 ='D')OR
(CODIGO3='H262' AND diagnost3 ='D')OR
(CODIGO4='H262' AND diagnost4 ='D')OR
(CODIGO5='H262' AND diagnost5 ='D')OR
(CODIGO6='H262' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Complicada_18-29a', --H262 Catarata Complicada----

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H262' AND diagnost1 ='D')OR
(CODIGO2='H262' AND diagnost2 ='D')OR
(CODIGO3='H262' AND diagnost3 ='D')OR
(CODIGO4='H262' AND diagnost4 ='D')OR
(CODIGO5='H262' AND diagnost5 ='D')OR
(CODIGO6='H262' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Complicada_30-49a', --H262 Catarata Complicada----
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H262' AND diagnost1 ='D')OR
(CODIGO2='H262' AND diagnost2 ='D')OR
(CODIGO3='H262' AND diagnost3 ='D')OR
(CODIGO4='H262' AND diagnost4 ='D')OR
(CODIGO5='H262' AND diagnost5 ='D')OR
(CODIGO6='H262' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Complicada_50-59a', --H262 Catarata Complicada----

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H262' AND diagnost1 ='D')OR
(CODIGO2='H262' AND diagnost2 ='D')OR
(CODIGO3='H262' AND diagnost3 ='D')OR
(CODIGO4='H262' AND diagnost4 ='D')OR
(CODIGO5='H262' AND diagnost5 ='D')OR
(CODIGO6='H262' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Complicada_60a_Mas', --H262 Catarata Complicada----

----H263 Catarata Inducida por drogas
--TD=D + DX= H263

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H263' AND diagnost1 ='D')OR
(CODIGO2='H263' AND diagnost2 ='D')OR
(CODIGO3='H263' AND diagnost3 ='D')OR
(CODIGO4='H263' AND diagnost4 ='D')OR
(CODIGO5='H263' AND diagnost5 ='D')OR
(CODIGO6='H263' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inducida_drogas_0d-2a', --H263 Catarata Inducida por drogas

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H263' AND diagnost1 ='D')OR
(CODIGO2='H263' AND diagnost2 ='D')OR
(CODIGO3='H263' AND diagnost3 ='D')OR
(CODIGO4='H263' AND diagnost4 ='D')OR
(CODIGO5='H263' AND diagnost5 ='D')OR
(CODIGO6='H263' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inducida_drogas_3-5a', --H263 Catarata Inducida por drogas
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H263' AND diagnost1 ='D')OR
(CODIGO2='H263' AND diagnost2 ='D')OR
(CODIGO3='H263' AND diagnost3 ='D')OR
(CODIGO4='H263' AND diagnost4 ='D')OR
(CODIGO5='H263' AND diagnost5 ='D')OR
(CODIGO6='H263' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inducida_drogas_6-11a', --H263 Catarata Inducida por drogas

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H263' AND diagnost1 ='D')OR
(CODIGO2='H263' AND diagnost2 ='D')OR
(CODIGO3='H263' AND diagnost3 ='D')OR
(CODIGO4='H263' AND diagnost4 ='D')OR
(CODIGO5='H263' AND diagnost5 ='D')OR
(CODIGO6='H263' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inducida_drogas_12-17a', --H263 Catarata Inducida por drogas

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H263' AND diagnost1 ='D')OR
(CODIGO2='H263' AND diagnost2 ='D')OR
(CODIGO3='H263' AND diagnost3 ='D')OR
(CODIGO4='H263' AND diagnost4 ='D')OR
(CODIGO5='H263' AND diagnost5 ='D')OR
(CODIGO6='H263' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inducida_drogas_18-29a', --H263 Catarata Inducida por drogas

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H263' AND diagnost1 ='D')OR
(CODIGO2='H263' AND diagnost2 ='D')OR
(CODIGO3='H263' AND diagnost3 ='D')OR
(CODIGO4='H263' AND diagnost4 ='D')OR
(CODIGO5='H263' AND diagnost5 ='D')OR
(CODIGO6='H263' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inducida_drogas_30-49a', --H263 Catarata Inducida por drogas
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H263' AND diagnost1 ='D')OR
(CODIGO2='H263' AND diagnost2 ='D')OR
(CODIGO3='H263' AND diagnost3 ='D')OR
(CODIGO4='H263' AND diagnost4 ='D')OR
(CODIGO5='H263' AND diagnost5 ='D')OR
(CODIGO6='H263' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inducida_drogas_50-59a', --H263 Catarata Inducida por drogas

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H263' AND diagnost1 ='D')OR
(CODIGO2='H263' AND diagnost2 ='D')OR
(CODIGO3='H263' AND diagnost3 ='D')OR
(CODIGO4='H263' AND diagnost4 ='D')OR
(CODIGO5='H263' AND diagnost5 ='D')OR
(CODIGO6='H263' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Inducida_drogas_60a_Mas', --H263 Catarata Inducida por drogas

---H264 Catarata Residual--
--TD=D + DX= H264
---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H264' AND diagnost1 ='D')OR
(CODIGO2='H264' AND diagnost2 ='D')OR
(CODIGO3='H264' AND diagnost3 ='D')OR
(CODIGO4='H264' AND diagnost4 ='D')OR
(CODIGO5='H264' AND diagnost5 ='D')OR
(CODIGO6='H264' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Residual_0d-2a', --H264 Catarata Residual

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H264' AND diagnost1 ='D')OR
(CODIGO2='H264' AND diagnost2 ='D')OR
(CODIGO3='H264' AND diagnost3 ='D')OR
(CODIGO4='H264' AND diagnost4 ='D')OR
(CODIGO5='H264' AND diagnost5 ='D')OR
(CODIGO6='H264' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Residual_3-5a', --H264 Catarata Residual
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H264' AND diagnost1 ='D')OR
(CODIGO2='H264' AND diagnost2 ='D')OR
(CODIGO3='H264' AND diagnost3 ='D')OR
(CODIGO4='H264' AND diagnost4 ='D')OR
(CODIGO5='H264' AND diagnost5 ='D')OR
(CODIGO6='H264' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Residual_6-11a', --H264 Catarata Residual

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H264' AND diagnost1 ='D')OR
(CODIGO2='H264' AND diagnost2 ='D')OR
(CODIGO3='H264' AND diagnost3 ='D')OR
(CODIGO4='H264' AND diagnost4 ='D')OR
(CODIGO5='H264' AND diagnost5 ='D')OR
(CODIGO6='H264' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Residual_12-17a', --H264 Catarata Residual

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H264' AND diagnost1 ='D')OR
(CODIGO2='H264' AND diagnost2 ='D')OR
(CODIGO3='H264' AND diagnost3 ='D')OR
(CODIGO4='H264' AND diagnost4 ='D')OR
(CODIGO5='H264' AND diagnost5 ='D')OR
(CODIGO6='H264' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Residual_18-29a', --H264 Catarata Residual

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H264' AND diagnost1 ='D')OR
(CODIGO2='H264' AND diagnost2 ='D')OR
(CODIGO3='H264' AND diagnost3 ='D')OR
(CODIGO4='H264' AND diagnost4 ='D')OR
(CODIGO5='H264' AND diagnost5 ='D')OR
(CODIGO6='H264' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Residual_30-49a', --H264 Catarata Residual
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H264' AND diagnost1 ='D')OR
(CODIGO2='H264' AND diagnost2 ='D')OR
(CODIGO3='H264' AND diagnost3 ='D')OR
(CODIGO4='H264' AND diagnost4 ='D')OR
(CODIGO5='H264' AND diagnost5 ='D')OR
(CODIGO6='H264' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Residual_50-59a', --H264 Catarata Residual

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H264' AND diagnost1 ='D')OR
(CODIGO2='H264' AND diagnost2 ='D')OR
(CODIGO3='H264' AND diagnost3 ='D')OR
(CODIGO4='H264' AND diagnost4 ='D')OR
(CODIGO5='H264' AND diagnost5 ='D')OR
(CODIGO6='H264' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_Residual_60a_Mas', --H264 Catarata Residual

----H268 Otras Formas Especificadas de Catarata
--TD=D + DX= H268

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H268' AND diagnost1 ='D')OR
(CODIGO2='H268' AND diagnost2 ='D')OR
(CODIGO3='H268' AND diagnost3 ='D')OR
(CODIGO4='H268' AND diagnost4 ='D')OR
(CODIGO5='H268' AND diagnost5 ='D')OR
(CODIGO6='H268' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Formas_Espe_Catarata_0d-2a', --H268 Otras Formas Especificadas de Catarata

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H268' AND diagnost1 ='D')OR
(CODIGO2='H268' AND diagnost2 ='D')OR
(CODIGO3='H268' AND diagnost3 ='D')OR
(CODIGO4='H268' AND diagnost4 ='D')OR
(CODIGO5='H268' AND diagnost5 ='D')OR
(CODIGO6='H268' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Formas_Espe_Catarata_3-5a', --H268 Otras Formas Especificadas de Catarata
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H268' AND diagnost1 ='D')OR
(CODIGO2='H268' AND diagnost2 ='D')OR
(CODIGO3='H268' AND diagnost3 ='D')OR
(CODIGO4='H268' AND diagnost4 ='D')OR
(CODIGO5='H268' AND diagnost5 ='D')OR
(CODIGO6='H268' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Formas_Espe_Catarata_6-11a', --H268 Otras Formas Especificadas de Catarata

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H268' AND diagnost1 ='D')OR
(CODIGO2='H268' AND diagnost2 ='D')OR
(CODIGO3='H268' AND diagnost3 ='D')OR
(CODIGO4='H268' AND diagnost4 ='D')OR
(CODIGO5='H268' AND diagnost5 ='D')OR
(CODIGO6='H268' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Formas_Espe_Catarata_12-17a', --H268 Otras Formas Especificadas de Catarata

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H268' AND diagnost1 ='D')OR
(CODIGO2='H268' AND diagnost2 ='D')OR
(CODIGO3='H268' AND diagnost3 ='D')OR
(CODIGO4='H268' AND diagnost4 ='D')OR
(CODIGO5='H268' AND diagnost5 ='D')OR
(CODIGO6='H268' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Formas_Espe_Catarata_18-29a', --H268 Otras Formas Especificadas de Catarata

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H268' AND diagnost1 ='D')OR
(CODIGO2='H268' AND diagnost2 ='D')OR
(CODIGO3='H268' AND diagnost3 ='D')OR
(CODIGO4='H268' AND diagnost4 ='D')OR
(CODIGO5='H268' AND diagnost5 ='D')OR
(CODIGO6='H268' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Formas_Espe_Catarata_30-49a', --H268 Otras Formas Especificadas de Catarata
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H268' AND diagnost1 ='D')OR
(CODIGO2='H268' AND diagnost2 ='D')OR
(CODIGO3='H268' AND diagnost3 ='D')OR
(CODIGO4='H268' AND diagnost4 ='D')OR
(CODIGO5='H268' AND diagnost5 ='D')OR
(CODIGO6='H268' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Formas_Espe__Catarata_50-59a', --H268 Otras Formas Especificadas de Catarata

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H268' AND diagnost1 ='D')OR
(CODIGO2='H268' AND diagnost2 ='D')OR
(CODIGO3='H268' AND diagnost3 ='D')OR
(CODIGO4='H268' AND diagnost4 ='D')OR
(CODIGO5='H268' AND diagnost5 ='D')OR
(CODIGO6='H268' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Otras_Formas_Espe_Catarata_60a_Mas', --H268 Otras Formas Especificadas de Catarata

----H269 Catarata, no Especificada
--TD=D + DX= H269


---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H269' AND diagnost1 ='D')OR
(CODIGO2='H269' AND diagnost2 ='D')OR
(CODIGO3='H269' AND diagnost3 ='D')OR
(CODIGO4='H269' AND diagnost4 ='D')OR
(CODIGO5='H269' AND diagnost5 ='D')OR
(CODIGO6='H269' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_no_Especificada_0d-2a', --H269 Catarata, no Especificada

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H269' AND diagnost1 ='D')OR
(CODIGO2='H269' AND diagnost2 ='D')OR
(CODIGO3='H269' AND diagnost3 ='D')OR
(CODIGO4='H269' AND diagnost4 ='D')OR
(CODIGO5='H269' AND diagnost5 ='D')OR
(CODIGO6='H269' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_no_Especificada_3-5a', --H269 Catarata, no Especificada
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H269' AND diagnost1 ='D')OR
(CODIGO2='H269' AND diagnost2 ='D')OR
(CODIGO3='H269' AND diagnost3 ='D')OR
(CODIGO4='H269' AND diagnost4 ='D')OR
(CODIGO5='H269' AND diagnost5 ='D')OR
(CODIGO6='H269' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_no_Especificada_6-11a', --H269 Catarata, no Especificada

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H269' AND diagnost1 ='D')OR
(CODIGO2='H269' AND diagnost2 ='D')OR
(CODIGO3='H269' AND diagnost3 ='D')OR
(CODIGO4='H269' AND diagnost4 ='D')OR
(CODIGO5='H269' AND diagnost5 ='D')OR
(CODIGO6='H269' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_no_Especificada_12-17a', --H269 Catarata, no Especificada

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H269' AND diagnost1 ='D')OR
(CODIGO2='H269' AND diagnost2 ='D')OR
(CODIGO3='H269' AND diagnost3 ='D')OR
(CODIGO4='H269' AND diagnost4 ='D')OR
(CODIGO5='H269' AND diagnost5 ='D')OR
(CODIGO6='H269' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_no_Especificada_18-29a', --H269 Catarata, no Especificada

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H269' AND diagnost1 ='D')OR
(CODIGO2='H269' AND diagnost2 ='D')OR
(CODIGO3='H269' AND diagnost3 ='D')OR
(CODIGO4='H269' AND diagnost4 ='D')OR
(CODIGO5='H269' AND diagnost5 ='D')OR
(CODIGO6='H269' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_no_Especificada_30-49a', --H269 Catarata, no Especificada
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H269' AND diagnost1 ='D')OR
(CODIGO2='H269' AND diagnost2 ='D')OR
(CODIGO3='H269' AND diagnost3 ='D')OR
(CODIGO4='H269' AND diagnost4 ='D')OR
(CODIGO5='H269' AND diagnost5 ='D')OR
(CODIGO6='H269' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_no_Especificada_50-59a', --H269 Catarata, no Especificada

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H269' AND diagnost1 ='D')OR
(CODIGO2='H269' AND diagnost2 ='D')OR
(CODIGO3='H269' AND diagnost3 ='D')OR
(CODIGO4='H269' AND diagnost4 ='D')OR
(CODIGO5='H269' AND diagnost5 ='D')OR
(CODIGO6='H269' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_no_Especificada_60a_Mas', --H269 Catarata, no Especificada


---H280 Catarata diabética
--TD=D + DX= H280

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H280' AND diagnost1 ='D')OR
(CODIGO2='H280' AND diagnost2 ='D')OR
(CODIGO3='H280' AND diagnost3 ='D')OR
(CODIGO4='H280' AND diagnost4 ='D')OR
(CODIGO5='H280' AND diagnost5 ='D')OR
(CODIGO6='H280' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_diabetica_0d-2a', --H280 Catarata diabética

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H280' AND diagnost1 ='D')OR
(CODIGO2='H280' AND diagnost2 ='D')OR
(CODIGO3='H280' AND diagnost3 ='D')OR
(CODIGO4='H280' AND diagnost4 ='D')OR
(CODIGO5='H280' AND diagnost5 ='D')OR
(CODIGO6='H280' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_diabetica_3-5a', --H280 Catarata diabética
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H280' AND diagnost1 ='D')OR
(CODIGO2='H280' AND diagnost2 ='D')OR
(CODIGO3='H280' AND diagnost3 ='D')OR
(CODIGO4='H280' AND diagnost4 ='D')OR
(CODIGO5='H280' AND diagnost5 ='D')OR
(CODIGO6='H280' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_diabetica_6-11a', --H280 Catarata diabética

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H280' AND diagnost1 ='D')OR
(CODIGO2='H280' AND diagnost2 ='D')OR
(CODIGO3='H280' AND diagnost3 ='D')OR
(CODIGO4='H280' AND diagnost4 ='D')OR
(CODIGO5='H280' AND diagnost5 ='D')OR
(CODIGO6='H280' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_diabetica_12-17a', --H280 Catarata diabética

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H280' AND diagnost1 ='D')OR
(CODIGO2='H280' AND diagnost2 ='D')OR
(CODIGO3='H280' AND diagnost3 ='D')OR
(CODIGO4='H280' AND diagnost4 ='D')OR
(CODIGO5='H280' AND diagnost5 ='D')OR
(CODIGO6='H280' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_diabetica_18-29a', --H280 Catarata diabética

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H280' AND diagnost1 ='D')OR
(CODIGO2='H280' AND diagnost2 ='D')OR
(CODIGO3='H280' AND diagnost3 ='D')OR
(CODIGO4='H280' AND diagnost4 ='D')OR
(CODIGO5='H280' AND diagnost5 ='D')OR
(CODIGO6='H280' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_diabetica_30-49a', --H280 Catarata diabética
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H280' AND diagnost1 ='D')OR
(CODIGO2='H280' AND diagnost2 ='D')OR
(CODIGO3='H280' AND diagnost3 ='D')OR
(CODIGO4='H280' AND diagnost4 ='D')OR
(CODIGO5='H280' AND diagnost5 ='D')OR
(CODIGO6='H280' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_diabetica_50-59a', --H280 Catarata diabética

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H280' AND diagnost1 ='D')OR
(CODIGO2='H280' AND diagnost2 ='D')OR
(CODIGO3='H280' AND diagnost3 ='D')OR
(CODIGO4='H280' AND diagnost4 ='D')OR
(CODIGO5='H280' AND diagnost5 ='D')OR
(CODIGO6='H280' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Catarata_diabetica_60a_Mas', --H280 Catarata diabética

---H400 Sospecha de Glaucoma (Hipertensión ocular)
--TD=D + DX= H400

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H400' AND diagnost1 ='D')OR
(CODIGO2='H400' AND diagnost2 ='D')OR
(CODIGO3='H400' AND diagnost3 ='D')OR
(CODIGO4='H400' AND diagnost4 ='D')OR
(CODIGO5='H400' AND diagnost5 ='D')OR
(CODIGO6='H400' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Sosp_Glaucoma_Hipertension_ocular_0d-2a', --H400 Sospecha de Glaucoma (Hipertensión ocular)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H400' AND diagnost1 ='D')OR
(CODIGO2='H400' AND diagnost2 ='D')OR
(CODIGO3='H400' AND diagnost3 ='D')OR
(CODIGO4='H400' AND diagnost4 ='D')OR
(CODIGO5='H400' AND diagnost5 ='D')OR
(CODIGO6='H400' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Sosp_Glaucoma_Hipertension_ocular_3-5a', --H400 Sospecha de Glaucoma (Hipertensión ocular)
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H400' AND diagnost1 ='D')OR
(CODIGO2='H400' AND diagnost2 ='D')OR
(CODIGO3='H400' AND diagnost3 ='D')OR
(CODIGO4='H400' AND diagnost4 ='D')OR
(CODIGO5='H400' AND diagnost5 ='D')OR
(CODIGO6='H400' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Sosp_Glaucoma_Hipertension_ocular_6-11a', --H400 Sospecha de Glaucoma (Hipertensión ocular)

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H400' AND diagnost1 ='D')OR
(CODIGO2='H400' AND diagnost2 ='D')OR
(CODIGO3='H400' AND diagnost3 ='D')OR
(CODIGO4='H400' AND diagnost4 ='D')OR
(CODIGO5='H400' AND diagnost5 ='D')OR
(CODIGO6='H400' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Sosp_Glaucoma_Hipertension_ocular_12-17a', --H400 Sospecha de Glaucoma (Hipertensión ocular)

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H400' AND diagnost1 ='D')OR
(CODIGO2='H400' AND diagnost2 ='D')OR
(CODIGO3='H400' AND diagnost3 ='D')OR
(CODIGO4='H400' AND diagnost4 ='D')OR
(CODIGO5='H400' AND diagnost5 ='D')OR
(CODIGO6='H400' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Sosp_Glaucoma_Hipertension_ocular_18-29a', --H400 Sospecha de Glaucoma (Hipertensión ocular)

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H400' AND diagnost1 ='D')OR
(CODIGO2='H400' AND diagnost2 ='D')OR
(CODIGO3='H400' AND diagnost3 ='D')OR
(CODIGO4='H400' AND diagnost4 ='D')OR
(CODIGO5='H400' AND diagnost5 ='D')OR
(CODIGO6='H400' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Sosp_Glaucoma_Hipertension_ocular_30-49a', --H400 Sospecha de Glaucoma (Hipertensión ocular)
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H400' AND diagnost1 ='D')OR
(CODIGO2='H400' AND diagnost2 ='D')OR
(CODIGO3='H400' AND diagnost3 ='D')OR
(CODIGO4='H400' AND diagnost4 ='D')OR
(CODIGO5='H400' AND diagnost5 ='D')OR
(CODIGO6='H400' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Sosp_Glaucoma_Hipertension_ocular_50-59a', --H400 Sospecha de Glaucoma (Hipertensión ocular)

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H400' AND diagnost1 ='D')OR
(CODIGO2='H400' AND diagnost2 ='D')OR
(CODIGO3='H400' AND diagnost3 ='D')OR
(CODIGO4='H400' AND diagnost4 ='D')OR
(CODIGO5='H400' AND diagnost5 ='D')OR
(CODIGO6='H400' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Sosp_Glaucoma_Hipertension_ocular_60a_Mas', --H400 Sospecha de Glaucoma (Hipertensión ocular)

--H409 Glaucoma, no Especificado
---TD=D + DX= H409

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H409' AND diagnost1 ='D')OR
(CODIGO2='H409' AND diagnost2 ='D')OR
(CODIGO3='H409' AND diagnost3 ='D')OR
(CODIGO4='H409' AND diagnost4 ='D')OR
(CODIGO5='H409' AND diagnost5 ='D')OR
(CODIGO6='H409' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Glaucoma_no_Especificado_0d-2a', --H409 Glaucoma, no Especificado

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='H409' AND diagnost1 ='D')OR
(CODIGO2='H409' AND diagnost2 ='D')OR
(CODIGO3='H409' AND diagnost3 ='D')OR
(CODIGO4='H409' AND diagnost4 ='D')OR
(CODIGO5='H409' AND diagnost5 ='D')OR
(CODIGO6='H409' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Glaucoma_no_Especificado_3-5a', --H409 Glaucoma, no Especificado
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='H409' AND diagnost1 ='D')OR
(CODIGO2='H409' AND diagnost2 ='D')OR
(CODIGO3='H409' AND diagnost3 ='D')OR
(CODIGO4='H409' AND diagnost4 ='D')OR
(CODIGO5='H409' AND diagnost5 ='D')OR
(CODIGO6='H409' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Glaucoma_no_Especificado_6-11a', --H409 Glaucoma, no Especificado

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='H409' AND diagnost1 ='D')OR
(CODIGO2='H409' AND diagnost2 ='D')OR
(CODIGO3='H409' AND diagnost3 ='D')OR
(CODIGO4='H409' AND diagnost4 ='D')OR
(CODIGO5='H409' AND diagnost5 ='D')OR
(CODIGO6='H409' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Glaucoma_no_Especificado_12-17a', --H409 Glaucoma, no Especificado

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='H409' AND diagnost1 ='D')OR
(CODIGO2='H409' AND diagnost2 ='D')OR
(CODIGO3='H409' AND diagnost3 ='D')OR
(CODIGO4='H409' AND diagnost4 ='D')OR
(CODIGO5='H409' AND diagnost5 ='D')OR
(CODIGO6='H409' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Glaucoma_no_Especificado_18-29a', --H409 Glaucoma, no Especificado

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='H409' AND diagnost1 ='D')OR
(CODIGO2='H409' AND diagnost2 ='D')OR
(CODIGO3='H409' AND diagnost3 ='D')OR
(CODIGO4='H409' AND diagnost4 ='D')OR
(CODIGO5='H409' AND diagnost5 ='D')OR
(CODIGO6='H409' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Glaucoma_no_Especificado_30-49a', --H409 Glaucoma, no Especificado
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='H409' AND diagnost1 ='D')OR
(CODIGO2='H409' AND diagnost2 ='D')OR
(CODIGO3='H409' AND diagnost3 ='D')OR
(CODIGO4='H409' AND diagnost4 ='D')OR
(CODIGO5='H409' AND diagnost5 ='D')OR
(CODIGO6='H409' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Glaucoma_no_Especificado_50-59a', --H409 Glaucoma, no Especificado

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='H409' AND diagnost1 ='D')OR
(CODIGO2='H409' AND diagnost2 ='D')OR
(CODIGO3='H409' AND diagnost3 ='D')OR
(CODIGO4='H409' AND diagnost4 ='D')OR
(CODIGO5='H409' AND diagnost5 ='D')OR
(CODIGO6='H409' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'Glaucoma_no_Especificado_60a_Mas', --H409 Glaucoma, no Especificado

-------TRATAMIENTO DE CEGUERA POR CATARATA-----------------------------------------------------------------------------------------------
---66982 Extracción de catarata extracapsular con implante de lente intraocular----------------------------------------------------------
---Grado de Dificultad 1 = Bajo----
---TD=D + DX= 66982 + LAB=1

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66982' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_1_Bajo_0d-2a', --Grado de Dificultad 1 = Bajo----

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66982' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_1_Bajo_3-5a', --Grado de Dificultad 1 = Bajo----
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66982' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_1_Bajo_6-11a', --Grado de Dificultad 1 = Bajo----

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66982' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_1_Bajo_12-17a', --Grado de Dificultad 1 = Bajo----

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66982' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_1_Bajo_18-29a', --Grado de Dificultad 1 = Bajo----

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66982' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_1_Bajo_30-49a', --Grado de Dificultad 1 = Bajo----
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66982' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_1_Bajo_50-59a', --Grado de Dificultad 1 = Bajo----

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66982' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_1_Bajo_60a_Mas', --Grado de Dificultad 1 = Bajo----

---Grado de Dificultad 2 = Moderado---
--TD=D + DX= 66982 + LAB=2--

---Grado de Dificultad 2 = Moderado---
--TD=D + DX= 66982 + LAB=2--

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66982' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_0d-2a', --Grado de Dificultad 2 = Moderado---

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66982' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_3-5a', --Grado de Dificultad 2 = Moderado---
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66982' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_6-11a', --Grado de Dificultad 2 = Moderado---

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66982' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_12-17a', --Grado de Dificultad 2 = Moderado---

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66982' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_18-29a', --Grado de Dificultad 2 = Moderado---

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66982' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_30-49a', --Grado de Dificultad 2 = Moderado---
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66982' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_50-59a', --Grado de Dificultad 2 = Moderado---

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66982' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_60a_Mas', --Grado de Dificultad 2 = Moderado---

---Grado de Dificultad 3 = Alto-
---TD=D + DX= 66982 + LAB=3----

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66982' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_0d-2a', --Grado de Dificultad 3 = Alto-

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66982' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_3-5a', --Grado de Dificultad 3 = Alto-
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66982' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_6-11a', --Grado de Dificultad 3 = Alto-

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66982' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_12-17a', --Grado de Dificultad 3 = Alto-

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66982' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_18-29a', --Grado de Dificultad 3 = Alto-

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66982' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_30-49a', --Grado de Dificultad 3 = Alto-
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66982' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_50-59a', --Grado de Dificultad 3 = Alto-

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66982' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66982' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66982' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66982' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66982' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66982' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_60a_Mas', --Grado de Dificultad 3 = Alto-

---6850 Facofragmentación (mecánica o ultrasonido) con aspiración
--TD=D + DX= 66850 + LAB=1---

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66850' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Facofrag_mecanica_o_ultrasonido_aspiracion_0d-2a', --6850 Facofragmentación (mecánica o ultrasonido) con aspiración

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66850' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Facofrag_mecanica_o_ultrasonido_aspiracion_3-5a', --6850 Facofragmentación (mecánica o ultrasonido) con aspiración
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66850' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Facofrag_mecanica_o_ultrasonido_aspiracion_6-11a', --6850 Facofragmentación (mecánica o ultrasonido) con aspiración

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66850' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Facofrag_mecanica_o_ultrasonido_aspiracion_12-17a', --6850 Facofragmentación (mecánica o ultrasonido) con aspiración

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66850' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Facofrag_mecanica_o_ultrasonido_aspiracion_18-29a', --6850 Facofragmentación (mecánica o ultrasonido) con aspiración

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66850' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Facofrag_mecanica_o_ultrasonido_aspiracion_30-49a', --6850 Facofragmentación (mecánica o ultrasonido) con aspiración
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66850' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Facofrag_mecanica_o_ultrasonido_aspiracion_50-59a', --6850 Facofragmentación (mecánica o ultrasonido) con aspiración

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66850' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Facofrag_mecanica_o_ultrasonido_aspiracion_60a_Mas', --6850 Facofragmentación (mecánica o ultrasonido) con aspiración

---Grado de Dificultad 2 = Moderado----
--TD=D + DX= 66850 + LAB=2

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66850' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_MUA_0d-2a', --Grado de Dificultad 2 = Moderado----

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66850' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_MUA_3-5a', --Grado de Dificultad 2 = Moderado----
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66850' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_MUA_6-11a', --Grado de Dificultad 2 = Moderado----

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66850' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_MUA_12-17a', --Grado de Dificultad 2 = Moderado----

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66850' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_MUA_18-29a', --Grado de Dificultad 2 = Moderado----

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66850' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_MUA_30-49a', --Grado de Dificultad 2 = Moderado----
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66850' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_MUA_50-59a', --Grado de Dificultad 2 = Moderado----

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66850' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_MUA_60a_Mas', --Grado de Dificultad 2 = Moderado----

--------Grado de Dificultad 3 = Alto--
---TD=D + DX= 66850 + LAB=3

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66850' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_MUA_0d-2a', --Grado de Dificultad 3 = Alto--

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66850' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_MUA_3-5a', --Grado de Dificultad 3 = Alto--
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66850' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_MUA_6-11a', --Grado de Dificultad 3 = Alto--

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66850' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_MUA_12-17a', --Grado de Dificultad 3 = Alto--

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66850' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_MUA_18-29a', --Grado de Dificultad 3 = Alto--

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66850' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_MUA_30-49a', --Grado de Dificultad 3 = Alto--
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66850' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_MUA_50-59a', --Grado de Dificultad 3 = Alto--

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66850' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66850' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66850' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66850' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66850' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66850' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_MUA_60a_Mas', --Grado de Dificultad 3 = Alto--

---66821 Cirugía láser para escisión de catarata
----TD=D + DX= 66821 + LAB=1---

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66821' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Cir_laser_escision_catarata_0d-2a', --66821 Cirugía láser para escisión de catarata

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66821' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Cir_laser_escision_catarata_3-5a', --66821 Cirugía láser para escisión de catarata
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66821' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Cir_laser_escision_catarata_6-11a', --66821 Cirugía láser para escisión de catarata

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66821' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Cir_laser_escision_catarata_12-17a', --66821 Cirugía láser para escisión de catarata

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66821' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Cir_laser_escision_catarata_18-29a', --66821 Cirugía láser para escisión de catarata

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66821' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Cir_laser_escision_catarata_30-49a', --66821 Cirugía láser para escisión de catarata
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66821' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Cir_laser_escision_catarata_50-59a', --66821 Cirugía láser para escisión de catarata

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66821' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Cir_laser_escision_catarata_60a_Mas', --66821 Cirugía láser para escisión de catarata

---Grado de Dificultad 2 = Moderado----
--TD=D + DX= 66821 + LAB=2

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66821' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad2_Mod_CLEC_0d-2a', --Grado de Dificultad 2 = Moderado----

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66821' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CLEC_3-5a', --Grado de Dificultad 2 = Moderado----
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66821' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CLEC_6-11a', --Grado de Dificultad 2 = Moderado----

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66821' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CLEC_12-17a', --Grado de Dificultad 2 = Moderado----

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66821' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CLEC_18-29a', --Grado de Dificultad 2 = Moderado----

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66821' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CLEC_30-49a', --Grado de Dificultad 2 = Moderado----
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66821' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CLEC_50-59a', --Grado de Dificultad 2 = Moderado----

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66821' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CLEC_60a_Mas', --Grado de Dificultad 2 = Moderado----

--------Grado de Dificultad 3 = Alto--
---TD=D + DX= 66821 + LAB=3

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66821' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CLEC_0d-2a', --Grado de Dificultad 3 = Alto--

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66821' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CLEC_3-5a', --Grado de Dificultad 3 = Alto--
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66821' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CLEC_6-11a', --Grado de Dificultad 3 = Alto--

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66821' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CLEC_12-17a', --Grado de Dificultad 3 = Alto--

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66821' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CLEC_18-29a', --Grado de Dificultad 3 = Alto--

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66821' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CLEC_30-49a', --Grado de Dificultad 3 = Alto--
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66821' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CLEC_50-59a', --Grado de Dificultad 3 = Alto--

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66821' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66821' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66821' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66821' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66821' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66821' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CLEC_60a_Mas', --Grado de Dificultad 3 = Alto--

--66820 Discision (Incision) de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoideanterior); Técnica con Instrumento Cortante (Cuchillo de Ziegler o Wheeler)
--TD=D + DX= 66820 + LAB=1

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66820' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Dis_Ins_CMS_OCPH_CZW_0d-2a', --66820 Discision (Incision) de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoideanterior); Técnica con Instrumento Cortante (Cuchillo de Ziegler o Wheeler)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66820' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Dis_Ins_CMS_OCPH_CZW_3-5a', --66820 Discision (Incision) de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoideanterior); Técnica con Instrumento Cortante (Cuchillo de Ziegler o Wheeler)
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66820' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Dis_Ins_CMS_OCPH_CZW_6-11a', --66820 Discision (Incision) de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoideanterior); Técnica con Instrumento Cortante (Cuchillo de Ziegler o Wheeler)

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66820' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Dis_Ins_CMS_OCPH_CZW_12-17a', --66820 Discision (Incision) de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoideanterior); Técnica con Instrumento Cortante (Cuchillo de Ziegler o Wheeler)

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66820' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Dis_Ins_CMS_OCPH_CZW_18-29a', --66820 Discision (Incision) de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoideanterior); Técnica con Instrumento Cortante (Cuchillo de Ziegler o Wheeler)

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66820' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Dis_Ins_CMS_OCPH_CZW_30-49a', --66820 Discision (Incision) de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoideanterior); Técnica con Instrumento Cortante (Cuchillo de Ziegler o Wheeler)
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66820' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Dis_Ins_CMS_OCPH_CZW_50-59a', --66820 Discision (Incision) de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoideanterior); Técnica con Instrumento Cortante (Cuchillo de Ziegler o Wheeler)

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66820' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Dis_Ins_CMS_OCPH_CZW_60a_Mas', --66820 Discision (Incision) de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoideanterior); Técnica con Instrumento Cortante (Cuchillo de Ziegler o Wheeler)

---Grado de Dificultad 2 = Moderado----
--TD=D + DX= 66821 + LAB=2

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66820' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad 2_Mod_CMS_OCPH_CZW_0d-2a', --Grado de Dificultad 2 = Moderado----

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66820' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad 2_Mod_CMS_OCPH_CZW_3-5a', --Grado de Dificultad 2 = Moderado----
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66820' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad 2_Mod_CMS_OCPH_CZW_6-11a', --Grado de Dificultad 2 = Moderado----

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66820' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CMS_OCPH_CZW_12-17a', --Grado de Dificultad 2 = Moderado----

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66820' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CMS_OCPH_CZW_18-29a', --Grado de Dificultad 2 = Moderado----

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66820' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CMS_OCPH_CZW_30-49a', --Grado de Dificultad 2 = Moderado----
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66820' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CMS_OCPH_CZW_50-59a', --Grado de Dificultad 2 = Moderado----

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66820' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CMS_OCPH_CZW_60a_Mas', --Grado de Dificultad 2 = Moderado----

--------Grado de Dificultad 3 = Alto--
---TD=D + DX= 66821 + LAB=3

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66820' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPH_CZW_0d-2a', --Grado de Dificultad 3 = Alto--

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66820' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPH_CZW_3-5a', --Grado de Dificultad 3 = Alto--
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66820' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPH_CZW_6-11a', --Grado de Dificultad 3 = Alto--

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66820' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPH_CZW_12-17a', --Grado de Dificultad 3 = Alto--

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66820' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPH_CZW_18-29a', --Grado de Dificultad 3 = Alto--

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66820' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPH_CZW_30-49a', --Grado de Dificultad 3 = Alto--
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66820' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPH_CZW_50-59a', --Grado de Dificultad 3 = Alto--

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66820' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66820' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66820' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66820' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66820' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66820' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPH_CZW_60a_Mas', --Grado de Dificultad 3 = Alto--

---66830 Extirpacion de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoide Anterior) Conseccion Corneo-Escleral, con o sin Iridectomia (Iridocapsulotomia)
---TD=D + DX= 66830 + LAB=1

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66830' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTIP_CMS_OCPHA_IRI_0d-2a', --66830 Extirpacion de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoide Anterior) Conseccion Corneo-Escleral, con o sin Iridectomia (Iridocapsulotomia)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66830' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTIP_CMS_OCPHA_IRI 3-5a', --66830 Extirpacion de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoide Anterior) Conseccion Corneo-Escleral, con o sin Iridectomia (Iridocapsulotomia)
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66830' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTIP_CMS_OCPHA_IRI 6-11a', --66830 Extirpacion de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoide Anterior) Conseccion Corneo-Escleral, con o sin Iridectomia (Iridocapsulotomia)

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66830' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTIP_CMS_OCPHA_IRI 12-17a', --66830 Extirpacion de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoide Anterior) Conseccion Corneo-Escleral, con o sin Iridectomia (Iridocapsulotomia)

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66830' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTIP_CMS_OCPHA_IRI 18-29a', --66830 Extirpacion de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoide Anterior) Conseccion Corneo-Escleral, con o sin Iridectomia (Iridocapsulotomia)

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66830' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTIP_CMS_OCPHA_IRI 30-49a', --66830 Extirpacion de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoide Anterior) Conseccion Corneo-Escleral, con o sin Iridectomia (Iridocapsulotomia)
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66830' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTIP_CMS_OCPHA_IRI_50-59a', --66830 Extirpacion de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoide Anterior) Conseccion Corneo-Escleral, con o sin Iridectomia (Iridocapsulotomia)

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66830' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTIP_CMS_OCPHA_IRI_60a_Mas', --66830 Extirpacion de Catarata Membranosa Secundaria (Opacidad Capsular Posterior y/o Hialoide Anterior) Conseccion Corneo-Escleral, con o sin Iridectomia (Iridocapsulotomia)

---Grado de Dificultad 2 = Moderado----
--TD=D + DX= 66821 + LAB=2

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66830' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CMS_OCPHA_IRI_0d-2a', --Grado de Dificultad 2 = Moderado----

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66830' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CMS_OCPHA_IRI_3-5a', --Grado de Dificultad 2 = Moderado----
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66830' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CMS_OCPHA_IRI_6-11a', --Grado de Dificultad 2 = Moderado----

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66830' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CMS_OCPHA_IRI_12-17a', --Grado de Dificultad 2 = Moderado----

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66830' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CMS_OCPHA_IRI_18-29a', --Grado de Dificultad 2 = Moderado----

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66830' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CMS_OCPHA_IRI_30-49a', --Grado de Dificultad 2 = Moderado----
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66830' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CMS_OCPHA_IRI_50-59a', --Grado de Dificultad 2 = Moderado----

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66830' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_CMS_OCPHA_IRI_60a_Mas', --Grado de Dificultad 2 = Moderado----

--------Grado de Dificultad 3 = Alto--
---TD=D + DX= 66821 + LAB=3

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66830' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPHA_IRI_0d-2a', --Grado de Dificultad 3 = Alto--

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66830' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPHA_IRI_3-5a', --Grado de Dificultad 3 = Alto--
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66830' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPHA_IRI_6-11a', --Grado de Dificultad 3 = Alto--

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66830' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPHA_IRI_12-17a', --Grado de Dificultad 3 = Alto--

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66830' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPHA_IRI_18-29a', --Grado de Dificultad 3 = Alto--

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66830' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPHA_IRI_30-49a', --Grado de Dificultad 3 = Alto--
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66830' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPHA_IRI_50-59a', --Grado de Dificultad 3 = Alto--

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66830' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66830' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66830' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66830' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66830' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66830' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_CMS_OCPHA_IRI_60a_Mas', --Grado de Dificultad 3 = Alto--

---66984 Extirpacion de Catarata Extracapsular con Insercion de Protesis de Cristalino Intraocular Facoemulsificacion)
--TD=D + DX= 66984 + LAB=1

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66984' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTP_CEXT_INS_PROT_CIF_0d-2a', --66984 Extirpacion de Catarata Extracapsular con Insercion de Protesis de Cristalino Intraocular Facoemulsificacion)

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66984' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTP_CEXT_INS_PROT_CIF_3-5a', --66984 Extirpacion de Catarata Extracapsular con Insercion de Protesis de Cristalino Intraocular Facoemulsificacion)
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66984' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTP_CEXT_INS_PROT_CIF_6-11a', --66984 Extirpacion de Catarata Extracapsular con Insercion de Protesis de Cristalino Intraocular Facoemulsificacion)

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66984' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTP_CEXT_INS_PROT_CIF_12-17a', --66984 Extirpacion de Catarata Extracapsular con Insercion de Protesis de Cristalino Intraocular Facoemulsificacion)

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66984' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTP_CEXT_INS_PROT_CIF_18-29a', --66984 Extirpacion de Catarata Extracapsular con Insercion de Protesis de Cristalino Intraocular Facoemulsificacion)

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66984' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTP_CEXT_INS_PROT_CIF_30-49a', --66984 Extirpacion de Catarata Extracapsular con Insercion de Protesis de Cristalino Intraocular Facoemulsificacion)
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66984' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTP_CEXT_INS_PROT_CIF_50-59a', --66984 Extirpacion de Catarata Extracapsular con Insercion de Protesis de Cristalino Intraocular Facoemulsificacion)

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66984' AND labconf1 ='1' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='1' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='1' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='1' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='1' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='1' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'EXTP_CEXT_INS_PROT_CIF_60a_Mas', --66984 Extirpacion de Catarata Extracapsular con Insercion de Protesis de Cristalino Intraocular Facoemulsificacion)

---Grado de Dificultad 2 = Moderado----
--TD=D + DX= 66821 + LAB=2

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66984' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_INS_PROT_CIF_0d-2a', --Grado de Dificultad 2 = Moderado----

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66984' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_INS_PROT_CIF_3-5a', --Grado de Dificultad 2 = Moderado----
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66984' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_INS_PROT_CIF_6-11a', --Grado de Dificultad 2 = Moderado----

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66984' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_INS_PROT_CIF_12-17a', --Grado de Dificultad 2 = Moderado----

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66984' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_INS_PROT_CIF_18-29a', --Grado de Dificultad 2 = Moderado----

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66984' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_INS_PROT_CIF_30-49a', --Grado de Dificultad 2 = Moderado----
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66984' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_INS_PROT_CIF_50-59a', --Grado de Dificultad 2 = Moderado----

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66984' AND labconf1 ='2' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='2' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='2' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='2' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='2' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='2' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_2_Mod_INS_PROT_CIF_60a_Mas', --Grado de Dificultad 2 = Moderado----

--------Grado de Dificultad 3 = Alto--
---TD=D + DX= 66821 + LAB=3

---NIÑO---
SUM (CASE WHEN EDAD<103 and
((CODIGO1='66984' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_INS_PROT_CIF_0d-2a', --Grado de Dificultad 3 = Alto--

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1='66984' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_INS_PROT_CIF_3-5a', --Grado de Dificultad 3 = Alto--
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1='66984' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_INS_PROT_CIF_6-11a', --Grado de Dificultad 3 = Alto--

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1='66984' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_INS_PROT_CIF_12-17a', --Grado de Dificultad 3 = Alto--

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1='66984' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_INS_PROT_CIF_18-29a', --Grado de Dificultad 3 = Alto--

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1='66984' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_INS_PROT_CIF_30-49a', --Grado de Dificultad 3 = Alto--
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1='66984' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_INS_PROT_CIF_50-59a', --Grado de Dificultad 3 = Alto--

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1='66984' AND labconf1 ='3' and diagnost1='D')OR
(CODIGO2='66984' AND labconf2 ='3' and diagnost2='D')OR
(CODIGO3='66984' AND labconf3 ='3' and diagnost3='D')OR
(CODIGO4='66984' AND labconf4 ='3' and diagnost4='D')OR
(CODIGO5='66984' AND labconf5 ='3' and diagnost5='D')OR
(CODIGO6='66984' AND labconf6 ='3' and diagnost6='D'))
THEN 1 ELSE 0 END) AS 'Grado_Dificultad_3_Alto_INS_PROT_CIF_60a_Mas', --Grado de Dificultad 3 = Alto--

---CONSEJERÍA PARA CONTROL Y DETECCIÓN OPORTUNA DE CATARATA---------------------------------------------------------------------------
--99401 Consejería Integral 1º
--(TD=D + DX= 99401 + LAB= 1) + TD=D + DX= (H250, H251, H252, H258, H259, H260, H261, H262, H263, H264, H268, H269, H280, H400, H409)
----REPORTEADOR HIS
--NIÑO-----
SUM( CASE WHEN EDAD<103 AND
((codigo1='99401' and diagnost1 in ('D')AND labconf1='1')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='1')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='1')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='1')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='1')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='1'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_1_02d-2a',--CONSEJERIA INTEGRAL 1--

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((codigo1='99401' and diagnost1 in ('D')AND labconf1='1')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='1')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='1')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='1')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='1')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='1'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_1_3-5a',--CONSEJERIA INTEGRAL 1--
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((codigo1='99401' and diagnost1 in ('D')AND labconf1='1')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='1')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='1')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='1')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='1')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='1'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_1_6-11a',--CONSEJERIA INTEGRAL 1--

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((codigo1='99401' and diagnost1 in ('D')AND labconf1='1')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='1')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='1')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='1')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='1')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='1'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_1_12-17a',--CONSEJERIA INTEGRAL 1--

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((codigo1='99401' and diagnost1 in ('D')AND labconf1='1')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='1')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='1')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='1')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='1')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='1'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_1_18-29a',--CONSEJERIA INTEGRAL 1--

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((codigo1='99401' and diagnost1 in ('D')AND labconf1='1')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='1')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='1')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='1')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='1')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='1'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_1_30-49a',--CONSEJERIA INTEGRAL 1--
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((codigo1='99401' and diagnost1 in ('D')AND labconf1='1')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='1')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='1')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='1')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='1')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='1'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_1_50-59a',--CONSEJERIA INTEGRAL 1--

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((codigo1='99401' and diagnost1 in ('D')AND labconf1='1')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='1')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='1')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='1')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='1')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='1'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_1_60a_Mas',--CONSEJERIA INTEGRAL 1--

----99401 Consejería Integral 2º -----
---(TD=D + DX= 99401 + LAB= 2) + TD=D + DX= (H250, H251, H252, H258, H259, H260, H261, H262, H263, H264, H268, H269, H280, H400, H409)

--NIÑO-----
SUM( CASE WHEN EDAD<103 AND
((codigo1='99401' and diagnost1 in ('D')AND labconf1='2')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='2')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='2')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='2')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='2')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='2'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_2_02d-2a',--99401 Consejería Integral 2º -----

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((codigo1='99401' and diagnost1 in ('D')AND labconf1='2')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='2')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='2')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='2')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='2')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='2'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_2_3-5a',--99401 Consejería Integral 2º -----
--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((codigo1='99401' and diagnost1 in ('D')AND labconf1='2')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='2')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='2')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='2')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='2')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='2'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_2_6-11a',--99401 Consejería Integral 2º -----

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((codigo1='99401' and diagnost1 in ('D')AND labconf1='2')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='2')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='2')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='2')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='2')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='2'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_2_12-17a',--99401 Consejería Integral 2º -----

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((codigo1='99401' and diagnost1 in ('D')AND labconf1='2')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='2')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='2')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='2')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='2')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='2'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_2_18-29a',--99401 Consejería Integral 2º -----

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((codigo1='99401' and diagnost1 in ('D')AND labconf1='2')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='2')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='2')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='2')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='2')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='2'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_2_30-49a',--99401 Consejería Integral 2º -----
-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((codigo1='99401' and diagnost1 in ('D')AND labconf1='2')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='2')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='2')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='2')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='2')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='2'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_2_50-59a',--99401 Consejería Integral 2º -----

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((codigo1='99401' and diagnost1 in ('D')AND labconf1='2')OR
(codigo2='99401' and diagnost2 in ('D') AND labconf2='2')OR
(codigo3='99401' and diagnost3 in ('D') AND labconf3='2')OR
(codigo4='99401' and diagnost4 in ('D') AND labconf4='2')OR
(codigo5='99401' and diagnost5 in ('D') AND labconf5='2')OR
(codigo6='99401' and diagnost6 in ('D') AND labconf6='2'))AND
((SUBSTRING(CODIGO1,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409')AND diagnost1='D')or
(SUBSTRING(codigo2,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost2='D') or
(SUBSTRING(codigo3,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost3='D') or
(SUBSTRING(codigo4,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost4='D') or
(SUBSTRING(codigo5,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost5='D') or
(SUBSTRING(CODIGO6,1,4) IN('H250','H251','H252','H258','H259','H260','H261','H262','H263','H264','H268','H269','H280','H400','H409') AND diagnost6='D'))
THEN 1 else 0 end) AS 'CONSEJ_INTEGRAL_2_60a_Mas',--99401 Consejería Integral 2º -----

---Z488 Controles Post Operatorios----
--Pacientes con 1º Control Post Operatorio
---TD=D + DX= Z489, Z488 + LAB= 1
SUM (CASE WHEN EDAD<103 AND
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='1' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='1' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='1' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='1' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='1' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_menor_0d-2as',--Z488 Controles Post Operatorios----

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='1' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='1' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='1' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='1' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='1' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_3-5a',--Z488 Controles Post Operatorios----

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='1' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='1' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='1' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='1' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='1' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_6-11a',--Z488 Controles Post Operatorios----

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='1' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='1' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='1' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='1' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='1' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_12-17a',--Z488 Controles Post Operatorios----

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='1' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='1' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='1' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='1' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='1' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_18-29a',--Z488 Controles Post Operatorios----

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='1' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='1' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='1' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='1' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='1' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_30-49a',--Z488 Controles Post Operatorios----

-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='1' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='1' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='1' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='1' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='1' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_50-59a',--Z488 Controles Post Operatorios----

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='1' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='1' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='1' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='1' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='1' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='1' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_60a_Mas',--Z488 Controles Post Operatorios----

---Pacientes con 2º Control Post Operatorio-----
--TD=D + DX= Z489, Z488 + LAB= 2

SUM (CASE WHEN EDAD<103 AND
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='2' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='2' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='2' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='2' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='2' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_2_menor_0d-2as',--acientes con 2º Control Post Operatorio-----

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='2' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='2' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='2' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='2' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='2' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_2_3-5a',--acientes con 2º Control Post Operatorio-----

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='2' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='2' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='2' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='2' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='2' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_2_6-11a',--acientes con 2º Control Post Operatorio-----

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='2' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='2' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='2' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='2' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='2' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_2_12-17a',--acientes con 2º Control Post Operatorio-----

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='2' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='2' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='2' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='2' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='2' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_2_18-29a',--acientes con 2º Control Post Operatorio-----

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='2' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='2' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='2' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='2' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='2' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_2_30-49a',--acientes con 2º Control Post Operatorio-----

-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='2' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='2' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='2' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='2' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='2' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_2_50-59a',--acientes con 2º Control Post Operatorio-----

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='2' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='2' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='2' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='2' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='2' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='2' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_2_60a_Mas',--acientes con 2º Control Post Operatorio-----

--Pacientes con 3º Control Post Operatorio
--TD=D + DX= Z489, Z488 + LAB= 3

SUM (CASE WHEN EDAD<103 AND
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='3' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='3' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='3' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='3' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='3' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='3' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_3_menor_0d-2as',--Pacientes con 3º Control Post Operatorio

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='3' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='3' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='3' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='3' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='3' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='3' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_3 3-5a',--Pacientes con 3º Control Post Operatorio

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='3' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='3' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='3' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='3' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='3' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='3' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_3 6-11a',--Pacientes con 3º Control Post Operatorio

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='3' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='3' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='3' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='3' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='3' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='3' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_3 12-17a',--Pacientes con 3º Control Post Operatorio

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='3' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='3' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='3' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='3' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='3' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='3' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_3 18-29a',--Pacientes con 3º Control Post Operatorio

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='3' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='3' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='3' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='3' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='3' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='3' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_3 30-49a',--Pacientes con 3º Control Post Operatorio

-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='3' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='3' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='3' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='3' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='3' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='3' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_3_50-59a',--Pacientes con 3º Control Post Operatorio

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='3' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='3' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='3' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='3' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='3' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='3' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_3_60a_Mas',--Pacientes con 3º Control Post Operatorio


---Pacientes con 4º Control Post Operatorio
--TD=D + DX= Z489, Z488 + LAB= 4

SUM (CASE WHEN EDAD<103 AND
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='4' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='4' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='4' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='4' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='4' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='4' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_4_menor_0d-2as',--Pacientes con 4º Control Post Operatorio

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='4' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='4' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='4' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='4' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='4' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='4' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_4_3-5a',--Pacientes con 4º Control Post Operatorio

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='4' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='4' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='4' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='4' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='4' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='4' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_4_6-11a',--Pacientes con 4º Control Post Operatorio

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='4' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='4' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='4' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='4' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='4' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='4' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_4_12-17a',--Pacientes con 4º Control Post Operatorio

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='4' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='4' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='4' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='4' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='4' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='4' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_4_18-29a',--Pacientes con 4º Control Post Operatorio

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='4' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='4' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='4' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='4' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='4' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='4' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_4_30-49a',--Pacientes con 4º Control Post Operatorio

-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='4' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='4' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='4' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='4' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='4' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='4' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_4_50-59a',--Pacientes con 4º Control Post Operatorio

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1='4' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2='4' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3='4' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4='4' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5='4' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6='4' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_4_60a_Mas',--Pacientes con 4º Control Post Operatorio


--Pacientes con 5 a + Controles Post Operatorio
--TD=D + DX= Z489, Z488 + LAB>= 5

SUM (CASE WHEN EDAD<103 AND
((CODIGO1 IN ('Z489','Z488')AND LABCONF1>='5' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2>='5' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3>='5' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4>='5' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5>='5' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6>='5' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_5a_menor_0d-2as',--Pacientes con 5 a + Controles Post Operatorio

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1>='5' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2>='5' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3>='5' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4>='5' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5>='5' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6>='5' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_5a_3-5a',--Pacientes con 5 a + Controles Post Operatorio

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1>='5' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2>='5' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3>='5' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4>='5' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5>='5' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6>='5' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_5a_6-11a',--Pacientes con 5 a + Controles Post Operatorio

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1>='5' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2>='5' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3>='5' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4>='5' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5>='5' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6>='5' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_5a_12-17a',--Pacientes con 5 a + Controles Post Operatorio

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1>='5' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2>='5' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3>='5' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4>='5' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5>='5' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6>='5' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_5a_18-29a',--Pacientes con 5 a + Controles Post Operatorio

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1>='5' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2>='5' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3>='5' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4>='5' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5>='5' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6>='5' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_5a_30-49a',--Pacientes con 5 a + Controles Post Operatorio

-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1>='5' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2>='5' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3>='5' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4>='5' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5>='5' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6>='5' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_5a_50-59a',--Pacientes con 5 a + Controles Post Operatorio

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1 IN ('Z489','Z488')AND LABCONF1>='5' AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND LABCONF2>='5' AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND LABCONF3>='5' AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND LABCONF4>='5' AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND LABCONF5>='5' AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND LABCONF6>='5' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROLES_POST_OPER_5a_60a_Mas',--Pacientes con 5 a + Controles Post Operatorio


--Determinación de la Agudeza Visual-- VERIFICAR OJITO ---------------------------
----TD=D + DX= Z489, Z488 + 99173
------------------------------------------------------------------------------------------------------------------------------------

SUM (CASE WHEN EDAD<103 AND
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='99173' OR CODIGO2='99173' OR CODIGO3='99173' OR CODIGO4='99173' OR CODIGO5='99173' OR CODIGO6='99173')
THEN 1 else 0 end) AS 'Determ_Agudeza_Visual_menor_0d-2as',--Determinación de la Agudeza Visual--

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='99173' OR CODIGO2='99173' OR CODIGO3='99173' OR CODIGO4='99173' OR CODIGO5='99173' OR CODIGO6='99173')
THEN 1 else 0 end) AS 'Determ_Agudeza_Visual_3-5a',--Determinación de la Agudeza Visual--

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='99173' OR CODIGO2='99173' OR CODIGO3='99173' OR CODIGO4='99173' OR CODIGO5='99173' OR CODIGO6='99173')
THEN 1 else 0 end) AS 'Determ_Agudeza_Visual_6-11a',--Determinación de la Agudeza Visual--

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='99173' OR CODIGO2='99173' OR CODIGO3='99173' OR CODIGO4='99173' OR CODIGO5='99173' OR CODIGO6='99173')
THEN 1 else 0 end) AS 'Determ_Agudeza_Visual_12-17a',--Determinación de la Agudeza Visual--

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='99173' OR CODIGO2='99173' OR CODIGO3='99173' OR CODIGO4='99173' OR CODIGO5='99173' OR CODIGO6='99173')
THEN 1 else 0 end) AS 'Determ_Agudeza_Visual_18-29a',--Determinación de la Agudeza Visual--

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='99173' OR CODIGO2='99173' OR CODIGO3='99173' OR CODIGO4='99173' OR CODIGO5='99173' OR CODIGO6='99173')
THEN 1 else 0 end) AS 'Determ_Agudeza_Visual_30-49a',--Determinación de la Agudeza Visual--

-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='99173' OR CODIGO2='99173' OR CODIGO3='99173' OR CODIGO4='99173' OR CODIGO5='99173' OR CODIGO6='99173')
THEN 1 else 0 end) AS 'Determ_Agudeza_Visual_50-59a',--Determinación de la Agudeza Visual--

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='99173' OR CODIGO2='99173' OR CODIGO3='99173' OR CODIGO4='99173' OR CODIGO5='99173' OR CODIGO6='99173')
THEN 1 else 0 end) AS 'Determ_Agudeza_Visual_60a_Mas',--Determinación de la Agudeza Visual--

--Determinación de la Presión Intraocular Bilateral
--TD=D + DX= Z489, Z488 + 92100

SUM (CASE WHEN EDAD<103 AND
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='92100' OR CODIGO2='92100' OR CODIGO3='92100' OR CODIGO4='92100' OR CODIGO5='92100' OR CODIGO6='92100')
THEN 1 else 0 end) AS 'Determ_Pre_Intraocular_Bilateral_menor_0d-2as',--Determinación de la Presión Intraocular Bilateral

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='92100' OR CODIGO2='92100' OR CODIGO3='92100' OR CODIGO4='92100' OR CODIGO5='92100' OR CODIGO6='92100')
THEN 1 else 0 end) AS 'Determ_Pre_Intraocular_Bilateral_3-5a',--Determinación de la Presión Intraocular Bilateral

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='92100' OR CODIGO2='92100' OR CODIGO3='92100' OR CODIGO4='92100' OR CODIGO5='92100' OR CODIGO6='92100')
THEN 1 else 0 end) AS 'Determ_Pre_Intraocular_Bilateral_6-11a',--Determinación de la Presión Intraocular Bilateral

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='92100' OR CODIGO2='92100' OR CODIGO3='92100' OR CODIGO4='92100' OR CODIGO5='92100' OR CODIGO6='92100')
THEN 1 else 0 end) AS 'Determ_Pre_Intraocular_Bilateral_12-17a',--Determinación de la Presión Intraocular Bilateral

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='92100' OR CODIGO2='92100' OR CODIGO3='92100' OR CODIGO4='92100' OR CODIGO5='92100' OR CODIGO6='92100')
THEN 1 else 0 end) AS 'Determ_Pre_Intraocular_Bilateral_18-29a',--Determinación de la Presión Intraocular Bilateral

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='92100' OR CODIGO2='92100' OR CODIGO3='92100' OR CODIGO4='92100' OR CODIGO5='92100' OR CODIGO6='92100')
THEN 1 else 0 end) AS 'Determ_Pre_Intraocular_Bilateral_30-49a',--Determinación de la Presión Intraocular Bilateral

-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='92100' OR CODIGO2='92100' OR CODIGO3='92100' OR CODIGO4='92100' OR CODIGO5='92100' OR CODIGO6='92100')
THEN 1 else 0 end) AS 'Determ_Pre_Intraocular_Bilateral_50-59a',--Determinación de la Presión Intraocular Bilateral

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1 IN ('Z489','Z488')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489','Z488')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489','Z488')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489','Z488')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489','Z488')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489','Z488')AND DIAGNOST6='D'))AND
(CODIGO1='92100' OR CODIGO2='92100' OR CODIGO3='92100' OR CODIGO4='92100' OR CODIGO5='92100' OR CODIGO6='92100')
THEN 1 else 0 end) AS 'Determ_Pre_Intraocular_Bilateral_60a_Mas',--Determinación de la Presión Intraocular Bilateral

------CONTROL Y TRATAMIENTO ESPECIALIZADO DE COMPLICACIONES POST QUIRÚRGICAS CON UVEÍTIS-------------------------------------------------
---H590 Síndrome vítreo consecutivo a cirugía de catarata
---TD= D + DX= H590

SUM (CASE WHEN EDAD<103 AND
((CODIGO1 IN ('H590')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H590')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H590')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H590')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H590')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H590')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'SIND_VITREO_CCC_menor_0d-2a',--H590 Síndrome vítreo consecutivo a cirugía de catarata

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1 IN ('H590')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H590')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H590')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H590')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H590')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H590')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'SIND_VITREO_CCC_3-5a',--H590 Síndrome vítreo consecutivo a cirugía de catarata


--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1 IN ('H590')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H590')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H590')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H590')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H590')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H590')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'SIND_VITREO_CCC_6-11a',--H590 Síndrome vítreo consecutivo a cirugía de catarata


---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1 IN ('H590')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H590')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H590')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H590')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H590')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H590')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'SIND_VITREO_CCC_12-17a',--H590 Síndrome vítreo consecutivo a cirugía de catarata

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1 IN ('H590')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H590')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H590')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H590')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H590')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H590')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'SIND_VITREO_CCC_18-29a',--H590 Síndrome vítreo consecutivo a cirugía de catarata

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1 IN ('H590')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H590')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H590')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H590')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H590')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H590')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'SIND_VITREO_CCC_30-49a',--H590 Síndrome vítreo consecutivo a cirugía de catarata

-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1 IN ('H590')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H590')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H590')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H590')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H590')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H590')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'SIND_VITREO_CCC_50-59a',--H590 Síndrome vítreo consecutivo a cirugía de catarata

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1 IN ('H590')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H590')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H590')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H590')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H590')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H590')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'SIND_VITREO_CCC_60a_Mas',--H590 Síndrome vítreo consecutivo a cirugía de catarata

---H598 Otros trastornos del ojo y sus anexos, consecutivos a procedimientos
--TD= D + DX= H598

SUM (CASE WHEN EDAD<103 AND
((CODIGO1 IN ('H598')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H598')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H598')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H598')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H598')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H598')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OTROS_TRAS_OJO_ACP_menor_0d-2a',--H598 Otros trastornos del ojo y sus anexos, consecutivos a procedimientos

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1 IN ('H598')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H598')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H598')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H598')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H598')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H598')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OTROS_TRAS_OJO_ACP 3-5a',--H598 Otros trastornos del ojo y sus anexos, consecutivos a procedimientos


--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1 IN ('H598')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H598')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H598')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H598')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H598')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H598')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OTROS_TRAS_OJO_ACP 6-11a',--H598 Otros trastornos del ojo y sus anexos, consecutivos a procedimientos


---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1 IN ('H598')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H598')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H598')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H598')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H598')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H598')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OTROS_TRAS_OJO_ACP 12-17a',--H598 Otros trastornos del ojo y sus anexos, consecutivos a procedimientos

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1 IN ('H598')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H598')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H598')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H598')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H598')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H598')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OTROS_TRAS_OJO_ACP 18-29a',--H598 Otros trastornos del ojo y sus anexos, consecutivos a procedimientos

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1 IN ('H598')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H598')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H598')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H598')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H598')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H598')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OTROS_TRAS_OJO_ACP 30-49a',--H598 Otros trastornos del ojo y sus anexos, consecutivos a procedimientos

-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1 IN ('H598')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H598')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H598')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H598')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H598')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H598')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OTROS_TRAS_OJO_ACP 50-59a',--H598 Otros trastornos del ojo y sus anexos, consecutivos a procedimientos

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1 IN ('H598')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H598')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H598')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H598')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H598')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H598')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OTROS_TRAS_OJO_ACP_60a_Mas',--H598 Otros trastornos del ojo y sus anexos, consecutivos a procedimientos

----TAMIZAJE, DIAGNOSTICO Y TRATAMIENTO DEL RECIÉN NACIDO CON RETINOPATÍA DE LA PREMATURIDAD---------------------------------------------
---H351 Retinopatía de la prematuridad
---TD= D + DX= H351

SUM (CASE WHEN EDAD<103 AND
((CODIGO1 IN ('H351')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H351')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H351')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H351')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H351')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H351')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'RETINOP_PREMATURIDAD_menor_0d-2a',--H351 Retinopatía de la prematuridad

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1 IN ('H351')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H351')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H351')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H351')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H351')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H351')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'RETINOP_PREMATURIDAD_3-5a',--H351 Retinopatía de la prematuridad

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1 IN ('H351')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H351')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H351')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H351')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H351')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H351')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'RETINOP_PREMATURIDAD_6-11a',--H351 Retinopatía de la prematuridad


---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1 IN ('H351')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H351')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H351')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H351')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H351')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H351')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'RETINOP_PREMATURIDAD_12-17a',--H351 Retinopatía de la prematuridad

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1 IN ('H351')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H351')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H351')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H351')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H351')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H351')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'RETINOP_PREMATURIDAD_18-29a',--H351 Retinopatía de la prematuridad

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1 IN ('H351')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H351')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H351')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H351')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H351')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H351')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'RETINOP_PREMATURIDAD_30-49a',--H351 Retinopatía de la prematuridad

-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1 IN ('H351')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H351')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H351')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H351')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H351')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H351')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'RETINOP_PREMATURIDAD_50-59a',--H351 Retinopatía de la prematuridad

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1 IN ('H351')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H351')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H351')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H351')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H351')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H351')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'RETINOP_PREMATURIDAD_60a_Mas',--H351 Retinopatía de la prematuridad

----92225 Oftalmoscopia Indirecta---
--TD=D + DX= 92225

SUM (CASE WHEN EDAD<103 AND
((CODIGO1 IN ('92225')AND DIAGNOST1='D')OR
(CODIGO2 IN ('92225')AND DIAGNOST2='D')OR
(CODIGO3 IN ('92225')AND DIAGNOST3='D')OR
(CODIGO4 IN ('92225')AND DIAGNOST4='D')OR
(CODIGO5 IN ('92225')AND DIAGNOST5='D')OR
(CODIGO6 IN ('92225')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OFTALMOS_INDIRECTA_menor_0d-2a',--92225 Oftalmoscopia Indirecta---

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1 IN ('92225')AND DIAGNOST1='D')OR
(CODIGO2 IN ('92225')AND DIAGNOST2='D')OR
(CODIGO3 IN ('92225')AND DIAGNOST3='D')OR
(CODIGO4 IN ('92225')AND DIAGNOST4='D')OR
(CODIGO5 IN ('92225')AND DIAGNOST5='D')OR
(CODIGO6 IN ('92225')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OFTALMOS_INDIRECTA_3-5a',--92225 Oftalmoscopia Indirecta---

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1 IN ('92225')AND DIAGNOST1='D')OR
(CODIGO2 IN ('92225')AND DIAGNOST2='D')OR
(CODIGO3 IN ('92225')AND DIAGNOST3='D')OR
(CODIGO4 IN ('92225')AND DIAGNOST4='D')OR
(CODIGO5 IN ('92225')AND DIAGNOST5='D')OR
(CODIGO6 IN ('92225')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OFTALMOS_INDIRECTA_6-11a',--92225 Oftalmoscopia Indirecta---


---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1 IN ('92225')AND DIAGNOST1='D')OR
(CODIGO2 IN ('92225')AND DIAGNOST2='D')OR
(CODIGO3 IN ('92225')AND DIAGNOST3='D')OR
(CODIGO4 IN ('92225')AND DIAGNOST4='D')OR
(CODIGO5 IN ('92225')AND DIAGNOST5='D')OR
(CODIGO6 IN ('92225')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OFTALMOS_INDIRECTA_12-17a',--92225 Oftalmoscopia Indirecta---

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1 IN ('92225')AND DIAGNOST1='D')OR
(CODIGO2 IN ('92225')AND DIAGNOST2='D')OR
(CODIGO3 IN ('92225')AND DIAGNOST3='D')OR
(CODIGO4 IN ('92225')AND DIAGNOST4='D')OR
(CODIGO5 IN ('92225')AND DIAGNOST5='D')OR
(CODIGO6 IN ('92225')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OFTALMOS_INDIRECTA_18-29a',--92225 Oftalmoscopia Indirecta---

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1 IN ('92225')AND DIAGNOST1='D')OR
(CODIGO2 IN ('92225')AND DIAGNOST2='D')OR
(CODIGO3 IN ('92225')AND DIAGNOST3='D')OR
(CODIGO4 IN ('92225')AND DIAGNOST4='D')OR
(CODIGO5 IN ('92225')AND DIAGNOST5='D')OR
(CODIGO6 IN ('92225')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OFTALMOS_INDIRECTA_30-49a',--92225 Oftalmoscopia Indirecta---

-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1 IN ('92225')AND DIAGNOST1='D')OR
(CODIGO2 IN ('92225')AND DIAGNOST2='D')OR
(CODIGO3 IN ('92225')AND DIAGNOST3='D')OR
(CODIGO4 IN ('92225')AND DIAGNOST4='D')OR
(CODIGO5 IN ('92225')AND DIAGNOST5='D')OR
(CODIGO6 IN ('92225')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OFTALMOS_INDIRECTA_50-59a',--92225 Oftalmoscopia Indirecta---

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1 IN ('92225')AND DIAGNOST1='D')OR
(CODIGO2 IN ('92225')AND DIAGNOST2='D')OR
(CODIGO3 IN ('92225')AND DIAGNOST3='D')OR
(CODIGO4 IN ('92225')AND DIAGNOST4='D')OR
(CODIGO5 IN ('92225')AND DIAGNOST5='D')OR
(CODIGO6 IN ('92225')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'OFTALMOS_INDIRECTA_60a_Mas',--92225 Oftalmoscopia Indirecta---

---67227 Destrucción de retinopatía extensa
---TD=D + DX= 67227

SUM (CASE WHEN EDAD<103 AND
((CODIGO1 IN ('67227')AND DIAGNOST1='D')OR
(CODIGO2 IN ('67227')AND DIAGNOST2='D')OR
(CODIGO3 IN ('67227')AND DIAGNOST3='D')OR
(CODIGO4 IN ('67227')AND DIAGNOST4='D')OR
(CODIGO5 IN ('67227')AND DIAGNOST5='D')OR
(CODIGO6 IN ('67227')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'Destruc_retinopat_extensa_menor_0d-2a',--67227 Destrucción de retinopatía extensa

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1 IN ('67227')AND DIAGNOST1='D')OR
(CODIGO2 IN ('67227')AND DIAGNOST2='D')OR
(CODIGO3 IN ('67227')AND DIAGNOST3='D')OR
(CODIGO4 IN ('67227')AND DIAGNOST4='D')OR
(CODIGO5 IN ('67227')AND DIAGNOST5='D')OR
(CODIGO6 IN ('67227')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'Destruc_retinopat_extensa_3-5a',--67227 Destrucción de retinopatía extensa

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1 IN ('67227')AND DIAGNOST1='D')OR
(CODIGO2 IN ('67227')AND DIAGNOST2='D')OR
(CODIGO3 IN ('67227')AND DIAGNOST3='D')OR
(CODIGO4 IN ('67227')AND DIAGNOST4='D')OR
(CODIGO5 IN ('67227')AND DIAGNOST5='D')OR
(CODIGO6 IN ('67227')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'Destruc_retinopat_extensa_6-11a',--67227 Destrucción de retinopatía extensa


---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1 IN ('67227')AND DIAGNOST1='D')OR
(CODIGO2 IN ('67227')AND DIAGNOST2='D')OR
(CODIGO3 IN ('67227')AND DIAGNOST3='D')OR
(CODIGO4 IN ('67227')AND DIAGNOST4='D')OR
(CODIGO5 IN ('67227')AND DIAGNOST5='D')OR
(CODIGO6 IN ('67227')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'Destruc_retinopat_extensa_12-17a',--67227 Destrucción de retinopatía extensa

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1 IN ('67227')AND DIAGNOST1='D')OR
(CODIGO2 IN ('67227')AND DIAGNOST2='D')OR
(CODIGO3 IN ('67227')AND DIAGNOST3='D')OR
(CODIGO4 IN ('67227')AND DIAGNOST4='D')OR
(CODIGO5 IN ('67227')AND DIAGNOST5='D')OR
(CODIGO6 IN ('67227')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'Destruc_retinopat_extensa_18-29a',--67227 Destrucción de retinopatía extensa

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1 IN ('67227')AND DIAGNOST1='D')OR
(CODIGO2 IN ('67227')AND DIAGNOST2='D')OR
(CODIGO3 IN ('67227')AND DIAGNOST3='D')OR
(CODIGO4 IN ('67227')AND DIAGNOST4='D')OR
(CODIGO5 IN ('67227')AND DIAGNOST5='D')OR
(CODIGO6 IN ('67227')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'Destruc_retinopat_extensa_30-49a',--67227 Destrucción de retinopatía extensa

-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1 IN ('67227')AND DIAGNOST1='D')OR
(CODIGO2 IN ('67227')AND DIAGNOST2='D')OR
(CODIGO3 IN ('67227')AND DIAGNOST3='D')OR
(CODIGO4 IN ('67227')AND DIAGNOST4='D')OR
(CODIGO5 IN ('67227')AND DIAGNOST5='D')OR
(CODIGO6 IN ('67227')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'Destruc_retinopat_extensa_50-59a',--67227 Destrucción de retinopatía extensa

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1 IN ('67227')AND DIAGNOST1='D')OR
(CODIGO2 IN ('67227')AND DIAGNOST2='D')OR
(CODIGO3 IN ('67227')AND DIAGNOST3='D')OR
(CODIGO4 IN ('67227')AND DIAGNOST4='D')OR
(CODIGO5 IN ('67227')AND DIAGNOST5='D')OR
(CODIGO6 IN ('67227')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'Destruc_retinopat_extensa_60a_Mas',--67227 Destrucción de retinopatía extensa

---Z489 Control Post Operatorio de RN con retinopatía de la Prematuridad
---TD=D + DX= Z489 + TD=D + DX= H351
SUM (CASE WHEN EDAD<103 AND
((CODIGO1 IN ('Z489')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489')AND DIAGNOST6='D'))AND
((CODIGO1='H351' AND DIAGNOST1='D')OR
(CODIGO2='H351' AND DIAGNOST2='D')OR
(CODIGO3='H351' AND DIAGNOST3='D')OR
(CODIGO4='H351' AND DIAGNOST4='D')OR
(CODIGO5='H351' AND DIAGNOST5='D')OR
(CODIGO6='H351' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROL_POST_OPE_RN_RP_menor_0d-2a',--Z489 Control Post Operatorio de RN con retinopatía de la Prematuridad

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1 IN ('Z489')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489')AND DIAGNOST6='D'))AND
((CODIGO1='H351' AND DIAGNOST1='D')OR
(CODIGO2='H351' AND DIAGNOST2='D')OR
(CODIGO3='H351' AND DIAGNOST3='D')OR
(CODIGO4='H351' AND DIAGNOST4='D')OR
(CODIGO5='H351' AND DIAGNOST5='D')OR
(CODIGO6='H351' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROL_POST_OPE_RN_RP_3-5a',--Z489 Control Post Operatorio de RN con retinopatía de la Prematuridad

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1 IN ('Z489')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489')AND DIAGNOST6='D'))AND
((CODIGO1='H351' AND DIAGNOST1='D')OR
(CODIGO2='H351' AND DIAGNOST2='D')OR
(CODIGO3='H351' AND DIAGNOST3='D')OR
(CODIGO4='H351' AND DIAGNOST4='D')OR
(CODIGO5='H351' AND DIAGNOST5='D')OR
(CODIGO6='H351' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROL_POST_OPE_RN_RP_6-11a',--Z489 Control Post Operatorio de RN con retinopatía de la Prematuridad

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1 IN ('Z489')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489')AND DIAGNOST6='D'))AND
((CODIGO1='H351' AND DIAGNOST1='D')OR
(CODIGO2='H351' AND DIAGNOST2='D')OR
(CODIGO3='H351' AND DIAGNOST3='D')OR
(CODIGO4='H351' AND DIAGNOST4='D')OR
(CODIGO5='H351' AND DIAGNOST5='D')OR
(CODIGO6='H351' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROL_POST_OPE_RN_RP_12-17a',--Z489 Control Post Operatorio de RN con retinopatía de la Prematuridad

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1 IN ('Z489')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489')AND DIAGNOST6='D'))AND
((CODIGO1='H351' AND DIAGNOST1='D')OR
(CODIGO2='H351' AND DIAGNOST2='D')OR
(CODIGO3='H351' AND DIAGNOST3='D')OR
(CODIGO4='H351' AND DIAGNOST4='D')OR
(CODIGO5='H351' AND DIAGNOST5='D')OR
(CODIGO6='H351' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROL_POST_OPE_RN_RP_18-29a',--Z489 Control Post Operatorio de RN con retinopatía de la Prematuridad

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1 IN ('Z489')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489')AND DIAGNOST6='D'))AND
((CODIGO1='H351' AND DIAGNOST1='D')OR
(CODIGO2='H351' AND DIAGNOST2='D')OR
(CODIGO3='H351' AND DIAGNOST3='D')OR
(CODIGO4='H351' AND DIAGNOST4='D')OR
(CODIGO5='H351' AND DIAGNOST5='D')OR
(CODIGO6='H351' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROL_POST_OPE_RN_RP_30-49a',--Z489 Control Post Operatorio de RN con retinopatía de la Prematuridad

-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1 IN ('Z489')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489')AND DIAGNOST6='D'))AND
((CODIGO1='H351' AND DIAGNOST1='D')OR
(CODIGO2='H351' AND DIAGNOST2='D')OR
(CODIGO3='H351' AND DIAGNOST3='D')OR
(CODIGO4='H351' AND DIAGNOST4='D')OR
(CODIGO5='H351' AND DIAGNOST5='D')OR
(CODIGO6='H351' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROL_POST_OPE_RN_RP_50-59a',--Z489 Control Post Operatorio de RN con retinopatía de la Prematuridad

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1 IN ('Z489')AND DIAGNOST1='D')OR
(CODIGO2 IN ('Z489')AND DIAGNOST2='D')OR
(CODIGO3 IN ('Z489')AND DIAGNOST3='D')OR
(CODIGO4 IN ('Z489')AND DIAGNOST4='D')OR
(CODIGO5 IN ('Z489')AND DIAGNOST5='D')OR
(CODIGO6 IN ('Z489')AND DIAGNOST6='D'))AND
((CODIGO1='H351' AND DIAGNOST1='D')OR
(CODIGO2='H351' AND DIAGNOST2='D')OR
(CODIGO3='H351' AND DIAGNOST3='D')OR
(CODIGO4='H351' AND DIAGNOST4='D')OR
(CODIGO5='H351' AND DIAGNOST5='D')OR
(CODIGO6='H351' AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'CONTROL_POST_OPE_RN_RP_60a_Mas',--Z489 Control Post Operatorio de RN con retinopatía de la Prematuridad

------------TAMIZAJE Y DETECCIÓN DE ERRORES REFRACTIVOS EN NIÑOS------------------------------------------------------------------------
---Evaluación visual en Niños (hasta 3 años) en Establecimientos de Salud--------------------------------------------------------------
---H539 Alteración Visual No Especificada
--TD= D + DX= H539

SUM (CASE WHEN EDAD<103 AND
((CODIGO1 IN ('H539')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H539')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H539')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H539')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H539')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H539')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'ALTERACION_VISUAL_NO_ESPEC_menor_0d-2a',--H539 Alteración Visual No Especificada

---NIÑO-----
SUM (CASE WHEN (EDAD>=103 AND EDAD<=105) and
((CODIGO1 IN ('H539')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H539')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H539')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H539')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H539')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H539')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'ALTERACION_VISUAL_NO_ESPEC_3-5a',--H539 Alteración Visual No Especificada

--NIÑO--------------
SUM (CASE WHEN (EDAD>=106 AND EDAD<=111) and
((CODIGO1 IN ('H539')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H539')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H539')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H539')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H539')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H539')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'ALTERACION_VISUAL_NO_ESPEC_6-11a',--H539 Alteración Visual No Especificada

---ADOLESCENTE----
SUM (CASE WHEN (EDAD>=112 AND EDAD<=117) and
((CODIGO1 IN ('H539')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H539')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H539')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H539')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H539')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H539')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'ALTERACION_VISUAL_NO_ESPEC_12-17a',--H539 Alteración Visual No Especificada

----JOVEN-------
SUM (CASE WHEN (EDAD>=118 AND EDAD<=129) and
((CODIGO1 IN ('H539')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H539')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H539')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H539')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H539')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H539')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'ALTERACION_VISUAL_NO_ESPEC_18-29a',--H539 Alteración Visual No Especificada

------ADULTO--------
SUM (CASE WHEN (EDAD>=130 AND EDAD<=149) and
((CODIGO1 IN ('H539')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H539')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H539')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H539')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H539')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H539')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'ALTERACION_VISUAL_NO_ESPEC_30-49a',--H539 Alteración Visual No Especificada

-----ADULTO------------------
SUM (CASE WHEN (EDAD>=150 AND EDAD<=159) and
((CODIGO1 IN ('H539')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H539')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H539')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H539')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H539')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H539')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'ALTERACION_VISUAL_NO_ESPEC_50-59a',--H539 Alteración Visual No Especificada

---ADULTO MAYOR
SUM (CASE WHEN (EDAD>=160 AND EDAD<=199) and
((CODIGO1 IN ('H539')AND DIAGNOST1='D')OR
(CODIGO2 IN ('H539')AND DIAGNOST2='D')OR
(CODIGO3 IN ('H539')AND DIAGNOST3='D')OR
(CODIGO4 IN ('H539')AND DIAGNOST4='D')OR
(CODIGO5 IN ('H539')AND DIAGNOST5='D')OR
(CODIGO6 IN ('H539')AND DIAGNOST6='D'))
THEN 1 else 0 end) AS 'ALTERACION_VISUAL_NO_ESPEC_60a_Mas',--H539 Alteración Visual No Especificada

---Tamizaje de Errores Refractivos en Niños (mayores de 3 años) en Establecimientos de Salud
--H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)
--TD= D + DX= H542
--NIÑO----
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMB_NINO_0d-2a', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

SUM (CASE WHEN (EDAD>=103 and EDAD <=105) and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMB_NINO_3-5a', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

SUM (CASE WHEN (EDAD>=106 and EDAD <=111) and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMB_NINO_6-11a', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

-----ADOLESCENTE------

SUM (CASE WHEN (EDAD>=112 and EDAD <=117) and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMB_ADOLES_12-17a', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

---JOVEN-----

SUM (CASE WHEN (EDAD>=118 and EDAD <=129) and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMB_JOVEN_18-29a', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

-----ADULTO-------------------
SUM (CASE WHEN (EDAD>=130 and EDAD <=149) and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMB_ADUL1_30-49a', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

SUM (CASE WHEN (EDAD>=150 and EDAD <=159) and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMB_ADUL2_50-59a', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

-----ADULTO MAYOR-----
SUM (CASE WHEN (EDAD>=160 and EDAD <=199) and
((CODIGO1='H542' AND diagnost1 ='D')OR
(CODIGO2='H542' AND diagnost2 ='D')OR
(CODIGO3='H542' AND diagnost3 ='D')OR
(CODIGO4='H542' AND diagnost4 ='D')OR
(CODIGO5='H542' AND diagnost5 ='D')OR
(CODIGO6='H542' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMB_ADUL_MAY_60a_Mas', --H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

---H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)
--TD= D + DX= H546

--NIÑO----
SUM (CASE WHEN EDAD<103 and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMM_0d-2a', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

SUM (CASE WHEN (EDAD>=103 and EDAD <=105) and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMM_3-5a', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

SUM (CASE WHEN (EDAD>=106 and EDAD <=111) and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMM_6-11a', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

-----ADOLESCENTE------

SUM (CASE WHEN (EDAD>=112 and EDAD <=117) and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMM_ADOLES_12-17a', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

---JOVEN-----

SUM (CASE WHEN (EDAD>=118 and EDAD <=129) and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMM_JOVEN_18-29a', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

-----ADULTO-------------------
SUM (CASE WHEN (EDAD>=130 and EDAD <=149) and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMM_ADUL1_30-49a', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

SUM (CASE WHEN (EDAD>=150 and EDAD <=159) and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMM_ADUL2_50-59a', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

-----ADULTO MAYOR-----
SUM (CASE WHEN (EDAD>=160 and EDAD <=199) and
((CODIGO1='H546' AND diagnost1 ='D')OR
(CODIGO2='H546' AND diagnost2 ='D')OR
(CODIGO3='H546' AND diagnost3 ='D')OR
(CODIGO4='H546' AND diagnost4 ='D')OR
(CODIGO5='H546' AND diagnost5 ='D')OR
(CODIGO6='H546' AND diagnost6 ='D'))
THEN 1 ELSE 0 END) AS 'DISM_INDETER_AVAMBOJOS_DVMM_ADUL_MAY_60a_Mas', --H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

--Tamizaje de Errores Refractivos en Instituciones Educativas
--99173 Determinación de la Agudeza Visual Bilateral
--UPS = 303102 + TD= D + DX= 99173
SUM( CASE WHEN SUBSTRING(his_2018.cod_servsa,1,6)='303102' AND (EDAD>=103 AND EDAD <=105) AND
(codigo1 IN('99173') and diagnost1 IN('D') OR
codigo2 IN('99173') and diagnost2 IN('D') OR
codigo3 IN('99173') and diagnost3 IN('D') OR
codigo4 IN('99173') and diagnost4 IN('D') OR
codigo5 IN('99173') and diagnost5 IN('D') OR
codigo6 IN('99173') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'DETERM_AGUD_VB_3-5a',--99173 Determinación de la Agudeza Visual Bilateral

SUM( CASE WHEN SUBSTRING(his_2018.cod_servsa,1,6)='303102' AND (EDAD>=106 AND EDAD <=111) AND
(codigo1 IN('99173') and diagnost1 IN('D') OR
codigo2 IN('99173') and diagnost2 IN('D') OR
codigo3 IN('99173') and diagnost3 IN('D') OR
codigo4 IN('99173') and diagnost4 IN('D') OR
codigo5 IN('99173') and diagnost5 IN('D') OR
codigo6 IN('99173') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'DETERM_AGUD_VB_6-11a',--99173 Determinación de la Agudeza Visual Bilateral

SUM( CASE WHEN SUBSTRING(his_2018.cod_servsa,1,6)='303102' AND (EDAD>=112 AND EDAD <=117) AND
(codigo1 IN('99173') and diagnost1 IN('D') OR
codigo2 IN('99173') and diagnost2 IN('D') OR
codigo3 IN('99173') and diagnost3 IN('D') OR
codigo4 IN('99173') and diagnost4 IN('D') OR
codigo5 IN('99173') and diagnost5 IN('D') OR
codigo6 IN('99173') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'DETERM_AGUD_VB_12-17a',--99173 Determinación de la Agudeza Visual Bilateral

---H539 Alteración Visual No Especificada
--UPS = 303102 + TD= D + DX= H539

SUM( CASE WHEN SUBSTRING(his_2018.cod_servsa,1,6)='303102' AND (EDAD>=103 AND EDAD <=105) AND
(codigo1 IN('H539') and diagnost1 IN('D') OR
codigo2 IN('H539') and diagnost2 IN('D') OR
codigo3 IN('H539') and diagnost3 IN('D') OR
codigo4 IN('H539') and diagnost4 IN('D') OR
codigo5 IN('H539') and diagnost5 IN('D') OR
codigo6 IN('H539') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'ALTERA_VISUAL_NO_ESPE_3-5a',--H539 Alteración Visual No Especificada

SUM( CASE WHEN SUBSTRING(his_2018.cod_servsa,1,6)='303102' AND (EDAD>=106 AND EDAD <=111) AND
(codigo1 IN('H539') and diagnost1 IN('D') OR
codigo2 IN('H539') and diagnost2 IN('D') OR
codigo3 IN('H539') and diagnost3 IN('D') OR
codigo4 IN('H539') and diagnost4 IN('D') OR
codigo5 IN('H539') and diagnost5 IN('D') OR
codigo6 IN('H539') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'ALTERA_VISUAL_NO_ESPE_6-11a',--H539 Alteración Visual No Especificada

SUM( CASE WHEN SUBSTRING(his_2018.cod_servsa,1,6)='303102' AND (EDAD>=112 AND EDAD <=117) AND
(codigo1 IN('H539') and diagnost1 IN('D') OR
codigo2 IN('H539') and diagnost2 IN('D') OR
codigo3 IN('H539') and diagnost3 IN('D') OR
codigo4 IN('H539') and diagnost4 IN('D') OR
codigo5 IN('H539') and diagnost5 IN('D') OR
codigo6 IN('H539') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'ALTERA_VISUAL_NO_ESPE_12-17a',--H539 Alteración Visual No Especificada

---H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)
--UPS = 303102 + TD= D + DX= H542

SUM( CASE WHEN SUBSTRING(his_2018.cod_servsa,1,6)='303102' AND (EDAD>=103 AND EDAD <=105) AND
(codigo1 IN('H542') and diagnost1 IN('D') OR
codigo2 IN('H542') and diagnost2 IN('D') OR
codigo3 IN('H542') and diagnost3 IN('D') OR
codigo4 IN('H542') and diagnost4 IN('D') OR
codigo5 IN('H542') and diagnost5 IN('D') OR
codigo6 IN('H542') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'DISM_DISC_VMB_3-5a',--H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

SUM( CASE WHEN SUBSTRING(his_2018.cod_servsa,1,6)='303102' AND (EDAD>=106 AND EDAD <=111) AND
(codigo1 IN('H542') and diagnost1 IN('D') OR
codigo2 IN('H542') and diagnost2 IN('D') OR
codigo3 IN('H542') and diagnost3 IN('D') OR
codigo4 IN('H542') and diagnost4 IN('D') OR
codigo5 IN('H542') and diagnost5 IN('D') OR
codigo6 IN('H542') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'DISM_DISC_VMB_6-11a',--H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

SUM( CASE WHEN SUBSTRING(his_2018.cod_servsa,1,6)='303102' AND (EDAD>=112 AND EDAD <=117) AND
(codigo1 IN('H542') and diagnost1 IN('D') OR
codigo2 IN('H542') and diagnost2 IN('D') OR
codigo3 IN('H542') and diagnost3 IN('D') OR
codigo4 IN('H542') and diagnost4 IN('D') OR
codigo5 IN('H542') and diagnost5 IN('D') OR
codigo6 IN('H542') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'DISM_DISC_VMB_12-17a',--H542 Disminución Indeterminada de la Agudeza Visual en ambos ojos (Discapacidad visual moderada, binocular)

--H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)
--UPS = 303102 + TD= D + DX= H546

SUM( CASE WHEN SUBSTRING(his_2018.cod_servsa,1,6)='303102' AND (EDAD>=103 AND EDAD <=105) AND
(codigo1 IN('H546') and diagnost1 IN('D') OR
codigo2 IN('H546') and diagnost2 IN('D') OR
codigo3 IN('H546') and diagnost3 IN('D') OR
codigo4 IN('H546') and diagnost4 IN('D') OR
codigo5 IN('H546') and diagnost5 IN('D') OR
codigo6 IN('H546') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'DISM_DISC_VMM_3-5a',--H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

SUM( CASE WHEN SUBSTRING(his_2018.cod_servsa,1,6)='303102' AND (EDAD>=106 AND EDAD <=111) AND
(codigo1 IN('H546') and diagnost1 IN('D') OR
codigo2 IN('H546') and diagnost2 IN('D') OR
codigo3 IN('H546') and diagnost3 IN('D') OR
codigo4 IN('H546') and diagnost4 IN('D') OR
codigo5 IN('H546') and diagnost5 IN('D') OR
codigo6 IN('H546') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'DISM_DISC_VMM_6-11a',--H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

SUM( CASE WHEN SUBSTRING(his_2018.cod_servsa,1,6)='303102' AND (EDAD>=112 AND EDAD <=117) AND
(codigo1 IN('H546') and diagnost1 IN('D') OR
codigo2 IN('H546') and diagnost2 IN('D') OR
codigo3 IN('H546') and diagnost3 IN('D') OR
codigo4 IN('H546') and diagnost4 IN('D') OR
codigo5 IN('H546') and diagnost5 IN('D') OR
codigo6 IN('H546') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'DISM_DISC_VMM_12-17a',--H546 Disminución Indeterminada de la Agudeza Visual de un ojo (Discapacidad visual moderada, monocular)

---Evaluación y Despistaje de Errores Refractivos en niños en niños de 0 a 11 años
--H538 Otras Alteraciones Visuales: Leucocoria, Anormalidades en la inspección, No fijación
--TD= D + DX= H538
SUM (CASE WHEN edad <103 and
(codigo1 IN('H538') and diagnost1 IN('D') OR
codigo2 IN('H538') and diagnost2 IN('D') OR
codigo3 IN('H538') and diagnost3 IN('D') OR
codigo4 IN('H538') and diagnost4 IN('D') OR
codigo5 IN('H538') and diagnost5 IN('D') OR
codigo6 IN('H538') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'OTRAS_ALT_VIS_LAINF_0d-2a', --H538 Otras Alteraciones Visuales: Leucocoria, Anormalidades en la inspección, No fijación

SUM (CASE WHEN (edad>=103 AND edad <=105) and
(codigo1 IN('H538') and diagnost1 IN('D') OR
codigo2 IN('H538') and diagnost2 IN('D') OR
codigo3 IN('H538') and diagnost3 IN('D') OR
codigo4 IN('H538') and diagnost4 IN('D') OR
codigo5 IN('H538') and diagnost5 IN('D') OR
codigo6 IN('H538') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'OTRAS_ALT_VIS_LAINF_3-5a', --H538 Otras Alteraciones Visuales: Leucocoria, Anormalidades en la inspección, No fijación

SUM (CASE WHEN (edad>=106 AND edad <=111) and
(codigo1 IN('H538') and diagnost1 IN('D') OR
codigo2 IN('H538') and diagnost2 IN('D') OR
codigo3 IN('H538') and diagnost3 IN('D') OR
codigo4 IN('H538') and diagnost4 IN('D') OR
codigo5 IN('H538') and diagnost5 IN('D') OR
codigo6 IN('H538') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'OTRAS_ALT_VIS_LAINF_6-11a', --H538 Otras Alteraciones Visuales: Leucocoria, Anormalidades en la inspección, No fijación

SUM (CASE WHEN (edad>=112 AND edad <=117) and
(codigo1 IN('H538') and diagnost1 IN('D') OR
codigo2 IN('H538') and diagnost2 IN('D') OR
codigo3 IN('H538') and diagnost3 IN('D') OR
codigo4 IN('H538') and diagnost4 IN('D') OR
codigo5 IN('H538') and diagnost5 IN('D') OR
codigo6 IN('H538') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'OTRAS_ALT_VIS_LAINF_12-17a', --H538 Otras Alteraciones Visuales: Leucocoria, Anormalidades en la inspección, No fijación

SUM (CASE WHEN (edad>=118 AND edad <=129) and
(codigo1 IN('H538') and diagnost1 IN('D') OR
codigo2 IN('H538') and diagnost2 IN('D') OR
codigo3 IN('H538') and diagnost3 IN('D') OR
codigo4 IN('H538') and diagnost4 IN('D') OR
codigo5 IN('H538') and diagnost5 IN('D') OR
codigo6 IN('H538') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'OTRAS_ALT_VIS_LAINF_18-29a', --H538 Otras Alteraciones Visuales: Leucocoria, Anormalidades en la inspección, No fijación

SUM (CASE WHEN (edad>=130 AND edad <=149) and
(codigo1 IN('H538') and diagnost1 IN('D') OR
codigo2 IN('H538') and diagnost2 IN('D') OR
codigo3 IN('H538') and diagnost3 IN('D') OR
codigo4 IN('H538') and diagnost4 IN('D') OR
codigo5 IN('H538') and diagnost5 IN('D') OR
codigo6 IN('H538') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'OTRAS_ALT_VIS_LAINF_30-49a', --H538 Otras Alteraciones Visuales: Leucocoria, Anormalidades en la inspección, No fijación

SUM (CASE WHEN (edad>=150 AND edad <=159) and
(codigo1 IN('H538') and diagnost1 IN('D') OR
codigo2 IN('H538') and diagnost2 IN('D') OR
codigo3 IN('H538') and diagnost3 IN('D') OR
codigo4 IN('H538') and diagnost4 IN('D') OR
codigo5 IN('H538') and diagnost5 IN('D') OR
codigo6 IN('H538') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'OTRAS_ALT_VIS_LAINF_50-59a', --H538 Otras Alteraciones Visuales: Leucocoria, Anormalidades en la inspección, No fijación

SUM (CASE WHEN (edad>=160 AND edad <=199) and
(codigo1 IN('H538') and diagnost1 IN('D') OR
codigo2 IN('H538') and diagnost2 IN('D') OR
codigo3 IN('H538') and diagnost3 IN('D') OR
codigo4 IN('H538') and diagnost4 IN('D') OR
codigo5 IN('H538') and diagnost5 IN('D') OR
codigo6 IN('H538') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'OTRAS_ALT_VIS_LAINF_60a_Mas', --H538 Otras Alteraciones Visuales: Leucocoria, Anormalidades en la inspección, No fijación

---H509 Estrabismo
--TD= D + DX= H509

SUM (CASE WHEN edad <103 and
(codigo1 IN('H509') and diagnost1 IN('D') OR
codigo2 IN('H509') and diagnost2 IN('D') OR
codigo3 IN('H509') and diagnost3 IN('D') OR
codigo4 IN('H509') and diagnost4 IN('D') OR
codigo5 IN('H509') and diagnost5 IN('D') OR
codigo6 IN('H509') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Estrabismo_0d-2a', --H509 Estrabismo

SUM (CASE WHEN (edad>=103 AND edad <=105) and
(codigo1 IN('H509') and diagnost1 IN('D') OR
codigo2 IN('H509') and diagnost2 IN('D') OR
codigo3 IN('H509') and diagnost3 IN('D') OR
codigo4 IN('H509') and diagnost4 IN('D') OR
codigo5 IN('H509') and diagnost5 IN('D') OR
codigo6 IN('H509') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Estrabismo_3-5a', --H509 Estrabismo

SUM (CASE WHEN (edad>=106 AND edad <=111) and
(codigo1 IN('H509') and diagnost1 IN('D') OR
codigo2 IN('H509') and diagnost2 IN('D') OR
codigo3 IN('H509') and diagnost3 IN('D') OR
codigo4 IN('H509') and diagnost4 IN('D') OR
codigo5 IN('H509') and diagnost5 IN('D') OR
codigo6 IN('H509') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Estrabismo_6-11a', --H509 Estrabismo

SUM (CASE WHEN (edad>=112 AND edad <=117) and
(codigo1 IN('H509') and diagnost1 IN('D') OR
codigo2 IN('H509') and diagnost2 IN('D') OR
codigo3 IN('H509') and diagnost3 IN('D') OR
codigo4 IN('H509') and diagnost4 IN('D') OR
codigo5 IN('H509') and diagnost5 IN('D') OR
codigo6 IN('H509') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Estrabismo_12-17a', --H509 Estrabismo

SUM (CASE WHEN (edad>=118 AND edad <=129) and
(codigo1 IN('H509') and diagnost1 IN('D') OR
codigo2 IN('H509') and diagnost2 IN('D') OR
codigo3 IN('H509') and diagnost3 IN('D') OR
codigo4 IN('H509') and diagnost4 IN('D') OR
codigo5 IN('H509') and diagnost5 IN('D') OR
codigo6 IN('H509') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Estrabismo_18-29a', --H509 Estrabismo

SUM (CASE WHEN (edad>=130 AND edad <=149) and
(codigo1 IN('H509') and diagnost1 IN('D') OR
codigo2 IN('H509') and diagnost2 IN('D') OR
codigo3 IN('H509') and diagnost3 IN('D') OR
codigo4 IN('H509') and diagnost4 IN('D') OR
codigo5 IN('H509') and diagnost5 IN('D') OR
codigo6 IN('H509') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Estrabismo_30-49a', --H509 Estrabismo

SUM (CASE WHEN (edad>=150 AND edad <=159) and
(codigo1 IN('H509') and diagnost1 IN('D') OR
codigo2 IN('H509') and diagnost2 IN('D') OR
codigo3 IN('H509') and diagnost3 IN('D') OR
codigo4 IN('H509') and diagnost4 IN('D') OR
codigo5 IN('H509') and diagnost5 IN('D') OR
codigo6 IN('H509') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Estrabismo_50-59a', --H509 Estrabismo

SUM (CASE WHEN (edad>=160 AND edad <=199) and
(codigo1 IN('H509') and diagnost1 IN('D') OR
codigo2 IN('H509') and diagnost2 IN('D') OR
codigo3 IN('H509') and diagnost3 IN('D') OR
codigo4 IN('H509') and diagnost4 IN('D') OR
codigo5 IN('H509') and diagnost5 IN('D') OR
codigo6 IN('H509') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Estrabismo_60a_Mas', --H509 Estrabismo

--H359 Patologías Retinales
--TD= D + DX= H359

SUM (CASE WHEN edad <103 and
(codigo1 IN('H359') and diagnost1 IN('D') OR
codigo2 IN('H359') and diagnost2 IN('D') OR
codigo3 IN('H359') and diagnost3 IN('D') OR
codigo4 IN('H359') and diagnost4 IN('D') OR
codigo5 IN('H359') and diagnost5 IN('D') OR
codigo6 IN('H359') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Patologias_Retinales_0d-2a', --H359 Patologías Retinales

SUM (CASE WHEN (edad>=103 AND edad <=105) and
(codigo1 IN('H359') and diagnost1 IN('D') OR
codigo2 IN('H359') and diagnost2 IN('D') OR
codigo3 IN('H359') and diagnost3 IN('D') OR
codigo4 IN('H359') and diagnost4 IN('D') OR
codigo5 IN('H359') and diagnost5 IN('D') OR
codigo6 IN('H359') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Patologias_Retinales_3-5a', --H359 Patologías Retinales

SUM (CASE WHEN (edad>=106 AND edad <=111) and
(codigo1 IN('H359') and diagnost1 IN('D') OR
codigo2 IN('H359') and diagnost2 IN('D') OR
codigo3 IN('H359') and diagnost3 IN('D') OR
codigo4 IN('H359') and diagnost4 IN('D') OR
codigo5 IN('H359') and diagnost5 IN('D') OR
codigo6 IN('H359') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Patologias_Retinales_6-11a', --H359 Patologías Retinales

SUM (CASE WHEN (edad>=112 AND edad <=117) and
(codigo1 IN('H359') and diagnost1 IN('D') OR
codigo2 IN('H359') and diagnost2 IN('D') OR
codigo3 IN('H359') and diagnost3 IN('D') OR
codigo4 IN('H359') and diagnost4 IN('D') OR
codigo5 IN('H359') and diagnost5 IN('D') OR
codigo6 IN('H359') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Patologias_Retinales_12-17a', --H359 Patologías Retinales

SUM (CASE WHEN (edad>=118 AND edad <=129) and
(codigo1 IN('H359') and diagnost1 IN('D') OR
codigo2 IN('H359') and diagnost2 IN('D') OR
codigo3 IN('H359') and diagnost3 IN('D') OR
codigo4 IN('H359') and diagnost4 IN('D') OR
codigo5 IN('H359') and diagnost5 IN('D') OR
codigo6 IN('H359') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Patologias_Retinales_18-29a', --H359 Patologías Retinales

SUM (CASE WHEN (edad>=130 AND edad <=149) and
(codigo1 IN('H359') and diagnost1 IN('D') OR
codigo2 IN('H359') and diagnost2 IN('D') OR
codigo3 IN('H359') and diagnost3 IN('D') OR
codigo4 IN('H359') and diagnost4 IN('D') OR
codigo5 IN('H359') and diagnost5 IN('D') OR
codigo6 IN('H359') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Patologias_Retinales_30-49a', --H359 Patologías Retinales

SUM (CASE WHEN (edad>=150 AND edad <=159) and
(codigo1 IN('H359') and diagnost1 IN('D') OR
codigo2 IN('H359') and diagnost2 IN('D') OR
codigo3 IN('H359') and diagnost3 IN('D') OR
codigo4 IN('H359') and diagnost4 IN('D') OR
codigo5 IN('H359') and diagnost5 IN('D') OR
codigo6 IN('H359') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Patologias_Retinales_50-59a', --H359 Patologías Retinales

SUM (CASE WHEN (edad>=160 AND edad <=199) and
(codigo1 IN('H359') and diagnost1 IN('D') OR
codigo2 IN('H359') and diagnost2 IN('D') OR
codigo3 IN('H359') and diagnost3 IN('D') OR
codigo4 IN('H359') and diagnost4 IN('D') OR
codigo5 IN('H359') and diagnost5 IN('D') OR
codigo6 IN('H359') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Patologias_Retinales_60a_Mas', --H359 Patologías Retinales

--H179 Cicatriz Corneal
--TD= D + DX= H179

SUM (CASE WHEN edad <103 and
(codigo1 IN('H179') and diagnost1 IN('D') OR
codigo2 IN('H179') and diagnost2 IN('D') OR
codigo3 IN('H179') and diagnost3 IN('D') OR
codigo4 IN('H179') and diagnost4 IN('D') OR
codigo5 IN('H179') and diagnost5 IN('D') OR
codigo6 IN('H179') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Cicatriz_Corneal_0d-2a', --H179 Cicatriz Corneal

SUM (CASE WHEN (edad>=103 AND edad <=105) and
(codigo1 IN('H179') and diagnost1 IN('D') OR
codigo2 IN('H179') and diagnost2 IN('D') OR
codigo3 IN('H179') and diagnost3 IN('D') OR
codigo4 IN('H179') and diagnost4 IN('D') OR
codigo5 IN('H179') and diagnost5 IN('D') OR
codigo6 IN('H179') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Cicatriz_Corneal_3-5a', --H179 Cicatriz Corneal

SUM (CASE WHEN (edad>=106 AND edad <=111) and
(codigo1 IN('H179') and diagnost1 IN('D') OR
codigo2 IN('H179') and diagnost2 IN('D') OR
codigo3 IN('H179') and diagnost3 IN('D') OR
codigo4 IN('H179') and diagnost4 IN('D') OR
codigo5 IN('H179') and diagnost5 IN('D') OR
codigo6 IN('H179') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Cicatriz_Corneal_6-11a', --H179 Cicatriz Corneal

SUM (CASE WHEN (edad>=112 AND edad <=117) and
(codigo1 IN('H179') and diagnost1 IN('D') OR
codigo2 IN('H179') and diagnost2 IN('D') OR
codigo3 IN('H179') and diagnost3 IN('D') OR
codigo4 IN('H179') and diagnost4 IN('D') OR
codigo5 IN('H179') and diagnost5 IN('D') OR
codigo6 IN('H179') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Cicatriz_Corneal_12-17a', --H179 Cicatriz Corneal

SUM (CASE WHEN (edad>=118 AND edad <=129) and
(codigo1 IN('H179') and diagnost1 IN('D') OR
codigo2 IN('H179') and diagnost2 IN('D') OR
codigo3 IN('H179') and diagnost3 IN('D') OR
codigo4 IN('H179') and diagnost4 IN('D') OR
codigo5 IN('H179') and diagnost5 IN('D') OR
codigo6 IN('H179') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Cicatriz_Corneal_18-29a', --H179 Cicatriz Corneal

SUM (CASE WHEN (edad>=130 AND edad <=149) and
(codigo1 IN('H179') and diagnost1 IN('D') OR
codigo2 IN('H179') and diagnost2 IN('D') OR
codigo3 IN('H179') and diagnost3 IN('D') OR
codigo4 IN('H179') and diagnost4 IN('D') OR
codigo5 IN('H179') and diagnost5 IN('D') OR
codigo6 IN('H179') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Cicatriz_Corneal_30-49a', --H179 Cicatriz Corneal

SUM (CASE WHEN (edad>=150 AND edad <=159) and
(codigo1 IN('H179') and diagnost1 IN('D') OR
codigo2 IN('H179') and diagnost2 IN('D') OR
codigo3 IN('H179') and diagnost3 IN('D') OR
codigo4 IN('H179') and diagnost4 IN('D') OR
codigo5 IN('H179') and diagnost5 IN('D') OR
codigo6 IN('H179') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Cicatriz_Corneal_50-59a', --H179 Cicatriz Corneal

SUM (CASE WHEN (edad>=160 AND edad <=199) and
(codigo1 IN('H179') and diagnost1 IN('D') OR
codigo2 IN('H179') and diagnost2 IN('D') OR
codigo3 IN('H179') and diagnost3 IN('D') OR
codigo4 IN('H179') and diagnost4 IN('D') OR
codigo5 IN('H179') and diagnost5 IN('D') OR
codigo6 IN('H179') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Cicatriz_Corneal_60a_Mas', --H179 Cicatriz Corneal

----H028 / H029 Enfermedad del Parpado
---TD= D + DX= H028 / H029

SUM (CASE WHEN edad <103 and
(codigo1 IN('H028','H029') and diagnost1 IN('D') OR
codigo2 IN('H028','H029') and diagnost2 IN('D') OR
codigo3 IN('H028','H029') and diagnost3 IN('D') OR
codigo4 IN('H028','H029') and diagnost4 IN('D') OR
codigo5 IN('H028','H029') and diagnost5 IN('D') OR
codigo6 IN('H028','H029') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Enfermedad_del_Parpado_0d-2a', --H028 / H029 Enfermedad del Parpado

SUM (CASE WHEN (edad>=103 AND edad <=105) and
(codigo1 IN('H028','H029') and diagnost1 IN('D') OR
codigo2 IN('H028','H029') and diagnost2 IN('D') OR
codigo3 IN('H028','H029') and diagnost3 IN('D') OR
codigo4 IN('H028','H029') and diagnost4 IN('D') OR
codigo5 IN('H028','H029') and diagnost5 IN('D') OR
codigo6 IN('H028','H029') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Enfermedad_del_Parpado_3-5a', --H028 / H029 Enfermedad del Parpado

SUM (CASE WHEN (edad>=106 AND edad <=111) and
(codigo1 IN('H028','H029') and diagnost1 IN('D') OR
codigo2 IN('H028','H029') and diagnost2 IN('D') OR
codigo3 IN('H028','H029') and diagnost3 IN('D') OR
codigo4 IN('H028','H029') and diagnost4 IN('D') OR
codigo5 IN('H028','H029') and diagnost5 IN('D') OR
codigo6 IN('H028','H029') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Enfermedad_del_Parpado_6-11a', --H028 / H029 Enfermedad del Parpado

SUM (CASE WHEN (edad>=112 AND edad <=117) and
(codigo1 IN('H028','H029') and diagnost1 IN('D') OR
codigo2 IN('H028','H029') and diagnost2 IN('D') OR
codigo3 IN('H028','H029') and diagnost3 IN('D') OR
codigo4 IN('H028','H029') and diagnost4 IN('D') OR
codigo5 IN('H028','H029') and diagnost5 IN('D') OR
codigo6 IN('H028','H029') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Enfermedad_del_Parpado_12-17a', --H028 / H029 Enfermedad del Parpado

SUM (CASE WHEN (edad>=118 AND edad <=129) and
(codigo1 IN('H028','H029') and diagnost1 IN('D') OR
codigo2 IN('H028','H029') and diagnost2 IN('D') OR
codigo3 IN('H028','H029') and diagnost3 IN('D') OR
codigo4 IN('H028','H029') and diagnost4 IN('D') OR
codigo5 IN('H028','H029') and diagnost5 IN('D') OR
codigo6 IN('H028','H029') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Enfermedad_del_Parpado_18-29a', --H028 / H029 Enfermedad del Parpado

SUM (CASE WHEN (edad>=130 AND edad <=149) and
(codigo1 IN('H028','H029') and diagnost1 IN('D') OR
codigo2 IN('H028','H029') and diagnost2 IN('D') OR
codigo3 IN('H028','H029') and diagnost3 IN('D') OR
codigo4 IN('H028','H029') and diagnost4 IN('D') OR
codigo5 IN('H028','H029') and diagnost5 IN('D') OR
codigo6 IN('H028','H029') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Enfermedad_del_Parpado_30-49a', --H028 / H029 Enfermedad del Parpado

SUM (CASE WHEN (edad>=150 AND edad <=159) and
(codigo1 IN('H028','H029') and diagnost1 IN('D') OR
codigo2 IN('H028','H029') and diagnost2 IN('D') OR
codigo3 IN('H028','H029') and diagnost3 IN('D') OR
codigo4 IN('H028','H029') and diagnost4 IN('D') OR
codigo5 IN('H028','H029') and diagnost5 IN('D') OR
codigo6 IN('H028','H029') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Enfermedad_del_Parpado_50-59a', --H028 / H029 Enfermedad del Parpado

SUM (CASE WHEN (edad>=160 AND edad <=199) and
(codigo1 IN('H028','H029') and diagnost1 IN('D') OR
codigo2 IN('H028','H029') and diagnost2 IN('D') OR
codigo3 IN('H028','H029') and diagnost3 IN('D') OR
codigo4 IN('H028','H029') and diagnost4 IN('D') OR
codigo5 IN('H028','H029') and diagnost5 IN('D') OR
codigo6 IN('H028','H029') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Enfermedad_del_Parpado_60a_Mas', --H028 / H029 Enfermedad del Parpado

----H527 Ametropía
---TD= D + DX= H527

SUM (CASE WHEN edad <103 and
(codigo1 IN('H527') and diagnost1 IN('D') OR
codigo2 IN('H527') and diagnost2 IN('D') OR
codigo3 IN('H527') and diagnost3 IN('D') OR
codigo4 IN('H527') and diagnost4 IN('D') OR
codigo5 IN('H527') and diagnost5 IN('D') OR
codigo6 IN('H527') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Ametropia_0d-2a', --H527 Ametropía

SUM (CASE WHEN (edad>=103 AND edad <=105) and
(codigo1 IN('H527') and diagnost1 IN('D') OR
codigo2 IN('H527') and diagnost2 IN('D') OR
codigo3 IN('H527') and diagnost3 IN('D') OR
codigo4 IN('H527') and diagnost4 IN('D') OR
codigo5 IN('H527') and diagnost5 IN('D') OR
codigo6 IN('H527') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Ametropia_3-5a', --H527 Ametropía

SUM (CASE WHEN (edad>=106 AND edad <=111) and
(codigo1 IN('H527') and diagnost1 IN('D') OR
codigo2 IN('H527') and diagnost2 IN('D') OR
codigo3 IN('H527') and diagnost3 IN('D') OR
codigo4 IN('H527') and diagnost4 IN('D') OR
codigo5 IN('H527') and diagnost5 IN('D') OR
codigo6 IN('H527') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Ametropia_6-11a', --H527 Ametropía

SUM (CASE WHEN (edad>=112 AND edad <=117) and
(codigo1 IN('H527') and diagnost1 IN('D') OR
codigo2 IN('H527') and diagnost2 IN('D') OR
codigo3 IN('H527') and diagnost3 IN('D') OR
codigo4 IN('H527') and diagnost4 IN('D') OR
codigo5 IN('H527') and diagnost5 IN('D') OR
codigo6 IN('H527') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Ametropia_12-17a', --H527 Ametropía

SUM (CASE WHEN (edad>=118 AND edad <=129) and
(codigo1 IN('H527') and diagnost1 IN('D') OR
codigo2 IN('H527') and diagnost2 IN('D') OR
codigo3 IN('H527') and diagnost3 IN('D') OR
codigo4 IN('H527') and diagnost4 IN('D') OR
codigo5 IN('H527') and diagnost5 IN('D') OR
codigo6 IN('H527') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Ametropia_18-29a', --H527 Ametropía

SUM (CASE WHEN (edad>=130 AND edad <=149) and
(codigo1 IN('H527') and diagnost1 IN('D') OR
codigo2 IN('H527') and diagnost2 IN('D') OR
codigo3 IN('H527') and diagnost3 IN('D') OR
codigo4 IN('H527') and diagnost4 IN('D') OR
codigo5 IN('H527') and diagnost5 IN('D') OR
codigo6 IN('H527') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Ametropia_30-49a', --H527 Ametropía

SUM (CASE WHEN (edad>=150 AND edad <=159) and
(codigo1 IN('H527') and diagnost1 IN('D') OR
codigo2 IN('H527') and diagnost2 IN('D') OR
codigo3 IN('H527') and diagnost3 IN('D') OR
codigo4 IN('H527') and diagnost4 IN('D') OR
codigo5 IN('H527') and diagnost5 IN('D') OR
codigo6 IN('H527') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Ametropia_50-59a', --H527 Ametropía

SUM (CASE WHEN (edad>=160 AND edad <=199) and
(codigo1 IN('H527') and diagnost1 IN('D') OR
codigo2 IN('H527') and diagnost2 IN('D') OR
codigo3 IN('H527') and diagnost3 IN('D') OR
codigo4 IN('H527') and diagnost4 IN('D') OR
codigo5 IN('H527') and diagnost5 IN('D') OR
codigo6 IN('H527') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Ametropia_60a_Mas', --H527 Ametropía

-----Diagnostico y Tratamiento de Errores Refractivos
--H521 Miopía
--TD= D + DX= H521

SUM (CASE WHEN edad <103 and
(codigo1 IN('H521') and diagnost1 IN('D') OR
codigo2 IN('H521') and diagnost2 IN('D') OR
codigo3 IN('H521') and diagnost3 IN('D') OR
codigo4 IN('H521') and diagnost4 IN('D') OR
codigo5 IN('H521') and diagnost5 IN('D') OR
codigo6 IN('H521') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Miopia_0d-2a', --H521 Miopía

SUM (CASE WHEN (edad>=103 AND edad <=105) and
(codigo1 IN('H521') and diagnost1 IN('D') OR
codigo2 IN('H521') and diagnost2 IN('D') OR
codigo3 IN('H521') and diagnost3 IN('D') OR
codigo4 IN('H521') and diagnost4 IN('D') OR
codigo5 IN('H521') and diagnost5 IN('D') OR
codigo6 IN('H521') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Miopia_3-5a', --H521 Miopía

SUM (CASE WHEN (edad>=106 AND edad <=111) and
(codigo1 IN('H521') and diagnost1 IN('D') OR
codigo2 IN('H521') and diagnost2 IN('D') OR
codigo3 IN('H521') and diagnost3 IN('D') OR
codigo4 IN('H521') and diagnost4 IN('D') OR
codigo5 IN('H521') and diagnost5 IN('D') OR
codigo6 IN('H521') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Miopia_6-11a', --H521 Miopía

SUM (CASE WHEN (edad>=112 AND edad <=117) and
(codigo1 IN('H521') and diagnost1 IN('D') OR
codigo2 IN('H521') and diagnost2 IN('D') OR
codigo3 IN('H521') and diagnost3 IN('D') OR
codigo4 IN('H521') and diagnost4 IN('D') OR
codigo5 IN('H521') and diagnost5 IN('D') OR
codigo6 IN('H521') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Miopia_12-17a', --H521 Miopía

SUM (CASE WHEN (edad>=118 AND edad <=129) and
(codigo1 IN('H521') and diagnost1 IN('D') OR
codigo2 IN('H521') and diagnost2 IN('D') OR
codigo3 IN('H521') and diagnost3 IN('D') OR
codigo4 IN('H521') and diagnost4 IN('D') OR
codigo5 IN('H521') and diagnost5 IN('D') OR
codigo6 IN('H521') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Miopia_18-29a', --H521 Miopía

SUM (CASE WHEN (edad>=130 AND edad <=149) and
(codigo1 IN('H521') and diagnost1 IN('D') OR
codigo2 IN('H521') and diagnost2 IN('D') OR
codigo3 IN('H521') and diagnost3 IN('D') OR
codigo4 IN('H521') and diagnost4 IN('D') OR
codigo5 IN('H521') and diagnost5 IN('D') OR
codigo6 IN('H521') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Miopia_30-49a', --H521 Miopía

SUM (CASE WHEN (edad>=150 AND edad <=159) and
(codigo1 IN('H521') and diagnost1 IN('D') OR
codigo2 IN('H521') and diagnost2 IN('D') OR
codigo3 IN('H521') and diagnost3 IN('D') OR
codigo4 IN('H521') and diagnost4 IN('D') OR
codigo5 IN('H521') and diagnost5 IN('D') OR
codigo6 IN('H521') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Miopia_50-59a', --H521 Miopía

SUM (CASE WHEN (edad>=160 AND edad <=199) and
(codigo1 IN('H521') and diagnost1 IN('D') OR
codigo2 IN('H521') and diagnost2 IN('D') OR
codigo3 IN('H521') and diagnost3 IN('D') OR
codigo4 IN('H521') and diagnost4 IN('D') OR
codigo5 IN('H521') and diagnost5 IN('D') OR
codigo6 IN('H521') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Miopia_60a_Mas', --H521 Miopía

---H520 Hipermetropía
--TD= D + DX= H520

SUM (CASE WHEN edad <103 and
(codigo1 IN('H520') and diagnost1 IN('D') OR
codigo2 IN('H520') and diagnost2 IN('D') OR
codigo3 IN('H520') and diagnost3 IN('D') OR
codigo4 IN('H520') and diagnost4 IN('D') OR
codigo5 IN('H520') and diagnost5 IN('D') OR
codigo6 IN('H520') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Hipermetropia_0d-2a', --H520 Hipermetropía

SUM (CASE WHEN (edad>=103 AND edad <=105) and
(codigo1 IN('H520') and diagnost1 IN('D') OR
codigo2 IN('H520') and diagnost2 IN('D') OR
codigo3 IN('H520') and diagnost3 IN('D') OR
codigo4 IN('H520') and diagnost4 IN('D') OR
codigo5 IN('H520') and diagnost5 IN('D') OR
codigo6 IN('H520') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Hipermetropia_3-5a', --H520 Hipermetropía

SUM (CASE WHEN (edad>=106 AND edad <=111) and
(codigo1 IN('H520') and diagnost1 IN('D') OR
codigo2 IN('H520') and diagnost2 IN('D') OR
codigo3 IN('H520') and diagnost3 IN('D') OR
codigo4 IN('H520') and diagnost4 IN('D') OR
codigo5 IN('H520') and diagnost5 IN('D') OR
codigo6 IN('H520') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Hipermetropia_6-11a', --H520 Hipermetropía

SUM (CASE WHEN (edad>=112 AND edad <=117) and
(codigo1 IN('H520') and diagnost1 IN('D') OR
codigo2 IN('H520') and diagnost2 IN('D') OR
codigo3 IN('H520') and diagnost3 IN('D') OR
codigo4 IN('H520') and diagnost4 IN('D') OR
codigo5 IN('H520') and diagnost5 IN('D') OR
codigo6 IN('H520') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Hipermetropia_12-17a', --H520 Hipermetropía

SUM (CASE WHEN (edad>=118 AND edad <=129) and
(codigo1 IN('H520') and diagnost1 IN('D') OR
codigo2 IN('H520') and diagnost2 IN('D') OR
codigo3 IN('H520') and diagnost3 IN('D') OR
codigo4 IN('H520') and diagnost4 IN('D') OR
codigo5 IN('H520') and diagnost5 IN('D') OR
codigo6 IN('H520') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Hipermetropia_18-29a', --H520 Hipermetropía

SUM (CASE WHEN (edad>=130 AND edad <=149) and
(codigo1 IN('H520') and diagnost1 IN('D') OR
codigo2 IN('H520') and diagnost2 IN('D') OR
codigo3 IN('H520') and diagnost3 IN('D') OR
codigo4 IN('H520') and diagnost4 IN('D') OR
codigo5 IN('H520') and diagnost5 IN('D') OR
codigo6 IN('H520') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Hipermetropia_30-49a', --H520 Hipermetropía

SUM (CASE WHEN (edad>=150 AND edad <=159) and
(codigo1 IN('H520') and diagnost1 IN('D') OR
codigo2 IN('H520') and diagnost2 IN('D') OR
codigo3 IN('H520') and diagnost3 IN('D') OR
codigo4 IN('H520') and diagnost4 IN('D') OR
codigo5 IN('H520') and diagnost5 IN('D') OR
codigo6 IN('H520') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Hipermetropia_50-59a', --H520 Hipermetropía

SUM (CASE WHEN (edad>=160 AND edad <=199) and
(codigo1 IN('H520') and diagnost1 IN('D') OR
codigo2 IN('H520') and diagnost2 IN('D') OR
codigo3 IN('H520') and diagnost3 IN('D') OR
codigo4 IN('H520') and diagnost4 IN('D') OR
codigo5 IN('H520') and diagnost5 IN('D') OR
codigo6 IN('H520') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Hipermetropia_60a_Mas', --H520 Hipermetropía

---H522 Astigmatismo
--TD= D + DX= H522

SUM (CASE WHEN edad <103 and
(codigo1 IN('H522') and diagnost1 IN('D') OR
codigo2 IN('H522') and diagnost2 IN('D') OR
codigo3 IN('H522') and diagnost3 IN('D') OR
codigo4 IN('H522') and diagnost4 IN('D') OR
codigo5 IN('H522') and diagnost5 IN('D') OR
codigo6 IN('H522') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Astigmatismo_0d-2a', --H522 Astigmatismo

SUM (CASE WHEN (edad>=103 AND edad <=105) and
(codigo1 IN('H522') and diagnost1 IN('D') OR
codigo2 IN('H522') and diagnost2 IN('D') OR
codigo3 IN('H522') and diagnost3 IN('D') OR
codigo4 IN('H522') and diagnost4 IN('D') OR
codigo5 IN('H522') and diagnost5 IN('D') OR
codigo6 IN('H522') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Astigmatismo_3-5a', --H522 Astigmatismo

SUM (CASE WHEN (edad>=106 AND edad <=111) and
(codigo1 IN('H522') and diagnost1 IN('D') OR
codigo2 IN('H522') and diagnost2 IN('D') OR
codigo3 IN('H522') and diagnost3 IN('D') OR
codigo4 IN('H522') and diagnost4 IN('D') OR
codigo5 IN('H522') and diagnost5 IN('D') OR
codigo6 IN('H522') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Astigmatismo_6-11a', --H522 Astigmatismo

SUM (CASE WHEN (edad>=112 AND edad <=117) and
(codigo1 IN('H522') and diagnost1 IN('D') OR
codigo2 IN('H522') and diagnost2 IN('D') OR
codigo3 IN('H522') and diagnost3 IN('D') OR
codigo4 IN('H522') and diagnost4 IN('D') OR
codigo5 IN('H522') and diagnost5 IN('D') OR
codigo6 IN('H522') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Astigmatismo_12-17a', --H522 Astigmatismo

SUM (CASE WHEN (edad>=118 AND edad <=129) and
(codigo1 IN('H522') and diagnost1 IN('D') OR
codigo2 IN('H522') and diagnost2 IN('D') OR
codigo3 IN('H522') and diagnost3 IN('D') OR
codigo4 IN('H522') and diagnost4 IN('D') OR
codigo5 IN('H522') and diagnost5 IN('D') OR
codigo6 IN('H522') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Astigmatismo_18-29a', --H522 Astigmatismo

SUM (CASE WHEN (edad>=130 AND edad <=149) and
(codigo1 IN('H522') and diagnost1 IN('D') OR
codigo2 IN('H522') and diagnost2 IN('D') OR
codigo3 IN('H522') and diagnost3 IN('D') OR
codigo4 IN('H522') and diagnost4 IN('D') OR
codigo5 IN('H522') and diagnost5 IN('D') OR
codigo6 IN('H522') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Astigmatismo_30-49a', --H522 Astigmatismo

SUM (CASE WHEN (edad>=150 AND edad <=159) and
(codigo1 IN('H522') and diagnost1 IN('D') OR
codigo2 IN('H522') and diagnost2 IN('D') OR
codigo3 IN('H522') and diagnost3 IN('D') OR
codigo4 IN('H522') and diagnost4 IN('D') OR
codigo5 IN('H522') and diagnost5 IN('D') OR
codigo6 IN('H522') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Astigmatismo_50-59a', --H522 Astigmatismo

SUM (CASE WHEN (edad>=160 AND edad <=199) and
(codigo1 IN('H522') and diagnost1 IN('D') OR
codigo2 IN('H522') and diagnost2 IN('D') OR
codigo3 IN('H522') and diagnost3 IN('D') OR
codigo4 IN('H522') and diagnost4 IN('D') OR
codigo5 IN('H522') and diagnost5 IN('D') OR
codigo6 IN('H522') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Astigmatismo_60a_Mas', --H522 Astigmatismo

---Z460 Prueba y ajuste de anteojos
--TD= D + DX= Z460

SUM (CASE WHEN edad <103 and
(codigo1 IN('Z460') and diagnost1 IN('D') OR
codigo2 IN('Z460') and diagnost2 IN('D') OR
codigo3 IN('Z460') and diagnost3 IN('D') OR
codigo4 IN('Z460') and diagnost4 IN('D') OR
codigo5 IN('Z460') and diagnost5 IN('D') OR
codigo6 IN('Z460') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Prueba_ajuste_anteojos_0d-2a', --Z460 Prueba y ajuste de anteojos

SUM (CASE WHEN (edad>=103 AND edad <=105) and
(codigo1 IN('Z460') and diagnost1 IN('D') OR
codigo2 IN('Z460') and diagnost2 IN('D') OR
codigo3 IN('Z460') and diagnost3 IN('D') OR
codigo4 IN('Z460') and diagnost4 IN('D') OR
codigo5 IN('Z460') and diagnost5 IN('D') OR
codigo6 IN('Z460') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Prueba_ajuste_anteojos_3-5a', --Z460 Prueba y ajuste de anteojos

SUM (CASE WHEN (edad>=106 AND edad <=111) and
(codigo1 IN('Z460') and diagnost1 IN('D') OR
codigo2 IN('Z460') and diagnost2 IN('D') OR
codigo3 IN('Z460') and diagnost3 IN('D') OR
codigo4 IN('Z460') and diagnost4 IN('D') OR
codigo5 IN('Z460') and diagnost5 IN('D') OR
codigo6 IN('Z460') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Prueba_ajuste_anteojos_6-11a', --Z460 Prueba y ajuste de anteojos

SUM (CASE WHEN (edad>=112 AND edad <=117) and
(codigo1 IN('Z460') and diagnost1 IN('D') OR
codigo2 IN('Z460') and diagnost2 IN('D') OR
codigo3 IN('Z460') and diagnost3 IN('D') OR
codigo4 IN('Z460') and diagnost4 IN('D') OR
codigo5 IN('Z460') and diagnost5 IN('D') OR
codigo6 IN('Z460') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Prueba_ajuste_anteojos_12-17a', --Z460 Prueba y ajuste de anteojos

SUM (CASE WHEN (edad>=118 AND edad <=129) and
(codigo1 IN('Z460') and diagnost1 IN('D') OR
codigo2 IN('Z460') and diagnost2 IN('D') OR
codigo3 IN('Z460') and diagnost3 IN('D') OR
codigo4 IN('Z460') and diagnost4 IN('D') OR
codigo5 IN('Z460') and diagnost5 IN('D') OR
codigo6 IN('Z460') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Prueba_ajuste_anteojos_18-29a', --Z460 Prueba y ajuste de anteojos

SUM (CASE WHEN (edad>=130 AND edad <=149) and
(codigo1 IN('Z460') and diagnost1 IN('D') OR
codigo2 IN('Z460') and diagnost2 IN('D') OR
codigo3 IN('Z460') and diagnost3 IN('D') OR
codigo4 IN('Z460') and diagnost4 IN('D') OR
codigo5 IN('Z460') and diagnost5 IN('D') OR
codigo6 IN('Z460') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Prueba_ajuste_anteojos_30-49a', --Z460 Prueba y ajuste de anteojos

SUM (CASE WHEN (edad>=150 AND edad <=159) and
(codigo1 IN('Z460') and diagnost1 IN('D') OR
codigo2 IN('Z460') and diagnost2 IN('D') OR
codigo3 IN('Z460') and diagnost3 IN('D') OR
codigo4 IN('Z460') and diagnost4 IN('D') OR
codigo5 IN('Z460') and diagnost5 IN('D') OR
codigo6 IN('Z460') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Prueba_ajuste_anteojos_50-59a', --Z460 Prueba y ajuste de anteojos

SUM (CASE WHEN (edad>=160 AND edad <=199) and
(codigo1 IN('Z460') and diagnost1 IN('D') OR
codigo2 IN('Z460') and diagnost2 IN('D') OR
codigo3 IN('Z460') and diagnost3 IN('D') OR
codigo4 IN('Z460') and diagnost4 IN('D') OR
codigo5 IN('Z460') and diagnost5 IN('D') OR
codigo6 IN('Z460') and diagnost6 IN('D'))
THEN 1 ELSE 0 END) AS 'Prueba_ajuste_anteojos_60a_Mas' --Z460 Prueba y ajuste de anteojos

FROM his_2018 INNER JOIN ESTABLEC ON  his_2018.COD_ESTAB= ESTABLEC.COD_ESTAB
INNER JOIN red  ON establec.ubi_red = red.Ubi_Red
INNER JOIN mred ON establec.ubi_mred = mred.Ubi_mred
INNER JOIN provincia ON establec.ubi_prov = provincia.Ubi_Prov
INNER JOIN distrito ON establec.ubi_dist = distrito.ubi_dist
WHERE -- MONTH(FECHA) between '12' and '12'

	(convert(date,Fecha) between @startDate and @endDate)

	AND
	(
		-- Establecimiento
		( (@establecimiento IS NOT NULL AND CAST(ESTABLEC.cod_2000 AS INT) = @establecimiento) )
		OR
		-- Redes, micro redes, establec
		( (@red IS NOT NULL AND red.cod_red = @red) AND (@mred IS NOT NULL AND mred.cod_mic = @mred) AND (@establec_red IS NOT NULL AND CAST(ESTABLEC.cod_2000 AS INT) = @establec_red) )
		OR
		( (@red IS NOT NULL AND red.cod_red = @red) AND (@mred IS NOT NULL AND mred.cod_mic = @mred) AND (@establec_red IS NULL) )
		OR
		( (@red IS NOT NULL AND red.cod_red = @red) AND (@mred IS NULL) AND (@establec_red IS NULL) )
		OR
		-- Provincias, distritos, establec
		( (@provincia IS NOT NULL AND provincia.cod_prov = @provincia) AND (@distrito IS NOT NULL AND distrito.cod_dist = @distrito) AND (@establec_prov IS NOT NULL AND CAST(ESTABLEC.cod_2000 AS INT) = @establec_prov) )
		OR
		( (@provincia IS NOT NULL AND provincia.cod_prov = @provincia) AND (@distrito IS NOT NULL AND distrito.cod_dist = @distrito) AND (@establec_prov IS NULL) )
		OR
		( (@provincia IS NOT NULL AND provincia.cod_prov = @provincia) AND (@distrito IS NULL AND @establec_prov IS NULL) )
	)

GROUP BY ESTABLEC.COD_ESTAB,ESTABLEC.DESC_ESTAB,red.desc_red,mred.desc_micro,provincia.desc_prov,distrito.desc_dist


END
