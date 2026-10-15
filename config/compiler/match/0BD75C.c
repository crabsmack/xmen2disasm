/* Barbarian_TargetClose - is the target (+$A2) within $32 px horizontally (?: as MPW C 3.2.4+) */

typedef struct Actor { char pad[8]; long x; } Actor;
typedef struct Barbarian { char pad[8]; long x; char padC[0x96]; Actor *target; } Barbarian;

char Barbarian_TargetClose(Barbarian *self)
{
	long dx = self->target->x - self->x;

	return (dx >= 0 ? dx : -dx) < 0x3200;
}
