; ---------------------------------------------------------------------------
; SporeMine_ClassInit - vtable +$5E: per-level class setup for SPOREMINE: create the spore pool and load the spore resources (g_SporeMineSprDef)
; ---------------------------------------------------------------------------
SporeMine_ClassInit:
	link.w	a6,#$0
	jsr	SporeMine_InitPool(pc)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$237A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_SporeMineSprDef(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
