/* Boulder_Deactivate - only calls the parent class's Deactivate (slot +$46) */

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
extern void Tbl_Boulder_vtable();

void Boulder_Deactivate(Object *self)
{
	(*CLASS(Tbl_Boulder_vtable)->parent->method[16])(self);
}
