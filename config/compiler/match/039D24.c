/* BanimazaDoor_PushCallback - collision callback of BANIMAZADOOR: for event 3, an object
   overlapping the rectangle is pushed 2 px out to the nearer side. */

typedef struct { char pad[8]; short left, top, right, bottom; } Box;
typedef struct { char pad[8]; long x; char pad2[0x40]; short l, t, r, b; } Obj;
typedef struct { char pad[3]; char dx, b4, dy, b6; } Push;

short BanimazaDoor_PushCallback(short event, Box *box, Obj *obj, Push *push)
{
	short ox, mid;

	if (event == 3) {
		if (obj->t <= box->right && obj->b >= box->left && obj->l <= box->bottom && obj->r >= box->top) {
			ox = obj->x >> 8;
			mid = (box->left + box->right) >> 1;
			if (ox < mid) {
				push->dx = -2;
				push->dy = -2;
			} else {
				push->dx = 2;
				push->dy = 2;
			}
			push->b4 = 0;
			push->b6 = 0;
			return 2;
		}
		return 1;
	}
	return 0;
}
