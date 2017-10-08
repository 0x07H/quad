#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

//comment
// coefs for ax^2 + bx + c = 0
typedef struct {
  double	a;
  double	b;
  double	c;
} Values;

// Real roots for ax^2 + bx + c = 0
typedef struct {
  double	x1;
  double	x2;
} Roots;

int solve_quad(Values *val, Roots *roots) {
	double a,b,c;  // coefs of quadratic , LOCAL COPIES 
	double d;      // discriminate d = b^2 = 4ac
	double sqrtd; // sqrt of d;


	a = val->a;
	b = val->b;
	c = val->c;

	if(a == 0.0) { // not a true quadratic
	  return -1 ;
	} 

	d = b*b - 4.0*a*c;
	if(d < 0.0) { // No real roots 
	  return -2;
	}
	if(d == 0) { // double root 
	  roots->x1 = -b / (2.0*a);
	  roots->x2 = roots->x1; 
	  return 1;
	}
	// two roots 
	sqrtd = sqrt(d);
	roots->x1 = (-b + sqrtd)/(2.0*a);
	roots->x2 = (-b - sqrtd)/(2.0*a);

	return 2;
}

int get_input(Values *val) {
  
  double a,b,c;
  
  printf("Enter a, b and c of quadratic equation: ");
  if (fscanf(stdin,"%lf%lf%lf",&a,&b,&c) != 3){
    fseek(stdin,0,SEEK_END);
    return -1;
  }
    
  val->a = a;
  val->b = b;
  val->c = c;
  fseek(stdin,0,SEEK_END);
  return 0;
}


int main(){
  Values val;
  Roots roots;
  int flag = 1; 
  int result;
  
  while (flag == 1) {

    while(get_input(&val) == -1);
    
    switch (result = solve_quad(&val, &roots)) {
      case -2: // No real roots
             printf("No real roots\n");
             break;
      case -1: // Not a quadratic (a == 0)
             printf("Not a quadratic (a==0)\n");
             break;
      case 1:  // double real root
             printf("Double real root %24.16f\n", roots.x1);
             break;
      case 2:  // two distinct roots
             printf("Roots  %24.16f  %24.16f\n", roots.x1, roots.x2);
             break;
      
    }
    do {
      printf("Please enter 1 to run again or 0 to quit: ");
      result = fscanf(stdin, "%d", &flag);
      fseek(stdin,0,SEEK_END);
      } while(result != 1);
    
  }
  return 0;
}
