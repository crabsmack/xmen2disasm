/* Psylocke_AfterState - the parent's post-state hook (slot +$72) */

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
extern void Tbl_Psylocke_vtable();

void Psylocke_AfterState(Object *self)
{
	(*CLASS(Tbl_Psylocke_vtable)->parent->method[27])(self);
}
