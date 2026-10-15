/* Tusk_PlayerOnPlatform - is a player present and standing on TUSK's platform segment (+$94) */

typedef struct Tusk { char pad[0x94]; long platform; } Tusk;
typedef struct Player { void *cls; short flags; char pad[0x70]; long segment; } Player;

char Tusk_PlayerOnPlatform(Tusk *tusk, Player *p)
{
	return (p->flags & 0xC000) == 0x8000 && p->segment == tusk->platform;
}
