-- 6 Trovare il totale del bilancio dei progetti in cui ci sono impiegati che lavorano a Milano
SELECT SUM(Progetto.bilancio) AS 'Totale bilancio di progetti di Milano'
FROM Impiegato, Dipartimento, Progetto, Partecipazione
WHERE Partecipazione.impiegato = Impiegato.matricola
	AND Partecipazione.sigla_progetto = Progetto.sigla
    AND Impiegato.codice_dipartimento = Dipartimento.codice
    AND Dipartimento.sede = 'Milano';
    
-- 7 Trovare i nomi dei progetti con bilancio maggiore di 10000 e i cognomi degli impiegati che lavorano su di essi.
SELECT Progetto.Nome, Impiegato.cognome
FROM Partecipazione, Impiegato, Progetto
WHERE Partecipazione.impiegato = Impiegato.matricola
	AND Partecipazione.sigla_progetto = Progetto.sigla
    AND Progetto.bilancio > 10000;

-- 8 Trovare cognome degli impiegati che guadagnano più del loro direttore di dipartimento
SELECT i1.cognome
FROM Impiegato AS i1, Impiegato AS i2, Dipartimento
WHERE i1.codice_dipartimento = Dipartimento.codice
	AND i2.codice_dipartimento = Dipartimento.codice
    AND i2.matricola = Dipartimento.matricola_direttore
    AND i1.matricola <> i2.matricola
    AND i1.stipendio > i2.stipendio;
    
-- 9 Trovare nomi dei dipartimenti in cui lavorano impiegati che guadagnano più di 60000.
SELECT Dipartimento.Nome
FROM Impiegato, Dipartimento
WHERE Impiegato.codice_dipartimento = Dipartimento.codice
AND Impiegato.stipendio > 60000;

-- 10 Matricola degli impiegati che hanno partecipato almeno ad un progetto in cui il responsabile è un impiegato del loro stesso dipartimento
SELECT impiegato.matricola
FROM Impiegato, Progetto, Partecipazione, Impiegato AS Responsabile
WHERE Partecipazione.impiegato = Impiegato.matricola
	AND Partecipazione.sigla_progetto = Progetto.sigla
    AND Responsabile.matricola = Progetto.matricola_responsabile
    AND Impiegato.matricola <> Responsabile.matricola
    AND impiegato.codice_dipartimento = Responsabile.codice_dipartimento;

-- 11 La quantità dei progetti con responsabili che lavorano in una città a scelta (es. Milano)
SELECT COUNT(Progetto.sigla) AS 'quantità dei progetti con responsabili che lavorano a Napoli'
FROM Progetto, Impiegato, Dipartimento
WHERE Progetto.matricola_responsabile = Impiegato.matricola
	AND Impiegato.codice_dipartimento = Dipartimento.codice
    AND dipartimento.sede = 'Napoli';
