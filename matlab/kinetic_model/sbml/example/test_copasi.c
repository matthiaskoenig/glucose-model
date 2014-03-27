#ifdef SIZE_DEFINITIONS
#define N_METABS 6
#define N_ODE_METABS 0
#define N_INDEP_METABS 1
#define N_COMPARTMENTS 1
#define N_GLOBAL_PARAMS 0
#define N_KIN_PARAMS 1
#define N_REACTIONS 1
#endif // SIZE_DEFINITIONS

#ifdef TIME
#define T  <set here a user name for the time variable> 
#endif // TIME

#ifdef INITIAL
x[0] = 1;	//metabolite 'A': reactions
x[1] = 1;	//metabolite 'insulin': reactions
x[2] = 1;	//metabolite 'glucagon': reactions
#endif INITIAL

#ifdef FIXED
p[0] = 1;	//compartment 'compartment':fixed
p[1] = 0.1;	//reaction 'r1':  kinetic parameter 'k1'
#endif FIXED

#ifdef ASSIGNMENT
y[0] = 0+x[0];	//metabolite 'B': reactions
y[1] = 2-x[0];	//metabolite 'C': reactions
y[2] = 2-x[0];	//metabolite 'D': reactions
x_c[0] = x[0]/p[0];	//concentration of metabolite 'A': reactions
y_c[0] = y[0]/p[0];	//concentration of metabolite 'B': reactions
y_c[1] = y[1]/p[0];	//concentration of metabolite 'C': reactions
y_c[2] = y[2]/p[0];	//concentration of metabolite 'D': reactions
x_c[1] = x[1]/p[0];	//concentration of metabolite 'insulin': reactions
x_c[2] = x[2]/p[0];	//concentration of metabolite 'glucagon': reactions
#endif ASSIGNMENT

#ifdef  FUNCTIONS_HEADERS
double RateLawForR1(double sub_0, double modif_0, double param_0, double prod_0); 
#endif FUNCTIONS_HEADERS

#ifdef  FUNCTIONS
double RateLawForR1(double sub_0, double modif_0, double param_0, double prod_0) 	//Rate Law for r1
{return  sub_0*modif_0-param_0/prod_0;} 
#endif FUNCTIONS

#ifdef ODEs
dx[0] = -RateLawForR1(x_c[0], x_c[1], p[1], y_c[2])*p[0];	// 
dx[1] = 0;	// 
dx[2] = 0;	// 
#endif ODEs
