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
	printf("Podaj ciag liczb: \n");
	scanf("%s", input_str);
	printf("Input string: %s\n", input_str);
  	func(input_str, output_str);
  	printf("Output string: %s\n", output_str);
  	//printf("Input string: %s\n", input_str);
  return 0;
}
