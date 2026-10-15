/* AvalonA2_PlacePlayers - place the players at the AvalonA2 start and set two scene values to $300 */

extern short g_RetractFloorDepth;
extern short g_FloatFallSpeed;
void Players_PlaceAtStart();

void AvalonA2_PlacePlayers(void)
{
	Players_PlaceAtStart(0, 0, 0, 0);
	g_RetractFloorDepth = 0x300;
	g_FloatFallSpeed = g_RetractFloorDepth;
}
