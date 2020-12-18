
--LV 0
CREATE TABLE staff(
		PRIMARY KEY(employee_id),
		employee_id			INT					IDENTITY(1,1),
		first_name			VARCHAR(32)			NOT NULL,
		surname				VARCHAR(32)			NOT NULL,
		phone_number		VARCHAR(15),
		[role]				VARCHAR(32)			NOT NULL,
		hired				DATE				NOT NULL,
		resigned			DATE
);


CREATE TABLE dig_sites(
		PRIMARY KEY(dig_number),
		dig_number			INT					IDENTITY(1,1),
		[name]				VARCHAR(32)			NOT NULL,		
		[description]		VARCHAR(100)		NOT NULL,
		x_cord				DECIMAL(10,2)		NOT NULL,
		y_cord				DECIMAL(10,2)		NOT NULL,
		[location]			VARCHAR(32)			NOT NULL
);

CREATE TABLE authors(
		PRIMARY KEY(author_id),
		author_id			INT					IDENTITY(1,1),
		first_name			VARCHAR(32)			NOT NULL,
		surname				VARCHAR(32)			NOT NULL
);

CREATE TABLE kind(
		PRIMARY KEY(id),
		id					INT					IDENTITY(1,1),
		kind_id				VARCHAR(32)			NOT NULL, -- books, journals or papers
		genre				VARCHAR(32),		
);
--LV 1
CREATE TABLE litterature(
		PRIMARY KEY(litterature_id),
		litterature_id		INT					IDENTITY(1,1),
		employee_id			INT,				--LV 0
		[location]			VARCHAR(32)			NOT NULL,
		title				VARCHAR(32)			NOT NULL,
		isbn				VARCHAR(13)	
);

--LV 2
CREATE TABLE artifacts(
		PRIMARY KEY(artifact_number),
		artifact_number		INT					IDENTITY(1,1),
		employee_id			INT,				--LV 0					
		dig_number			INT,				--LV 1			
		depth				INT					NOT NULL,	
		shelf_number		INT,
		[finding_date]		DATE				NOT NULL,
		x_cord				DECIMAL(10,2)		NOT NULL,
		y_cord				DECIMAL(10,2)		NOT NULL,
		[finding_location]	VARCHAR(32)			NOT NULL,
		[description]		VARCHAR(100),
);

CREATE TABLE slides(
		PRIMARY KEY(slide_number),
		slide_number		INT					IDENTITY(1,1),
		artifact_number		INT,				--LV 0
		dig_number			INT,				--LV 1
		[index]				VARCHAR(32)			NOT NULL,	--tema
		dig_name			VARCHAR(32)			NOT NULL,
		[description]		VARCHAR(100)		NOT NULL,
);

CREATE TABLE list_of_authors(
		PRIMARY KEY(litterature_id, author_id),
		litterature_id		INT,				--LV 0
		author_id			INT,				--LV 1
);

CREATE TABLE handeled_by(
		PRIMARY KEY(artifact_number, employee_id),
		employee_id			INT,				--LV 0
		artifact_number		INT,				--LV 1
	
);


CREATE TABLE dig_projects(
		PRIMARY KEY(dig_number, employee_id),
		employee_id			INT,				--LV 0
		dig_number			INT,				--LV 1
		
);

CREATE TABLE borrows(
		PRIMARY KEY(litterature_id, employee_id),
		employee_id			INT,				--LV 0	
		litterature_id		INT,				--LV 1

);

