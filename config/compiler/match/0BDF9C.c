/* Barbarian_StateLeap - BARBARIAN state: leap off (sound $AD) */

typedef struct Actor {
	void *cls;			/* +$00 class descriptor */
	short flags;			/* +$04 */
	char pad06[0x3E];
	long field44;			/* +$44 */
	char pad48[0x14];
	short (*state)();		/* +$5C */
	char pad60[0xC];
	short timer;			/* +$6C */
} Actor;

void Snd_Stop(), Snd_Play();
short Barbarian_StateLeapRise();
/* state change: reset the state timer and switch state (a do/while(0) macro: the loop label is
   where MPW C flushes the pending argument pops of the two sound calls) */
#define SET_STATE(obj, f)	do { (obj)->timer = 0; (obj)->state = (f); } while (0)

short Barbarian_StateLeap(Actor *self)
{
	Snd_Stop(0xAD);
	Snd_Play(0xAD);
	self->field44 = 0;
	SET_STATE(self, Barbarian_StateLeapRise);
	return self->flags & 8;
}
