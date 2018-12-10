#include <stdio.h>
#ifdef __cplusplus
extern "C" {
#endif
 char output_str[256];
 char input_str[256]; 
 int func(char *a, char* b);
#ifdef __cplusplus
}
#endif

int main()
{ 
	printf("Podaj ciag wejsiowy\n");
	scanf("%s", input_str); 
  	printf("Input string: %s\n", input_str);
  	func(input_str, output_str);
  	printf("Output string: %s\n", output_str);
  
  return 0;
}

