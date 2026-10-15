; ---------------------------------------------------------------------------
; FloatBubble_ClassInit - vtable +$5E: per-level class setup for FLOATBUBBLE: load its resources (SprDef_Add) into class globals
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the FLOATBUBBLE descriptor $0AB496; TAS frames 29684-32204 (3 frames active)
; ---------------------------------------------------------------------------
FloatBubble_ClassInit:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	move.l	$8(a6),-(a7)
	jsr	FloatBubble_Nop6A(pc)
	moveq	#$1,d3
	moveq	#$0,d0
	move.b	g_ScnSavageC1(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	beq.s	loc_0ABB90
	moveq	#$0,d0
	move.b	g_ScnSavageB1(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	beq.s	loc_0ABB90
	moveq	#$0,d3
loc_0ABB90:
	tst.b	d3
	beq.s	loc_0ABB98
	moveq	#$0,d0
	bra.s	loc_0ABB9A
loc_0ABB98:
	moveq	#$2,d0
loc_0ABB9A:
	move.w	d0,d7
	ext.l	d7
	move.l	d7,-(a7)
	lea.l	$1ACA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3C3A(a5)
	lea.l	$C(a7),a7
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
