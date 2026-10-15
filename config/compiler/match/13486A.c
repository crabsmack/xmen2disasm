/* FlyBrood_MoveSine - fly horizontally while y follows a sine wave around +$9C, for count frames. MPW C gives registers to the most-used locals (ties: the later declaration) and lays the rest out on the stack in declaration order; this order reproduces the ROM's */

typedef struct FlyBrood {
	char pad00[8];
	long x;				/* +$08 */
	long y;				/* +$0C */
	char pad10[6];
	short speed;			/* +$16 */
	char pad18[0x84];
	short baseY;			/* +$9C */
	char pad9E[0xA];
	short shift;			/* +$A8 */
	char padAA[2];
	short angle;			/* +$AC */
	short step;			/* +$AE */
} FlyBrood;
long Math_SinDeg();

void FlyBrood_MoveSine(FlyBrood *self, short count)
{
	short angle, step, shift;
	long y;
	short speed;
	long x, s;

	angle = self->angle;
	step = self->step;
	shift = self->shift;
	x = self->x;
	speed = self->speed;
	do {
		x += speed;
		angle += step;
		if (angle > 360)
			angle -= 360;
		else if (angle < 0)
			angle += 360;
		s = Math_SinDeg(angle) >> shift;
		y = ((long)self->baseY << 8) + s;
	} while (--count);
	self->x = x;
	self->y = y;
	self->angle = angle;
}
