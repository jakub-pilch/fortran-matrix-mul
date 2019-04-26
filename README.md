# Fortran - Mnożenie Macierzy
## Autor: Jakub Pilch
---
## 1. Wstęp

Tematem projektu była implementacja oraz przetestowanie różnych metod mnożenia macierzy. W języku Fortran zostały zaimplementowane trzy metody:
+ **naiwna**
+ **ulepszona** - wykorzystująca ułożenie danych w pamięci
+ **z iloczynem skalarnym** - wbudowana funkcja dot_product
Dodatkowo do porównania wzięto też pod uwagę wbudowaną funkcję Fortrana matmul(A,B).

Plik **main.F90** zawiera program testowy.

Uwaga techniczna: należy zatroszczyć się o odpowiednią wielkość stosu dla testów na większych rozmiarach macierzy.

---
## 2. Testowane konfiguracje

Zmierzono czas wykonania każdej z metod dla:
+ typów real o precyzji: **4, 8, 16**
+ rozmiarów macierzy: **10, 20 ,40 ,80, 160, 320, 640, 1280**
    
---

## 3. Wyniki pomiarów

Poniższe wykresy przedstawiają wyniki pomiarów dla poszczególnej precyzji typu real:

### Kind = 4
![](res/wykres[4].jpeg)
### Kind = 8
![](res/wykres[8].jpeg)
### Kind = 16
![](res/wykres[16].jpeg)

## 4. Uwagi i wnioski

Oczywiste uwagi co do wykresów:
+ wykorzystanie funkcji **dot_product** ewidentnie zwiększa czas wykonania niezależnie od precyzji
+ pozostałe metody prezentują nieznacznie różniące się rezultaty niezależnie od rozmiaru macierzy i precyzji
W związku z tym, wyrażam wątpliwości czy wszystkie obliczenia zostały wykonane poprawnie. Jednocześnie nie jestem w stanie wskazać możliwego błędu - poszczególne funkcje wydają się być zaimplementowane poprawnie.

Dodatkowe wnioski:
+ wbudowana funkcja **matmul** zdaję się być najlepszym rozwiązaniem dla niewielkich rozmiarów macierzy
+ dla **kind = 8** i rozmiarów macierz mniejszych niż 100, widoczna jest w przybliżeniu oczekiwana zależność pomiędzy czasem wykonania poszczególnych metod