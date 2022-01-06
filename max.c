/*******************************************************************************
*
* Purpose: Prints the maximum number of any number of int command-line 
* arguments that are provided.  So if this program is run with:
*   ./max 5 10 20 25 15
* then we can expect it to print 25.
*
*******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include "library.h"

int main(int argc, char *argv[])
{
  int *a = malloc((argc-1)*sizeof(int));
  for(int i=0;i<argc-1;i++) 
  {
    a[i]=atoi(argv[i+1]);
  }
  printf("%d\n", max(a,argc-1));
  free(a);
  return 0;
}