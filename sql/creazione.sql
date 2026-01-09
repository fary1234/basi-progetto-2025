-- 1. Tabella UTENTE 
CREATE TABLE UTENTE (
    id_utente INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    immagine_profilo VARCHAR(255), -- NULL
    data_registrazione DATE NOT NULL,
    data_nascita DATE, -- NULL
    nome VARCHAR(50), -- NULL
    cognome VARCHAR(50), -- NULL
    data_nomina DATE, -- NULL (solo per moderatori)
    is_amministratore BOOLEAN, -- NULL (solo per moderatori)
    tipo_utente VARCHAR(20) NOT NULL -- 'BASE' o 'MODERATORE'
);

-- 2. Tabella POST 
CREATE TABLE POST (
    id_post INT PRIMARY KEY,
    id_utente INT NOT NULL,
    data_creazione TIMESTAMP NOT NULL,
    stato_moderazione VARCHAR(20) NOT NULL,
    tipo_post VARCHAR(10) NOT NULL, -- 'TESTO' o 'FOTO'
    testo TEXT, -- NULL (se tipo_post = 'FOTO')
    immagine VARCHAR(255), -- NULL (se tipo_post = 'TESTO')
    FOREIGN KEY (id_utente) REFERENCES UTENTE(id_utente)
);

-- 3. Tabella SEGUE (Relazione Ricorsiva)
CREATE TABLE SEGUE (
    id_follower INT,
    id_followed INT,
    data_inizio DATE NOT NULL,
    data_fine DATE, -- NULL
    PRIMARY KEY (id_follower, id_followed),
    FOREIGN KEY (id_follower) REFERENCES UTENTE(id_utente),
    FOREIGN KEY (id_followed) REFERENCES UTENTE(id_utente),
    -- Vincolo: un utente non può seguire sé stesso
    CHECK (id_follower <> id_followed)
);

-- 4. Tabella LIKE
CREATE TABLE `LIKE` (
    id_utente INT,
    id_post INT,
    data DATE NOT NULL,
    PRIMARY KEY (id_utente, id_post),
    FOREIGN KEY (id_utente) REFERENCES UTENTE(id_utente),
    FOREIGN KEY (id_post) REFERENCES POST(id_post)
);

-- 5. Tabella SEGNALAZIONE
CREATE TABLE SEGNALAZIONE (
    id_utente INT,
    id_post INT,
    data DATE NOT NULL,
    ora TIME NOT NULL,
    PRIMARY KEY (id_utente, id_post),
    FOREIGN KEY (id_utente) REFERENCES UTENTE(id_utente),
    FOREIGN KEY (id_post) REFERENCES POST(id_post)
);