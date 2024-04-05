-- Jenkins ejecuta el sql
-- En que servidor? -> localhost
USE Kaggle;
GO
-- En caso no exista la tabla starbucks, la voy a crear

IF NOT EXISTS (SELECT * FROM SYS.tables WHERE object_id = OBJECT_ID(N'dbo.starbucks') AND type='U')
	CREATE TABLE dbo.starbucks (
		Beverage_category VARCHAR(200),
		Beverage VARCHAR(200),
		Beverage_prep VARCHAR(200),
		Calories INT,
		Total_Fat_g VARCHAR(10),
		Trans_Fat_g DECIMAL,
		Saturated_Fat_g DECIMAL,
		Sodium_mg DECIMAL,
		Total_Carbohydrates_g INT,
		Cholesterol_mg INT,
		Dietary_Fibre_g INT,
		Sugars_g INT,
		Protein_g DECIMAL,
		Vitamin_A_DV VARCHAR(10),
		Vitamin_C_DV VARCHAR(10),
		Calcium_DV VARCHAR(10),
		Iron_DV VARCHAR(10),
		Caffeine_mg VARCHAR(10)
	)

-- Si la tabla ya existe starbucks, la voy a limpiar
Truncate table dbo.starbucks;
GO

--Importar la data de mi archivo CSV starbucks
BULK INSERT dbo.starbucks
FROM 'C:\Users\tommy\Documents\Cursos\Data Analytics\DataOps\proyecto_parcial\dataset\starbucks.csv' --UBICACIÓN DE MI ARCHIVO
WITH
(
	FIRSTROW = 2, --Empieza a insertar data desde la fila 2, porque la 1era fila es la cabecera del archivo
	FIELDTERMINATOR = ',', --Delimitador de las columnas
	ROWTERMINATOR = '0x0a' --Delimitador de las filas, salto de linea
)