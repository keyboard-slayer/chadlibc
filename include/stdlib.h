#ifndef _STDLIB_H
#define _STDLIB_H 1

#define EXIT_SUCCESS 0
#define EXIT_FAILURE 1

#define RAND_MAX 32767

/* Defined by spec to be **at least** 32 */
#define ATEXIT_MAX 32

typedef struct
{
	int quot;
	int rem;
} div_t;

typedef struct
{
	long int quot;
	long int rem;
} ldiv_t;

int abs(int);
div_t div(int, int);
long int labs(long int);
ldiv_t ldiv(long int, long int);
int rand(void);
void srand(unsigned int);

void exit(int);
char *getenv(const char *);
int atexit(void (*)(void));

double atof(const char *);
int atoi(const char *);
long int atol(const char *);
double strtod(const char *, char **);
long int strtol(const char *, char **, int);
unsigned long int strtoul(const char *, char **, int);

#endif /* !_STDLIB_H */
