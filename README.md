# Prognozowanie Rezygnacji Klientów dla Firmy Telekomunikacyjnej

---

## 1. Wprowadzenie:
**Opis zadania**: Opracowanie modelu predykcyjnego do określenia prawdopodobieństwa rezygnacji klientów z usług telekomunikacyjnych.

---

## 2. Opis danych:
**Opis zadania**: Import danych, które zawierają cechy demograficzne klientów, historię korzystania z usług, plany taryfowe oraz status churn.

**Skrypt**: `data_import.ipynb`
- **Opis**: W tym skrypcie dane klientów są wczytywane z pliku CSV (`internet_service_churn.csv`) i przechowywane w Pandas DataFrame. Wykonano wstępną analizę struktury danych.

---

## 3. Analiza danych (EDA):
**Opis zadania**: Przeprowadzenie analizy eksploracyjnej danych, wizualizacja rozkładów, identyfikacja brakujących wartości, analiza korelacji.

**Skrypt**: `data_analysis.py`
- **Opis**: W tym skrypcie wykorzystano Pandas, Matplotlib i Seaborn do analizy danych, w tym do tworzenia wykresów rozkładu cech, takich jak wiek i korzystanie z usług. Skrypt ten identyfikuje brakujące wartości i analizuje korelacje między zmiennymi.

---

## 4. Wstępne przetwarzanie danych:
**Opis zadania**: Przetwarzanie brakujących danych, kodowanie zmiennych kategorycznych i normalizacja cech numerycznych.

**Skrypt**: `data_preprocessing.ipynb`
- **Opis**: Skrypt ten zajmuje się wstępnym przetwarzaniem danych, uzupełniając brakujące wartości za pomocą `SimpleImputer`, kodując zmienne kategoryczne (np. `OneHotEncoder`) oraz normalizując cechy numeryczne za pomocą `StandardScaler`.

---

## 5. Opracowanie modelu:
**Opis zadania**: Wybór algorytmu uczenia maszynowego (RandomForestClassifier), trening modelu i ocena jego wydajności (Accuracy, Recall, Precision, F1 Score).

**Skrypty**:
1. **`train_model.ipynb`**
   - **Opis**: Skrypt trenuje model RandomForestClassifier na przetworzonych danych i zapisuje go za pomocą pickle do pliku `model.pkl`.
   
2. **`model_evaluation.ipynb`**
   - **Opis**: Skrypt ocenia wydajność modelu, obliczając wskaźniki takie jak Accuracy, Recall, Precision i F1 Score. Zawiera również wizualizację macierzy konfuzji i krzywej ROC.

---

## 6. Integracja i wyprowadzanie wyników:
**Opis zadania**: Przygotowanie procedury przyjmowania danych nowego klienta, przetwarzanie ich przez model i generowanie wyniku.

**Skrypty**:
1. **`model_prediction.ipynb`**
   - **Opis**: Ten skrypt wczytuje zapisany model (`model.pkl`), przyjmuje dane nowego klienta i dokonuje przewidywania, czy klient ma wysokie czy niskie prawdopodobieństwo rezygnacji.
   
2. **Wyniki**: Skrypt wyświetla informację o prawdopodobieństwie rezygnacji w formie tekstowej („Customer is likely/unlikely to churn”).

---

## 7. Wymagania dotyczące projektu:
**Opis zadania**: Dokumentacja całego procesu, w tym analiza, przetwarzanie danych, opis modelu, integracja i konteneryzacja.

**Skrypty**:
- Dokumentacja może być zawarta w pliku README.md, w którym opiszemy każdy krok projektu (import danych, analiza, przetwarzanie, trenowanie modelu, ocena, konteneryzacja).

---

## 8. Kryteria oceny:
**Opis zadania**: Jakość przetwarzania danych, wybór parametrów modelu, analiza wyników, funkcjonalność i konteneryzacja.

**Skrypty**:
- **`data_preprocessing.ipynb`**: przetwarza dane.
- **`train_model.ipynb`**: wybiera parametry i trenuje model.
- **`model_evaluation.ipynb`**: analizuje wyniki modelu.
- **`Dockerfile`** i **`docker-compose.yml`**: umożliwiają uruchomienie konteneryzacji.

---

## 9. Tworzenie Dockerfile:
**Opis zadania**: Opracowanie pliku Dockerfile do stworzenia obrazu Docker.

**Plik**: `Dockerfile`
- **Opis**: Plik Dockerfile zawiera wszystkie instrukcje potrzebne do utworzenia obrazu Docker, w tym instalację zależności z pliku `requirements.txt` i uruchomienie modelu.

---

## 10. Docker Compose:
**Opis zadania**: Zintegrowanie narzędzia Docker Compose w celu uproszczenia uruchamiania projektu.

---

**Plik**: `docker-compose.yml`
- **Opis**: Plik `docker-compose.yml` definiuje usługi potrzebne do uruchomienia projektu, co umożliwia uruchomienie aplikacji za pomocą jednego polecenia `docker-compose up`.

---

 ### Komendy:

1. **Budowanie obrazu Docker**:
   
   **Komenda w Terminalu**`docker build -t churn_model .` 
   **Opis**: To polecenie tworzy obraz Docker o nazwie churn_model na podstawie pliku Dockerfile znajdującego się w bieżącym katalogu (.). Obraz ten zawiera cały kod oraz niezbędne zależności do uruchomienia projektu.
   
2. **Uruchomienie kontenera z obrazem Docker**:
   
   **Komenda w Terminalu**`docker run churn_model`
   **Opis**: To polecenie uruchamia kontener na podstawie obrazu churn_model. Po uruchomieniu kontener wykonuje skrypt, który wczytuje zapisany model predykcyjny i przetwarza dane, wyświetlając prognozę (czy klient ma wysokie czy niskie prawdopodobieństwo rezygnacji).

3. **Uruchamianie całego projektu za pomocą Docker Compose**:

   **Komenda w Terminalu**`docker-compose up`
   **Opis**: To polecenie uruchamia wszystkie usługi zdefiniowane w pliku docker-compose.yml. Automatycznie tworzy i uruchamia niezbędne kontenery Docker, co pozwala na uruchomienie całego projektu za pomocą jednego polecenia, łącznie z obsługą modelu predykcyjnego.  

---

### Zarządzanie kontenerami Docker:

1. **Sprawdzenie istniejących kontenerów**:
   
   **Komenda w Terminalu**`docker ps -a`
   **Opis**: To polecenie pokazuje wszystkie kontenery Docker, które są obecnie uruchomione lub były uruchomione (włącznie z tymi, które zostały zatrzymane). Dzięki temu możesz sprawdzić, które kontenery są dostępne do zarządzania.
   
   **Uruchomienie całego projektu za pomocą Docker Compose**:

   **Komenda w Terminalu**`docker-compose up`
   **Opis**: To polecenie uruchamia wszystkie usługi zdefiniowane w pliku docker-compose.yml, co automatycznie tworzy i uruchamia potrzebne kontenery Docker. Dzięki temu można uruchomić cały projekt za pomocą jednego polecenia, włączając obsługę modelu predykcyjnego.
   
  
   **Zatrzymanie kontenera**:

   **Komenda w Terminalu**`docker stop <container_id>`
   **Opis**: Zatrzymuje działający kontener. W miejsce <container_id> należy wprowadzić ID kontenera, który chcesz zatrzymać. Polecenie docker ps -a może pomóc w zidentyfikowaniu ID kontenera.
   
   **Usunięcie kontenera**:

   **Komenda w Terminalu**`docker rm <container_id>`
   **Opis**: Usuwa kontener Docker. Używaj tego polecenia, aby zwolnić zasoby przez trwałe usunięcie kontenerów, które nie są już potrzebne. Ponownie, w miejsce <container_id> wprowadź ID kontenera, który chcesz usunąć.

---

## Podsumowanie:
- **Skrypty do analizy danych**: `data_analysis.ipynb`
- **Skrypty do przetwarzania danych**: `data_preprocessing.ipynb`
- **Skrypty do trenowania modelu**: `train_model.ipynb`
- **Skrypty do oceny modelu**: `model_evaluation.ipynb`
- **Skrypty do przewidywania**: `model_prediction.ipynb`
- **Dockerfile i Docker Compose**: `Dockerfile`, `docker-compose.yml`

