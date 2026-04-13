# Sistem Expert: Recomandare Rețetă Culinară
**Proiect Prolog - Tema 7**

Acest repository conține implementarea unui sistem expert în Prolog, conceput pentru a rezolva o problemă zilnică: *"Ce pot să gătesc astăzi folosind doar ingredientele pe care le am deja în frigider?"*. 

Scopul aplicației este optimizarea resurselor alimentare, minimizarea risipei și oferirea de opțiuni personalizate în funcție de stilul de viață al utilizatorului (ex: diete vegane, timp limitat, excluderea alergenilor).

---

## Arhitectura Sistemului

Codul nostru (disponibil în `prima_parte.pl`) este împărțit în două secțiuni logice clare:

### 1. Baza de Cunoștințe (Faptele)
Am modelat universul culinar definind o bază de date complexă, care depășește cerințele minime ale temei:
* **35 de ingrediente** de bază.
* **15 rețete** detaliate, fiecare cu lista sa strictă de ingrediente.
* **Metadate extinse pentru fiecare rețetă:**
  * Momentul zilei (mic dejun, prânz, cină, desert).
  * Timpul de preparare (în minute).
  * Nivelul de dificultate (ușor, mediu, greu).
  * Restricții alimentare (vegetarian, vegan).

### 2. Motorul de Inferență (Logica)
Folosind concepte specifice programării logice (manipularea listelor, funcții de ordin superior precum `findall` și `keysort`, intersecții și diferențe de mulțimi), am creat un sistem care nu doar găsește rețete, ci le **prioritizează** pe cele care necesită cele mai puține ingrediente suplimentare.

---

## Funcționalități și Predicate Principale

Sistemul pune la dispoziția utilizatorului trei moduri principale de interacțiune:

### A. Recomandarea de bază
`recomanda_reteta(IngredienteDisponibile, RetetaRecomandata)`
Compară ce ai în stoc cu ce cer rețetele și îți sugerează preparatele în ordinea eficienței (cele cu 0 lipsuri apar primele, urmate de cele cu 1 lipsă, etc.).

### B. Căutarea Avansată (Filtre complete)
`recomanda_reteta_cu_preferinte(Ingrediente, Categorie, Restrictie, TimpMax, Dificultate)`
Acesta este filtrul suprem. Pe lângă stocul de ingrediente, sistemul ține cont de: momentul zilei, dietă, timpul maxim în care vrei să termini de gătit și cât de complicată vrei să fie rețeta. Dacă nu ai o preferință pentru un anumit parametru, poți scrie `oricare`.

### C. Modul "Fără Alergeni" (Excluderi)
`recomanda_fara_ingrediente(IngredienteDisponibile, IngredienteNedorite)`
Elimină automat din căutare orice rețetă care conține ingrediente din lista neagră (ex: alergii la lactoză, meniu fără carne etc.), folosind funcția de intersecție a listelor.

---

