/* Spr_EndFrame - terminate this frame's sprite list (link byte 0 on the last used slot).
   The ?: is compiled the MPW C 3.2.4+ way (scc d3 / neg.b d3 / beq); MPW C 3.2 branches on the compare */

typedef struct Sprite { short y; char size; char link; short tile; short x; } Sprite;
extern short g_SprIndex, g_SprLast;
extern Sprite g_SpriteTable[];

void Spr_EndFrame(void)
{
	g_SprIndex = g_SprIndex == 80 ? 79 : g_SprIndex;
	g_SpriteTable[g_SprIndex].link = 0;
	g_SprLast = g_SprIndex;
}
