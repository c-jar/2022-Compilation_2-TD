PROGRAM Addition;
VAR
	Somme : INTEGER
	Nombre1,
	Nombre2 : INTEGER;

BEGIN

	Write ('Premier nombre ? : ');
	ReadLn (Nombre1); { Lecture 1er nombre }

	Write ('Deuxieme nombre ? : ');
	ReadLn (Nombre2); { Lecture 2eme nombre }

	Somme := Nombre1 + Nombre2;
	WriteLn ('La somme vaut: ', Somme);

END.
