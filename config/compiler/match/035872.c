typedef struct Class {
	short nameOffset;
	struct Class *parent;
	void (*method[32])();
} Class;
typedef struct { Class *cls; } Object;

extern short g_SceneVar3B02;
extern Object *g_Camera;

void AvalonA4_ClearCameraZone(short n)
{
	short bit;

	switch (n) {
	case 0: bit = 1; break;
	case 1: bit = 2; break;
	case 2: bit = 4; break;
	case 3: bit = 8; break;
	case 4: bit = 0x10; break;
	case 5: bit = 0x20; break;
	}
	g_SceneVar3B02 &= !bit;
	(*g_Camera->cls->method[13])(g_Camera);
}
