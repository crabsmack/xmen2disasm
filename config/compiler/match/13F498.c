/* Debris_SetBounceLimit - set how many floor bounces a debris piece survives (?: as MPW C 3.2.4+) */

typedef struct Debris { char pad[0xA]; char bounceLimit; } Debris;

void Debris_SetBounceLimit(Debris *d, short n)
{
	n = n < 1 ? 1 : n;
	d->bounceLimit = (n - 1) * 3;
}
