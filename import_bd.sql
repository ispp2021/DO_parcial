USE kaggle
GO
--crear la tabla si no existe
IF NOT EXISTS(SELECT * FROM SYS.TABLES WHERE object_id=OBJECT_ID(N'dbo.starbucks') AND type='U')
	CREATE TABLE dbo.starbucks(
		Beverage_category VARCHAR(50),
		beverage	VARCHAR(100),
		Beverage_prep	VARCHAR(50),
		Calories	 DECIMAL(6,3),
		Total_Fat_g VARCHAR(10),
		Trans_Fat_g	DECIMAL(6,3),
		Saturated_Fat_g	DECIMAL(6,3),
		Sodium_mg	DECIMAL(6,3),
		Total_Carbohydrates_g	DECIMAL(6,3),
		Cholesterol_mg	DECIMAL(6,3),
		Dietary_Fibre_g	DECIMAL(6,3),
		Sugars_g	DECIMAL(6,3),
		Protein_g	DECIMAL(6,3),
		Vitamin_a_pct VARCHAR(10),
		vitamin_c_pct VARCHAR(10),
		calcium_pct VARCHAR(10),
		Iron_pct VARCHAR(10),
		Caffeine_mg VARCHAR(10)
		)
GO
--SI YA EXISTE LA TABLA ELIMINAR TODOS LOS DATOS
TRUNCATE TABLE dbo.starbucks;
GO
--importar datos desde un archivo
BULK INSERT dbo.starbucks
FROM 'C:\Users\ipacompia\Documents\proyecto_parcial\dataset\STARBUCKS.CSV'
WITH
(
	FIRSTROW=2,				--INICIA DE LA SEGUNDA FILA YA QUE LA PRIMERA ES ENCABEZADO
	FIELDTERMINATOR=',',	--EL SEPARADOR DE COLUMNAS ES LA COMA
	ROWTERMINATOR='0x0a'		--SEPARADOR DE FILAS ES EL SALTO DE LINEA
)
GO
