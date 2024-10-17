-- 6 Trovare il totale del bilancio dei progetti in cui ci sono impiegati che lavorano a Milano
SELECT SUM(Progetto.bilancio) AS 'Totale bilancio di progetti di Milano'
FROM impiegato
JOIN dipartimento ON (impiegato.codice_dipartimento = dipartimento.codice)
JOIN partecipazione ON (impiegato.matricola = partecipazione.impiegato)
JOIN progetto ON (progetto.sigla = partecipazione.sigla_progetto)
WHERE dipartimento.sede = 'Milano';

-- 7 Trovare i nomi dei progetti con bilancio maggiore di 10000 e i cognomi degli impiegati che lavorano su di essi.
SELECT Progetto.Nome, Impiegato.cognome
FROM partecipazione
JOIN impiegato ON (partecipazione.impiegato = impiegato.matricola)
JOIN progetto ON (progetto.sigla = partecipazione.sigla_progetto)
WHERE Progetto.bilancio > 10000;

-- 8 Trovare cognome degli impiegati che guadagnano più del loro direttore di dipartimento
SELECT i1.cognome
FROM impiegato AS i1
JOIN dipartimento ON (i1.codice_dipartimento = dipartimento.codice)
JOIN impiegato AS i2 ON (i2.codice_dipartimento = dipartimento.codice)
WHERE i2.matricola = Dipartimento.matricola_direttore
    AND i1.matricola <> i2.matricola
    AND i1.stipendio > i2.stipendio;
    
-- 9 Trovare nomi dei dipartimenti in cui lavorano impiegati che guadagnano più di 60000.
SELECT Dipartimento.Nome
FROM impiegato
JOIN dipartimento ON (impiegato.codice_dipartimento = dipartimento.codice)
AND impiegato.stipendio > 60000;

-- 10 Matricola degli impiegati che hanno partecipato almeno ad un progetto in cui il responsabile è un impiegato del loro stesso dipartimento
SELECT impiegato.matricola
FROM impiegato
JOIN partecipazione ON (impiegato.matricola = partecipazione.impiegato)
JOIN progetto ON (progetto.sigla = partecipazione.sigla_progetto)
JOIN impiegato AS responsabile
WHERE responsabile.matricola = progetto.matricola_responsabile
    AND impiegato.matricola <> responsabile.matricola
    AND impiegato.codice_dipartimento = responsabile.codice_dipartimento;
    
-- 11 La quantità dei progetti con responsabili che lavorano in una città a scelta (es. Milano)
SELECT COUNT(Progetto.sigla) AS 'quantità dei progetti con responsabili che lavorano a Napoli'
FROM impiegato
JOIN dipartimento ON (impiegato.codice_dipartimento = dipartimento.codice)
JOIN progetto
WHERE progetto.matricola_responsabile = impiegato.matricola
    AND dipartimento.sede = 'Napoli';