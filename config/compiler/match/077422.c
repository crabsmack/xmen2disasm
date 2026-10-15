/* CloneA1_CyclePalettes - advance the CloneA1 palette cycles (two tables sharing one counter set) */

/* Data in code segments is named as code (a jump-table entry); its real address is the
   jmp target at entry+2. */
#define CODEPTR(code)	(*(void **)((char *)(code) + 2))

extern short g_SceneVar3B32, g_SceneVar3B42, g_SceneVar3B3A;
extern void Pal_CloneA1Cycle(), Pal_CloneA1Cycle2();
void Pal_CycleStep();

void CloneA1_CyclePalettes(void)
{
	Pal_CycleStep(&g_SceneVar3B32, &g_SceneVar3B42, &g_SceneVar3B3A, CODEPTR(Pal_CloneA1Cycle), 0);
	Pal_CycleStep(&g_SceneVar3B32, &g_SceneVar3B42, &g_SceneVar3B3A, CODEPTR(Pal_CloneA1Cycle2), 1);
}
