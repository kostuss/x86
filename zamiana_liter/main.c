#include <stdio.h>
#ifdef __cplusplus
extern "C" {
#endif
 char output_str[256];
 char input_str[256]; 
 int func(char *, char *);
#ifdef __cplusplus
}
#endif

int main()
{	
	
	printf("Podaj ciag liter: \n");
	scanf("%[^\n]s", input_str);
	printf("Input string: %s\n", input_str);
  	func(output_str, input_str);
  	printf("Output string: %s\n", output_str);
  	printf("Input string: %s\n", input_str);
  	
  
  return 0;
}
