# Sistem Expert pentru Recomandări Culinare

**Echipa de proiect:**
* Moroșanu Răzvan
* Neculcea Sabin
* Panainte Bogdan
* Pricop Andrei

**Link GitHub:** [Sistem Expert - Recomandare Rețetă Culinară](https://github.com/mororazvan04/Sistem-Expert---Recomandare-Reteta-Culinara)

---

Scopul principal al aplicației este de a asista utilizatorii în selectarea optimă a rețetelor culinare, pornind strict de la ingredientele disponibile în propriul stoc. 

Proiectul abordează o problemă reală (reducerea risipei alimentare și eficientizarea resurselor) printr-o abordare pur declarativă, demonstrând utilitatea programării logice în problemele de tip *matching* și optimizare.

---

## 1. Arhitectura și Modelarea Datelor

Spre deosebire de limbajele procedurale, în Prolog am modelat problema definind universul de cunoștințe (faptele) și regulile de deducție. Baza de cunoștințe a fost decuplată de logica de căutare pentru a permite o scalabilitate ușoară.

### 1.1 Reprezentarea Cunoștințelor
* **Vocabularul sistemului:** Am declarat 35 de ingrediente de bază ca entități atomice (ex: `ingredient(rosii).`).
* **Structura rețetelor:** Am definit 15 preparate. Decizia arhitecturală cheie a fost modelarea ingredientelor necesare sub formă de **liste** (`[oua, faina, lapte]`). Această abordare ne-a permis să folosim funcții native de manipulare a listelor în motorul de inferență.
* **Metadate:** Pentru a permite căutări granulare, fiecare rețetă a fost adnotată cu fapte suplimentare care descriu: categoria mesei, timpul de execuție, nivelul de dificultate și restricțiile dietetice.

### 1.2 Motorul de Inferență (Logica Decizională)
Sistemul nu doar caută o potrivire, ci **optimizează** rezultatul. Pentru a face acest lucru, combină trei mecanisme fundamentale din Prolog:

1. **Teoria Mulțimilor (`subtract/3` și `intersection/3`):** Pentru a afla ce ne lipsește, sistemul tratează rețeta și frigiderul ca pe două mulțimi. Scădem stocul disponibil din necesarul rețetei, iar lungimea listei rezultate ne dă „costul” preparatului (numărul de ingrediente lipsă).
2. **Agregarea și Sortarea Euristică (`findall` + `keysort`):** Sistemul generează toate stările valide posibile (toate rețetele), le asociază cu numărul de elemente lipsă (creând o pereche de tip `Cost-Reteta`) și le ordonează. Astfel, ne asigurăm că prima recomandare oferită este întotdeauna cea mai eficientă.
3. **Explorarea prin Backtracking:** Odată ce lista este sortată, predicatul `member/2` este folosit pentru a extrage succesiv soluțiile. Dacă utilizatorul respinge prima sugestie, backtracking-ul natural al Prolog-ului va relua execuția și va oferi imediat următoarea rețetă din clasament.

---

## 2. Funcționalități și Interfețe de Interogare

Sistemul pune la dispoziție trei predicate principale de interacțiune:

1. **Căutarea Optimizată (`recomanda_reteta/2`):**
   * *Scop:* Oferă cel mai bun rezultat bazat exclusiv pe stocul disponibil.
   * *Mecanism:* Ordonează descrescător eficiența; rețetele cu 0 lipsuri sunt afișate primele.

2. **Filtrarea Conjunctivă (`recomanda_reteta_cu_preferinte/5`):**
   * *Scop:* Permite aplicarea de filtre multiple (Timp, Dificultate, Regim, Categorie).
   * *Mecanism:* Acționează ca un set de porți logice (ȘI). Dacă utilizatorul folosește parametrul `oricare`, evaluarea acelei condiții este considerată automat adevărată, oferind flexibilitate totală (nu ești obligat să completezi toate filtrele).

3. **Protecția prin Excludere (`recomanda_fara_ingrediente/2`):**
   * *Scop:* Elimină din căutare rețetele care conțin alergeni sau ingrediente pe care utilizatorul nu dorește să le consume.
   * *Mecanism:* Validează o rețetă doar dacă intersecția dintre lista ei de ingrediente și lista de ingrediente nedorite este mulțimea vidă (`[]`).

---

## 3. Ghid de Utilizare (Platforma SWISH)

Aplicația poate fi testată interactiv, direct în browser, fără instalare.

1. Accesați [swish.swi-prolog.org](https://swish.swi-prolog.org/) și creați un Notebook nou (`File > New > Notebook`).
2. Adăugați o celulă de tip **Markdown** pentru a insera această documentație.
3. Adăugați o celulă de tip **Program** și inserați codul sursă de mai jos.
4. Adăugați celule de tip **Query** pentru a rula testele dorite. Apăsați butonul de **Play** pentru execuție și butonul **Next** pentru a cere sistemului următoarea recomandare disponibilă.

---

## 4. Validare și Scenarii de Testare

Sistemul a fost validat prin scenarii de testare ce acoperă cazuri ideale, cazuri cu filtre multiple și cazuri limită (fără soluții disponibile). Log-ul detaliat al acestor teste se regăsește în directorul `/teste`.

Exemplu de interogare pentru excluderea alergenilor:
`?- recomanda_fara_ingrediente([paste, rosii, usturoi], [pui, vita, porc, somon]).`

---

## 5. Limitări și Direcții Viitoare de Dezvoltare

Deși sistemul își îndeplinește obiectivele curente, există câteva direcții de extindere viitoare:
1. **Cantitățile ingredientelor:** În versiunea curentă, sistemul validează doar prezența logică a unui ingredient. O dezvoltare viitoare va include cantități (ex: `ingredient(lapte, 500, ml)`), complexificând calculele de deducție.
2. **Profiluri de utilizator persistente:** Crearea unor fapte dinamice care să memoreze preferințele unui anumit utilizator între sesiuni, eliminând necesitatea de a introduce alergenii la fiecare interogare.

---
