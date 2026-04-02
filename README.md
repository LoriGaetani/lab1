```angular2html
git init
git add remote <URL>
```

### Step 1: Verificabilità
Aggiungere la dipendenza a Actuator che mi espone l'endpoint ```/actuator/health```, permette di 
distinguere tra **Live** e **Ready**. Ready significa che oltre ad essere Live è anche
raggiungibile Nel senso che ha completato l'inizializzazione (es. connessione al DB) ed
è pronto ad accettare le richieste. 

Per fare dei test unitari si può usare **@DataJpaTest** per testare il DB senza la dipendenza
con il vero db psql, ma usarne uno veloce in memoria H2 usa e getta. 
Quando uso il metodo save, questo può essere usato sia per INSERT che per UPDATE. Usa uno 
o l'altro a seconda se gli passo o no l'id dell'entità. 


### Step2: Justfile
creare justfile con i comandi utili per il progetto (run, test,...) per portabilità nel team
e conformità con la CI pipeline. 

### Step3: Container Docker
Usare Gradlew (un Wrapper di Gradle) ho il vantaggio che non conflitti tra le dipendenze
Gradle perchè prende la versione del progetto. 
