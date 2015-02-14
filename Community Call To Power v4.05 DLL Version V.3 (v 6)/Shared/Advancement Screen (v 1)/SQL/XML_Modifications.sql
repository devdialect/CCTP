-- Create table for the Policy Branch Classes
CREATE TABLE PolicyBranchClassTypes(
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	Type TEXT NOT NULL UNIQUE,
	Description TEXT,
	Civilopedia TEXT,
	Strategy TEXT, 
	Help TEXT,
	Style TEXT,
	TenetMaxLevel INT,
	FOREIGN KEY (Description) REFERENCES Language_en_US(Tag),
	FOREIGN KEY (Civilopedia) REFERENCES Language_en_US(Tag),
	FOREIGN KEY (Strategy) REFERENCES Language_en_US(Tag),
	FOREIGN KEY (Help) REFERENCES Language_en_US(Tag)
);

-- Add a PolicyBranchClass tag to the Policy Branch table
ALTER TABLE PolicyBranchTypes ADD COLUMN PolicyBranchClass TEXT;
ALTER TABLE PolicyBranchTypes ADD COLUMN PolicyBranchImage TEXT;
