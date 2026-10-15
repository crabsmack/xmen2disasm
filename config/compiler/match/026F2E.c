/* RetractFloor_StateKill - last state: kill itself (class slot +$52 Kill) */

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

typedef struct Object { Class *cls; } Object;

void RetractFloor_StateKill(Object *self)
{
	(*self->cls->method[19])(self);
}
