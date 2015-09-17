# Relazione Progetto
L’animazione di questo sketch è basata su una traccia audio, ma si può adattare a una qualsiasi di esse, in particolare però è ideata per canzoni o temi anni 80’, perché lo sketch cerca di rappresentare, e si ispira, alla pedana da discoteca anni 80’.￼All’avvio dello sketch, se è impostata una traccia audio, essa viene subito riprodotta. La musica influenza la pedana in base al tipo di suono (kick, snare e hat) e all’intensità di essa. La pedana riceve degli i​mpulsi​e imposta il tempo e il colore nei quali la cella, alla quale è arrivato l’impulso, deve rispettivamente illuminarsi e colorarsi come stabilito.## Figure [CAMBIO MODALITA’ TASTO ‘f‘]
___Le **figure** vengono impostate dalla pedana, attraverso un impulso inviato dalla musica o dall’utente. Questo impuso se inviato dalla musica porta con se le coordinate della cella fulcro della figura da creare.
Sono presenti due figure, QUADRATA e STELLA. Queste sono create componendo la giusta illuminazione di un set di celle della pedana. Infatti le uniche forme utilizzate in processing sono quadrati che, sfruttando la **legge della continuità**, vengono percepiti dall’utente come una struttura unitaria che forma le configurazioni sopra descritte.
La grandezza di queste figure dipende dall’intensità della musica nell’istante in cui è stato inviato l’impulso alla pedana.
L’utente può interagire e decidere quali delle due utilizzare per illuminare la pedana.
Ho scelto di utilizzare solamente figure quadrate perché queste rappresentano in maniera adeguata la realtà che ho voluto riprodurre attraverso l’animazione.

## ￼Colori [CAMBIO PALETTE TASTO ‘p’ - CAMBIO MODALITA COLORE TASTO ‘c’]
___Il **colore** è deciso sempre da una modalità di visualizzazione; può essere decisa la modalità *MULTIPLE* o *SINGLE*. Nella prima ogni cella che compone una figura è illuminata diversamente dalle altre selezionando il colore in modo casuale dalla palette, creando così un effetto irregolare ma più colorato che agli occhi dell’utente viene percepito come più disordinato; nel secondo caso il colore della figura è prestabilito ed ogni cella assumerà lo stesso colore facendo distinguere meglio all’utente ciascuna figura e creando meno caos visuale.
In memoria sono mantenute diverse palette di colori, ma solo una di esse alla volta viene impostata come sorgente di colori per la pedana. Ogni cella della pedana si colora di un particolare colore all’interno della palette attualmente associata alla pedana. 
Ho scelto di impostare le palette dell’animazione con colori vivaci perché sono ispirati a quelli in voga negli anni 80’, presenti sulle pedane da discoteca, ed invocano a livello interpersonale la familiarità con essi, anche grazie all’associazione con la musica tipica di quegli anni. Inoltre questo insieme di relazioni cerca di evocare all’utente uno stato di allegria e energia.
La prima palette contiene tutti i principali colori che ho voluto utilizzare nello sketch, le altre invece sono composte da varie tonalità dei singoli colori che compongono la prima palette.
Inoltre, grazie al background nero, questi vengono evidenziati e il contrasto dei colori è maggiore, tali da renderli più vividi all’occhio dell’utente.
## Special [ATTIVAZIONE/DISATTIVAZIONE TASTO ‘s’]
___
E’ presente una modalità speciale di correlazione tra pedana e musica tale per cui la pedana viene illuminata in modo da rappresentare l’istogramma della frequenza della musica in quel momento riprodotta.## Interazione utente
___
Altri tipi di impulsi vengono inviati quando l’utente preme il mouse. In questo caso a seconda della posizione di esso, in una delle quattro porzioni di schermo nel quale lo sketch viene visualizzato, è inviato alla pedana un impulso ad *ONDA*. Questo tipo di impulso illumina ogni cella della pedana a partire da un vertice dell’area dello sketch. L’effetto ottico è appunto un’onda che attraversa lo schermo nella direzione opposta a quella da dove è partita. 
Alcune modalità di questo tipo di impulso fanno partire due onde contrapposte che si scontrano e si annullano al centro dello schermo.

Sono memorizzati diversi preset di colori all’interno dello sketch, anch’essi selezionabili dall’utente in base all’atmosfera che esso vuole ricreare nel momento della canzone.
Questi sono tutti stimoli ad interagire per creare una configurazione visiva adeguata ad ogni momento della traccia audio.

L’obiettivo principale, quindi, di questa animazione è quello di stimolare l’utente a giocare ed esplorare le varie configurazioni visuali che possono essere create interagendo con lo sketch e naturalmente suscitare lo stimolo a ballare e muoversi seguendo il ritmo della canzone in sottofondo, guidati dagli effetti visivi, influenzati dal ritmo e dall’intesnità della musica.

Questo sketch, utilizzato in relazione con arduino, potrebbe mappare gli input dalla realtà per illuminare concretamente una pedana reale.