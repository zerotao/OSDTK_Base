#include <stdio.h>

void usage(char *name){
  if(!name){ printf("Programer Error: usage requires a name!!"), exit(1); }
  printf("Usage: %s\n", name);
  exit(1);  
}
