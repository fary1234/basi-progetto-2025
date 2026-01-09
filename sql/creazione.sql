


-- TABELLA UTENTE
CREATE TABLE UTENTE (
    id_utente SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    immagine_profilo VARCHAR(255),
    data_registrazione DATE NOT NULL,
    data_nascita DATE,
    nome VARCHAR(50),
    cognome VARCHAR(50),
    data_nomina DATE,
    is_amministratore BOOLEAN,
    tipo_utente VARCHAR(20) NOT NULL
);


-- TABELLA POST
CREATE TABLE POST (
    id_post SERIAL PRIMARY KEY,
    id_utente INTEGER NOT NULL,
    data_creazione TIMESTAMP NOT NULL,
    stato_moderazione VARCHAR(20) NOT NULL,
    tipo_post VARCHAR(10) NOT NULL,
    contenuto TEXT,
    immagine VARCHAR(255),

    CONSTRAINT fk_post_utente
        FOREIGN KEY (id_utente)
        REFERENCES UTENTE(id_utente)
        ON DELETE CASCADE,

    CONSTRAINT chk_tipo_post
        CHECK (tipo_post IN ('TESTO', 'FOTO')),

    CONSTRAINT chk_contenuto_immagine
        CHECK (
            (tipo_post = 'TESTO' AND contenuto IS NOT NULL AND immagine IS NULL) OR
            (tipo_post = 'FOTO' AND immagine IS NOT NULL AND contenuto IS NULL)
        )
);


-- TABELLA SEGUE

CREATE TABLE SEGUE (
    id_follower INTEGER NOT NULL,
    id_followed INTEGER NOT NULL,
    data_inizio DATE NOT NULL,
    data_fine DATE,

    PRIMARY KEY (id_follower, id_followed),

    CONSTRAINT fk_segue_follower
        FOREIGN KEY (id_follower)
        REFERENCES UTENTE(id_utente)
        ON DELETE CASCADE,

    CONSTRAINT fk_segue_followed
        FOREIGN KEY (id_followed)
        REFERENCES UTENTE(id_utente)
        ON DELETE CASCADE,

    CONSTRAINT chk_no_self_follow
        CHECK (id_follower <> id_followed)
);



-- TABELLA LIKE

CREATE TABLE LIKE (
    id_utente INTEGER NOT NULL,
    id_post INTEGER NOT NULL,
    data DATE NOT NULL,

    PRIMARY KEY (id_utente, id_post),

    CONSTRAINT fk_like_utente
        FOREIGN KEY (id_utente)
        REFERENCES UTENTE(id_utente)
        ON DELETE CASCADE,

    CONSTRAINT fk_like_post
        FOREIGN KEY (id_post)
        REFERENCES POST(id_post)
        ON DELETE CASCADE
);



-- TABELLA SEGNALAZIONE
CREATE TABLE SEGNALAZIONE (
    id_utente INTEGER NOT NULL,
    id_post INTEGER NOT NULL,
    data DATE NOT NULL,
    ora TIME NOT NULL,

    PRIMARY KEY (id_utente, id_post),

    CONSTRAINT fk_segnalazione_utente
        FOREIGN KEY (id_utente)
        REFERENCES UTENTE(id_utente)
        ON DELETE CASCADE,

    CONSTRAINT fk_segnalazione_post
        FOREIGN KEY (id_post)
        REFERENCES POST(id_post)
        ON DELETE CASCADE
);
