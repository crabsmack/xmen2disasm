/* Player1_StartLife - give player 1 a new life: keep or randomly pick a character (not P2's),
   health $700, spend a life. Rand_Next() % 6 pins the compiler to MPW C 3.3: from 3.3.2 on the
   short result of a remainder by a small constant is sign-extended (ext.w d0) after the
   runtime call; MPW C 3.2.4 leaves it out. */

typedef struct Player Player;
extern Player *g_Player1, *g_Player2;
extern char g_SiberiaIntro;
extern short g_P1Health;
extern char g_P1CharIndex;
extern short g_P1Lives;
short Player_CharIndexOf(Player *p);
unsigned short Rand_Next(void);
void Player1_SetBeast(void), Player1_SetCyclops(void), Player1_SetGambit(void);
void Player1_SetNightcrawler(void), Player1_SetPsylocke(void), Player1_SetWolverine(void);

char Player1_StartLife(void)
{
	short me, other;

	me = Player_CharIndexOf(g_Player1);
	other = Player_CharIndexOf(g_Player2);
	if (!g_SiberiaIntro)
		return 0;
	if (me == -1) {
		do
			me = Rand_Next() % 6;
		while (me == other);
	}
	g_P1Health = 0x700;
	switch (me) {
	case 0: Player1_SetBeast(); break;
	case 1: Player1_SetCyclops(); break;
	case 2: Player1_SetGambit(); break;
	case 3: Player1_SetNightcrawler(); break;
	case 4: Player1_SetPsylocke(); break;
	case 5:
	default: Player1_SetWolverine(); break;
	}
	g_P1CharIndex = me;
	--g_P1Lives;
	return 1;
}
