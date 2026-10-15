/* Tusk_UnlockArena - install Tusk_HookReturn0 as segment-type hook 20 and clear byte +2 of both TUSK floor segments */

typedef struct Seg { char pad[2]; char locked; } Seg;
typedef struct Tusk { char pad[0x90]; Seg *seg1; Seg *seg2; } Tusk;
extern short (*g_SegTypeHooks[])();
short Tusk_HookReturn0();

void Tusk_UnlockArena(Tusk *self)
{
	g_SegTypeHooks[20] = Tusk_HookReturn0;
	self->seg1->locked = 0;
	self->seg2->locked = 0;
}
