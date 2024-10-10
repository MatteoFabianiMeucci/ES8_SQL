-- 6
SELECT SUM(Progetto.bilancio) AS 'Totale bilancio di progetti di Milano'
FROM Impiegato, Dipartimento, Progetto, Partecipazione
WHERE Partecipazione.impiegato = Impiegato.matricola
	AND Partecipazione.sigla_progetto = Progetto.sigla
    AND Impiegato.codice_dipartimento = Dipartimento.codice
    AND Dipartimento.sede = 'Milano';
    
-- 7
SELECT Progetto.Nome, Impiegato.cognome
FROM Partecipazione, Impiegato, Progetto
WHERE Partecipazione.impiegato = Impiegato.matricola
	AND Partecipazione.sigla_progetto = Progetto.sigla
    AND Progetto.bilancio > 10000
/*
Impiegato      (matricola, cognome, nome, stipendio, codice_dipartimento (FK))
Dipartimento   (codice, nome, sede, matricola_direttore (FK))
Progetto       (sigla, nome, bilancio, matricola_responsabile (FK)) 
Partecipazione (impiegato (FK), sigla_progetto (FK))

6.    Trovare il totale del bilancio dei progetti in cui ci sono impiegati che lavorano a Milano
7.   Trovare i nomi dei progetti con bilancio maggiore di 10000 e i cognomi degli impiegati che lavorano su di essi.  
8.   Trovare cognome degli impiegati che guadagnano più del loro direttore di dipartimento.  
9.   Trovare nomi dei dipartimenti in cui lavorano impiegati che guadagnano più di 60000.
10. Matricola degli impiegati che hanno partecipato almeno ad un progetto in cui il responsabile è un impiegato del loro stesso dipartimento 
11. La quantità dei progetti con responsabili che lavorano in una città a scelta (es. Milano)
*/