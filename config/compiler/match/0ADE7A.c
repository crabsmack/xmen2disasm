/* TrapDoor_StateClosed - closed: put back tiles +$94 (class slot +$82), re-enable the segment, re-arm */

typedef struct Class {
	short nameOffset;
	struct Class *parent;
	void (*method[64])();
} Class;
/* state change: reset the state timer and switch state */
#define SET_STATE(obj, f)	do { (obj)->timer = 0; (obj)->state = (f); } while (0)

typedef struct TrapDoor {
	Class *cls;
	short flags;			/* +$04 */
	char pad06[0x56];
	short (*state)();		/* +$5C */
	char pad60[0xC];
	short timer;			/* +$6C */
	char pad6E[0x26];
	short tiles;			/* +$94 */
	char pad96[6];
	char *seg;			/* +$9C */
} TrapDoor;
short TrapDoor_StateArm();

short TrapDoor_StateClosed(TrapDoor *self)
{
	(*self->cls->method[31])(self, self->tiles);
	*self->seg &= 0xBF;
	SET_STATE(self, TrapDoor_StateArm);
	return self->flags & 8;
}
