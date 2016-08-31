#define NUMREADINGS 3

int readings[NUMREADINGS];                // qtde de amostras
int index = 0;                            // índice da leitura atual
int total = 0;                            // total móvel
int average = 0;                          // média

const int pot = A5;

void setup()
{
  // start serial port at 9600 bps:
  Serial.begin(9600);
  pinMode(A5, INPUT);
  for (int i = 0; i < NUMREADINGS; i++)
    readings[i] = 0;
}

void loop()
{
  total -= readings[index];               // subtrair a última leitura
  readings[index] = analogRead(pot); // ler do sensor
  total += readings[index];               // adicionar leitura ao total
  index = (index + 1);                    // avançar ao próximo índice

  if (index >= NUMREADINGS)               // se estiver no fim do vetor...
    index = 0;                            // ...meia-volta ao início

  average = total / NUMREADINGS;

  Serial.println(average);               
}



