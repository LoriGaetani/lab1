```angular2html
git init
git add remote url
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

### Step4: Verify Done
Creare un comando che faccia in automatico build, test, docker run... in modo unificato
sfruttando i comandi di prima e che possa essere usato per essere sicuri che una volta
implementata una nuova feature questa rispetti dei requisiti di correttezza. 

### Step5: CI pipeline
Just permette di fare una pipeline solo in locale. Con le Github actions possiamo eseguirla 
su un server remoto. 
Alla fine della pipeline pusho su un container registry. 

Quando l'utente fa il commit gli mette un tag v*.*.* e il valore viene usato per accedere 
alla repo dove sono i manifest per aggiornare il tag nei manifest k8s. 
commit, Git, new tag, push (push tags X)





1) Come generare il token

Su GitHub:

apri Settings del tuo account
vai su Developer settings
Personal access tokens
Fine-grained tokens
Generate new token

Quando lo crei, imposta:

Repository access: seleziona solo LoriGaetani/DevOps
Permissions: almeno Contents: Read and write
Metadata: Read
metti anche una scadenza ragionevole, perché GitHub raccomanda di non lasciare token permanenti se non necessario.

Per il tuo caso basta un token che possa fare commit e push sul repo del chart. Non serve dargli accesso ad altri repo.

2) Come “nasconderlo”

Non lo metti mai nel workflow in chiaro. Lo salvi come repository secret nel repo del backend:

vai nel repo dove gira la pipeline
Settings
Secrets and variables
Actions
New repository secret
Nome: HELM_REPO_PAT
Valore: incolla il token
