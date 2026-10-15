/* Exodus_StateWaitBlastsGone - wait until the live-blast counters +$98/+$9A are 0, then the next attack */

typedef struct Exodus {
	void *cls;
	short flags;			/* +$04 */
	char pad06[0x56];
	short (*state)();		/* +$5C */
	char pad60[0xC];
	short timer;			/* +$6C */
	char pad6E[0x2A];
	short blasts1;			/* +$98 */
	short blasts2;			/* +$9A */
	char pad9C[0x10];
	char modeBits;			/* +$AC */
} Exodus;
short Exodus_StateNextAttack();

short Exodus_StateWaitBlastsGone(Exodus *self)
{
	if (self->blasts1 == 0 && self->blasts2 == 0) {
		self->modeBits &= 0xF3;
		self->timer = 0;
		self->state = Exodus_StateNextAttack;
		return self->flags & 8;
	}
}
