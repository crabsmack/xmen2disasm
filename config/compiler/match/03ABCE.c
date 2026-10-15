/* RollingDiscs_ReverseAtY - reverse the rolling-disc band covering height y (velocity, or acceleration if set) */

typedef struct Band {
	short pad0;
	short top;			/* +$02 */
	char pad4[8];
	short vel;			/* +$0C */
	char padE[2];
	short accel;			/* +$10 */
	char pad12[2];
} Band;
extern short g_DiscBandCount;
extern Band *g_DiscBands;

void RollingDiscs_ReverseAtY(short y)
{
	long n;
	Band *b;

	for (n = g_DiscBandCount, b = g_DiscBands; n; n--, b++) {
		if (y > b->top && y < b->top + 128) {
			if (b->accel)
				b->accel = -b->accel;
			else
				b->vel = -b->vel;
		}
	}
}
