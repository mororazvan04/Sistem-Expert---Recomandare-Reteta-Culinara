% SISTEM EXPERT CULINAR
% Autor: Morosanu Razvan (Membrul 1)
% Descriere: Definește ingredientele disponibile, rețetele și atributele lor.

% 1. INGREDIENTE DISPONIBILE 
ingredient(rosii). ingredient(castraveti). ingredient(ceapa). 
ingredient(usturoi). ingredient(ardei). ingredient(cartofi). 
ingredient(morcovi). ingredient(ciuperci). ingredient(salata). 
ingredient(spanac). ingredient(mere). ingredient(lamai). 
ingredient(pui). ingredient(vita). ingredient(porc). 
ingredient(somon). ingredient(bacon). ingredient(oua). 
ingredient(lapte). ingredient(branza_feta). ingredient(cascaval). 
ingredient(parmezan). ingredient(unt). ingredient(smantana). 
ingredient(paste). ingredient(orez). ingredient(faina). 
ingredient(zahar). ingredient(sare). ingredient(piper). 
ingredient(ulei_masline). ingredient(otet). ingredient(paine). 
ingredient(pesmet).

% 2. REȚETE ȘI INGREDIENTE NECESARE 
% Format: reteta(Nume, ListaIngrediente)
reteta(omleta_simpla, [oua, sare, piper, unt]).
reteta(omleta_cu_branza, [oua, cascaval, unt, sare]).
reteta(salata_greceasca, [rosii, castraveti, ceapa, branza_feta, ulei_masline, sare]).
reteta(salata_de_vara, [rosii, castraveti, ardei, ulei_masline, otet]).
reteta(paste_carbonara, [paste, bacon, oua, parmezan, piper]).
reteta(paste_cu_sos_rosii, [paste, rosii, usturoi, ulei_masline, sare]).
reteta(pui_la_cuptor, [pui, cartofi, usturoi, ulei_masline, sare, piper]).
reteta(pui_cu_ciuperci, [pui, ciuperci, smantana, usturoi, unt]).
reteta(friptura_de_vita, [vita, unt, usturoi, sare, piper]).
reteta(somon_la_gratar, [somon, lamai, ulei_masline, sare]).
reteta(orez_cu_legume, [orez, morcovi, ceapa, ardei, ulei_masline]).
reteta(cartofi_prajiti, [cartofi, ulei_masline, sare]).
reteta(supa_crema_ciuperci, [ciuperci, ceapa, unt, smantana, sare]).
reteta(snitel_pui, [pui, oua, faina, pesmet, ulei_masline]).
reteta(clatite, [oua, faina, lapte, unt, zahar]).

% 3. CATEGORIA REȚETEI (mic_dejun, pranz, cina, desert)
categorie(omleta_simpla, mic_dejun).
categorie(omleta_cu_branza, mic_dejun).
categorie(salata_greceasca, pranz).
categorie(salata_de_vara, pranz).
categorie(paste_carbonara, pranz).
categorie(pui_cu_ciuperci, pranz).
categorie(orez_cu_legume, pranz).
categorie(cartofi_prajiti, pranz).
categorie(supa_crema_ciuperci, pranz).
categorie(snitel_pui, pranz).
categorie(paste_cu_sos_rosii, cina).
categorie(pui_la_cuptor, cina).
categorie(friptura_de_vita, cina).
categorie(somon_la_gratar, cina).
categorie(clatite, desert).

% 4. TIMP DE PREPARARE (în minute)
timp_preparare(omleta_simpla, 10).
timp_preparare(omleta_cu_branza, 12).
timp_preparare(salata_greceasca, 15).
timp_preparare(salata_de_vara, 10).
timp_preparare(paste_carbonara, 20).
timp_preparare(paste_cu_sos_rosii, 25).
timp_preparare(pui_la_cuptor, 60).
timp_preparare(pui_cu_ciuperci, 30).
timp_preparare(friptura_de_vita, 40).
timp_preparare(somon_la_gratar, 20).
timp_preparare(orez_cu_legume, 30).
timp_preparare(cartofi_prajiti, 25).
timp_preparare(supa_crema_ciuperci, 35).
timp_preparare(snitel_pui, 25).
timp_preparare(clatite, 30).

% 5. DIFICULTATE (usor, mediu, greu)
dificultate(omleta_simpla, usor).
dificultate(omleta_cu_branza, usor).
dificultate(salata_greceasca, usor).
dificultate(salata_de_vara, usor).
dificultate(paste_carbonara, mediu).
dificultate(paste_cu_sos_rosii, usor).
dificultate(pui_la_cuptor, mediu).
dificultate(pui_cu_ciuperci, mediu).
dificultate(friptura_de_vita, greu).
dificultate(somon_la_gratar, mediu).
dificultate(orez_cu_legume, usor).
dificultate(cartofi_prajiti, usor).
dificultate(supa_crema_ciuperci, mediu).
dificultate(snitel_pui, mediu).
dificultate(clatite, mediu).

% 6. RESTRICȚII DIETETICE (vegetarian, vegan, fara_gluten etc.)
restrictie(omleta_simpla, vegetarian).
restrictie(omleta_cu_branza, vegetarian).
restrictie(salata_greceasca, vegetarian).
restrictie(salata_de_vara, vegetarian).
restrictie(salata_de_vara, vegan).
restrictie(paste_cu_sos_rosii, vegetarian).
restrictie(orez_cu_legume, vegetarian).
restrictie(orez_cu_legume, vegan).
restrictie(cartofi_prajiti, vegetarian).
restrictie(cartofi_prajiti, vegan).
restrictie(supa_crema_ciuperci, vegetarian).
restrictie(clatite, vegetarian).


% Autor:Panainte Bogdan Dumitru (Membrul 2)
% Descriere: Logica de recomodare

% Predicat auxiliar: Calculează lista și numărul de ingrediente lipsă.
calculeaza_lipsa(NumeReteta, IngredienteDisponibile, IngredienteLipsa, NumarLipsa) :-
    reteta(NumeReteta, IngredienteNecesare),
    subtract(IngredienteNecesare, IngredienteDisponibile, IngredienteLipsa),
    length(IngredienteLipsa, NumarLipsa).

% Predicat 1: Recomandă rețete prioritizând cele cu cele mai puține lipsuri.
recomanda_reteta(IngredienteDisponibile, RetetaRecomandata) :-
    findall(NrLipsa-Reteta, 
            calculeaza_lipsa(Reteta, IngredienteDisponibile, _, NrLipsa), 
            ListaNeSortata),
    keysort(ListaNeSortata, ListaSortata),
    member(NrLipsa-RetetaRecomandata, ListaSortata),
    calculeaza_lipsa(RetetaRecomandata, IngredienteDisponibile, Lipsa, NrLipsa),
    
    nl, write('--- RECOMANDARE ---'), nl,
    write('Reteta: '), write(RetetaRecomandata), nl,
    write('Iti lipsesc '), write(NrLipsa), write(' ingrediente: '), write(Lipsa), nl.

% Predicat 2: Recomandă rețete aplicând filtre (Categorie, Restricție).
recomanda_reteta_cu_preferinte(IngredienteDisponibile, Categorie, Restrictie) :-
    findall(NrLipsa-Reteta, 
            (
                calculeaza_lipsa(Reteta, IngredienteDisponibile, _, NrLipsa),
                (Categorie == oricare ; categorie(Reteta, Categorie)),
                (Restrictie == oricare ; restrictie(Reteta, Restrictie))
            ), 
            ListaNeSortata),
    keysort(ListaNeSortata, ListaSortata),
    
    ( ListaSortata == [] -> 
        nl, write('Nu am gasit nicio reteta care sa respecte preferintele tale.'), nl
    ; 
        member(Nr-RetetaRecomandata, ListaSortata),
        calculeaza_lipsa(RetetaRecomandata, IngredienteDisponibile, Lipsa, Nr),
        timp_preparare(RetetaRecomandata, Timp),
        dificultate(RetetaRecomandata, Dificultate),
        
        nl, write(' RETETA POTRIVITA '), nl,
        write('Reteta: '), write(RetetaRecomandata), nl,
        write('Timp: '), write(Timp), write(' min | Dificultate: '), write(Dificultate), nl,
        write('Categorie: '), write(Categorie), write(' | Restrictie: '), write(Restrictie), nl,
        write('Ingrediente lipsa: '), write(Lipsa), nl
    ).
