/* XPlayer_AirSpecialUp - Up+A in the air = the neutral air special (slot +$C6).
   The state change is a macro: do { state = f; f(obj); } while (0), which is why the
   compiler keeps the final stack pop and loads the method twice */

/* The game's object system: an object starts with its class descriptor pointer; a descriptor
   is {word name offset; parent; method slots from +6}. Descriptors live in code segments and C
   names them as code (a jump-table entry); the descriptor's real address is the jmp target at
   entry+2. */
typedef struct Class {
	short nameOffset;
	struct Class *parent;
	void (*method[64])();
} Class;
#define CLASS(code)	(*(Class **)((char *)(code) + 2))

typedef struct Object { Class *cls; char pad[0x58]; void (*state)(); } Object;
#define GOTO_STATE(obj, f)	do { (obj)->state = (f); (*(f))(obj); } while (0)

void XPlayer_AirSpecialUp(Object *self)
{
	GOTO_STATE(self, self->cls->method[48]);
}
