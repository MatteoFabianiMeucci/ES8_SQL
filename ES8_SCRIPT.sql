CREATE DATABASE azienda;
USE azienda;

#creazione delle tabelle
CREATE TABLE impiegato(
	matricola INT PRIMARY KEY NOT NULL,
    cognome VARCHAR(64) NOT NULL,
    stipendio INT NOT NULL,
    codice_dipartimento VARCHAR(8) NOT NULL
    
    #FOREIGN KEY (codice_dipartimento) REFERENCES dipartimento(codice)
);

CREATE TABLE dipartimento(
	codice VARCHAR(8) PRIMARY KEY NOT NULL,
    nome VARCHAR(16) NOT NULL,
    sede VARCHAR(64) NOT NULL,
    matricola_direttore INT NOT NULL
    
    #FOREIGN KEY (matricola_direttore) REFERENCES impiegato(matricola)
);

CREATE TABLE progetto(
	sigla VARCHAR(32) PRIMARY KEY NOT NULL,
    nome VARCHAR(128) NOT NULL,
    bilancio INT NOT NULL,
    matricola_responsabile INT NOT NULL
    
    #FOREIGN KEY (matricola_responsabile) REFERENCES impiegato(matricola)
);

CREATE TABLE partecipazione(
	impiegato INT NOT NULL,
    sigla_progetto VARCHAR(32) NOT NULL,
    
    PRIMARY KEY(impiegato, sigla_progetto)
    
    #FOREIGN KEY (impiegato) REFERENCES impiegato(matricola),
    #FOREIGN KEY (sigla_progetto) REFERENCES progetto(sigla)
);

#inserimento valori
INSERT INTO impiegato
	VALUES(101, 'Sili', 60000, 'NO');
INSERT INTO impiegato
	VALUES(102, 'Rossi', 40000, 'NO');
INSERT INTO impiegato
	VALUES(103, 'Neri', 40000, 'NO');
INSERT INTO impiegato
	VALUES(201, 'Neri', 40000, 'SU');
INSERT INTO impiegato
	VALUES(202, 'Verdi', 50000, 'SU');
INSERT INTO impiegato
	VALUES(301, 'Bisi', 70000, 'IS');

INSERT INTO dipartimento
	VALUES('NO', 'Nord', 'Milano', 101);
INSERT INTO dipartimento
	VALUES('SU', 'Sud', 'Napoli', 201);
INSERT INTO dipartimento
	VALUES('IS', 'Isole', 'Palermo', 301);

INSERT INTO progetto
	VALUES('Alpha', 'Vendite', 30000, 202);
INSERT INTO progetto
	VALUES('Beta', 'Inventario', 50000, 301);
INSERT INTO progetto
	VALUES('Gamma', 'Distribuzione', 18000, 301);
    
INSERT INTO partecipazione VALUES(101, 'Alpha');
INSERT INTO partecipazione VALUES(101, 'Beta');
INSERT INTO partecipazione VALUES(103, 'Alpha');
INSERT INTO partecipazione VALUES(103, 'Beta');
INSERT INTO partecipazione VALUES(201, 'Beta');
INSERT INTO partecipazione VALUES(202, 'Beta');

-- Inserimento di nuovi impiegati
INSERT INTO impiegato VALUES(104, 'Bianchi', 65000, 'NO');
INSERT INTO impiegato VALUES(105, 'Gialli', 55000, 'SU');
INSERT INTO impiegato VALUES(106, 'Rossi', 45000, 'IS');
INSERT INTO impiegato VALUES(107, 'Verdi', 70000, 'SU');

-- Inserimento di nuovi progetti
INSERT INTO progetto VALUES('Delta', 'Marketing', 120, 202);
INSERT INTO progetto VALUES('Epsilon', 'Ricerca', 90, 301);
INSERT INTO progetto VALUES('Zeta', 'Sviluppo', 200, 202);

-- Inserimento di partecipazioni a progetti
INSERT INTO partecipazione VALUES(104, 'Delta');
INSERT INTO partecipazione VALUES(105, 'Delta');
INSERT INTO partecipazione VALUES(106, 'Epsilon');
INSERT INTO partecipazione VALUES(107, 'Zeta');
INSERT INTO partecipazione VALUES(101, 'Zeta');