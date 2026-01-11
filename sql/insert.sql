

-- UTENTI (5 utenti)

INSERT INTO UTENTE (
    username,
    email,
    password,
    nome,
    cognome,
    data_registrazione,
    tipo_utente,
    is_amministratore
)
VALUES
('mrossi', 'mario.rossi@mail.it', 'pwd1', 'Mario', 'Rossi', CURRENT_DATE, 'BASE', false),
('lbianchi', 'luigi.bianchi@mail.it', 'pwd2', 'Luigi', 'Bianchi', CURRENT_DATE, 'BASE', false),
('stoscano', 'sara.toscano@mail.it', 'pwd3', 'Sara', 'Toscano', CURRENT_DATE, 'BASE', false),
('nfrassica', 'nino.frassica@mail.it', 'pwd4', 'Nino', 'Frassica', CURRENT_DATE, 'BASE', false),
('czalone', 'checco.zalone@mail.it', 'pwd5', 'Checco', 'Zalone', CURRENT_DATE, 'BASE', false);


-- POST (5 post: 3 TESTO, 2 FOTO)

-- Post TESTO

INSERT INTO POST (
    id_utente,
    data_creazione,
    stato_moderazione,
    tipo_post,
    contenuto
)
VALUES
(1, CURRENT_TIMESTAMP, 'APPROVATO', 'TESTO', 'ciao, prova prova'),
(2, CURRENT_TIMESTAMP, 'APPROVATO', 'TESTO', 'prova secondo post'),
(3, CURRENT_TIMESTAMP, 'APPROVATO', 'TESTO', 'prova terzo post');

-- Post FOTO

INSERT INTO POST (
    id_utente,
    data_creazione,
    stato_moderazione,
    tipo_post,
    immagine
)
VALUES
(4, CURRENT_TIMESTAMP, 'APPROVATO', 'FOTO', 'resources/foto_nino.jpg'),
(5, CURRENT_TIMESTAMP, 'APPROVATO', 'FOTO', 'resources/foto_checco.jpg');




-- SEGUE (followers / followed)

INSERT INTO SEGUE (
    id_follower,
    id_followed,
    data_inizio
)
VALUES
(1, 2, CURRENT_DATE),  -- Mario segue Luigi
(1, 3, CURRENT_DATE),  -- Mario segue Sara
(2, 3, CURRENT_DATE),  -- Luigi segue Sara
(3, 1, CURRENT_DATE),  -- Sara segue Mario
(4, 5, CURRENT_DATE);  -- Nino segue Checco



-- LIKES

INSERT INTO LIKES (
    id_utente,
    id_post,
    data
)
VALUES
(1, 1, CURRENT_DATE),  -- Mario like al proprio post
(2, 1, CURRENT_DATE),  -- Luigi like al post di Mario
(3, 4, CURRENT_DATE),  -- Sara like alla foto di Nino
(5, 2, CURRENT_DATE);  -- Checco like al post di Luigi


-- SEGNALAZIONE (1 segnalazione)

INSERT INTO SEGNALAZIONE (
    id_utente,
    id_post,
    data,
    ora
)
VALUES
(2, 3, CURRENT_DATE, CURRENT_TIME); -- Luigi segnala il post di Sara
