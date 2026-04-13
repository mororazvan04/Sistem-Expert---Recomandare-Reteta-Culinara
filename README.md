# Sistem Expert pentru Recomandări Culinare
**Proiect Inteligență Artificială - Tema 7**

Acest proiect implementează un sistem expert bazat pe reguli în limbajul Prolog, destinat optimizării procesului de selecție a rețetelor culinare în funcție de resursele disponibile. Sistemul evaluează un inventar de ingrediente și oferă soluții personalizate, prioritizând rețetele care necesită cele mai puține achiziții suplimentare.

---

## 1. Arhitectura și Modelarea Datelor

Aplicația este structurată pentru a separa baza de fapte de logica de inferență, asigurând o mentenanță ușoară și posibilitatea de extindere a bazei de date.

### 1.1 Baza de Cunoștințe
Faptele sunt organizate ierarhic pentru a acoperi toate dimensiunile unui preparat culinar:
* **Ingrediente:** 35 de entități atomice care definesc vocabularul sistemului.
* **Rețete:** 15 structuri complexe ce asociază un identificator de preparat cu o listă de necesități.
* **Atribute (Metadate):** Fiecare rețetă este mapată către categorii (mic dejun, prânz, cină, desert), timp de execuție, nivel de dificultate și restricții dietetice (vegan, vegetarian).

### 1.2 Logica de Inferență
Sistemul utilizează mecanisme avansate de programare logică pentru procesarea cererilor:
* **Diferența de Mulțimi:** Utilizată pentru a identifica disparitatea dintre necesarul unei rețete și stocul utilizatorului.
* **Agregarea Soluțiilor:** Predicatul `findall/3` colectează toate rețetele valide pentru a permite compararea acestora.
* **Ordonarea prin Tehnica Key-Sort:** Soluțiile sunt sortate după criteriul eficienței (numărul minim de ingrediente lipsă), oferind utilizatorului cea mai accesibilă cale către finalizarea unui preparat.

---

## 2. Funcționalități Implementate

Sistemul permite interogări complexe prin intermediul următoarelor predicate:

1.  **Recomandare Optimizată (`recomanda_reteta/2`):** Identifică și ierarhizează rețetele pe baza stocului actual.
2.  **Filtrare Multicriterială (`recomanda_reteta_cu_preferinte/5`):** Permite utilizatorului să impună constrângeri de timp, dificultate și regim alimentar. Parametrul `oricare` oferă flexibilitate totală în căutare.
3.  **Gestionarea Restricțiilor Negative (`recomanda_fara_ingrediente/2`):** Esențial pentru utilizatorii cu alergii sau preferințe stricte de excludere (ex: meniu fără carne sau fără lactoză).

---

## 3. Exemple de Validare (Teste)

Sistemul a fost validat prin scenarii de testare ce acoperă cazuri ideale, cazuri cu filtre multiple și cazuri limită (fără soluții disponibile). Log-ul detaliat al acestor teste se regăsește în directorul `/teste`.

Exemplu de interogare pentru excluderea alergenilor:
`?- recomanda_fara_ingrediente([paste, rosii], [carne, oua]).`

---

## 4. Structura Repository-ului
* `/cod` - Fișierul sursă principal (`prima_parte.pl`).
* `/doc` - Manualul tehnic și detaliile arhitecturale.
* `/teste` - Raportul de testare (`teste_rezolvate.txt`) și capturi de ecran din consolă.
