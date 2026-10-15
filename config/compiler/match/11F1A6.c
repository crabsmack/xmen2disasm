/* BioBalls_AllocBallList - allocate the shared ball list for N balls (filled with -1) and build the 128-entry sine table */

extern short *g_BioBallsList;
extern long g_BioBallsSine[128];
void BioBalls_EmptyStub(void);
void *Mem_StackAlloc();
void *memset();
long Math_SinDeg();

short *BioBalls_AllocBallList(short n)
{
	short size, i;
	long *p;

	BioBalls_EmptyStub();
	size = n * 6 + 2;
	g_BioBallsList = Mem_StackAlloc(size, "");
	memset(g_BioBallsList, 0xFF, size);
	*g_BioBallsList = n;
	p = g_BioBallsSine;
	for (i = 0; i < 128; i++, p++)
		*p = Math_SinDeg(i * 180 / 128);
	return g_BioBallsList;
}
