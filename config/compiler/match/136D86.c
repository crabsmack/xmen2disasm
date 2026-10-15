/* Hornet_StatePickPattern - pick the flight pattern from the spawn type +$9E, then start the
   attack cycle (face the player now, or after the delay in +$A6). */

typedef struct Hornet {
	char pad0[4];
	short flags4;			/* +$04 */
	char pad6[0x10];
	short speedX;			/* +$16 */
	short speedY;			/* +$18 */
	char pad1A[0x42];
	short (*state)();		/* +$5C */
	char pad60[0xC];
	short timer;			/* +$6C */
	char pad6E[0x26];
	void (*move)();			/* +$94 */
	char pad98[6];
	short spawnType;		/* +$9E */
	short moveFlags;		/* +$A0 */
	char padA2[4];
	short faceDelay;		/* +$A6 */
} Hornet;

void Hornet_MoveBounce();
void Hornet_MoveDiveOnce();
void Hornet_MoveDiveRepeat();
short Hornet_StateFacePlayer(Hornet *h);

short Hornet_StatePickPattern(Hornet *h)
{
	switch (h->spawnType) {
	default:
	case 0:
		h->speedX = 0x200;
		h->moveFlags |= 1;
		h->move = Hornet_MoveBounce;
		break;
	case 1:
		h->speedY = 0x180;
		h->moveFlags |= 2;
		h->move = Hornet_MoveBounce;
		break;
	case 2:
		h->speedY = 0x300;
		h->moveFlags |= 2;
		h->move = Hornet_MoveDiveOnce;
		break;
	case 3:
		h->speedY = 0x300;
		h->moveFlags |= 2;
		h->move = Hornet_MoveDiveRepeat;
		break;
	}
	if (h->faceDelay == -1) {
		h->state = Hornet_StateFacePlayer;
		return Hornet_StateFacePlayer(h);
	}
	h->timer = h->faceDelay;
	h->state = Hornet_StateFacePlayer;
	return h->flags4 & 8;
}
