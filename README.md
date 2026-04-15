# Sistem Expert pentru Recomandări Culinare

Acest proiect este un sistem expert dezvoltat în Prolog, menit să te ajute să decizi ce să gătești folosind ingredientele pe care le ai deja la dispoziție. Sistemul analizează stocul tău și îți recomandă rețete, prioritizându-le pe cele care necesită cele mai puține cumpărături suplimentare.

**Ce știe să facă aplicația:**
* **Recomandare optimizată:** Îți oferă rețete pe baza ingredientelor tale, sortate după eficiență (cele cu 0 lipsuri sunt primele).
* **Filtrare detaliată:** Permite căutarea rețetelor în funcție de timp, dificultate, categorie (ex: cină) sau dietă (ex: vegan).
* **Excluderea alergenilor:** Elimină automat rețetele care conțin ingrediente nedorite (ex: meniu fără carne sau lactoză).

---

## Cum se utilizează (Online, direct în browser)

Proiectul este conceput pentru a fi rulat interactiv folosind platforma SWISH, **fără a necesita instalarea vreunui program pe calculator**.

**Pași de rulare:**
1. Accesează [SWISH Prolog](https://swish.swi-prolog.org/) și creează un document nou din meniul de sus: `File > New > Notebook`.
2. Adaugă o celulă de tip **Program** (apăsând butonul `+ Program`) și copiază acolo tot codul sursă din fișierul `proiect_prolog.pl`.
3. Adaugă o celulă de tip **Query** (apăsând butonul `+ Query`) pentru a introduce comenzile de căutare.
4. Apasă butonul albastru de rulare (**Play**) de lângă celula Query. 
5. Pentru a cere sistemului următoarea recomandare disponibilă (backtracking), apasă pur și simplu pe butonul **"Next"**.

**Exemple de comenzi pe care le poți testa în secțiunea Query:**
* Căutare simplă: 
  `recomanda_reteta([oua, sare, unt], Reteta).`
* Excluderea ingredientelor nedorite (ex. fără carne): 
  `recomanda_fara_ingrediente([paste, rosii, usturoi], [pui, vita, porc, somon]).`
