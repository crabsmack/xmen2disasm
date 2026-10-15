; ---------------------------------------------------------------------------
; ExodusBlast_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a EXODUSBLAST
; In:  8(a6) = this (EXODUSBLAST object)
; Out: none
; Evidence: class descriptor EXODUSBLAST slot +$12 (tools/classes.py); TAS frames 17302-18215 (6 active)
; ---------------------------------------------------------------------------
ExodusBlast_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$6EA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	ori.w	#$7082,$6(a4)
	move.w	g_ExodusBlastSprDef(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	lea.l	$18(a7),a7
	ori.b	#$4,$2E(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	lea.l	ExodusBlast_StateStart(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	subq.b	#$2,$42(a4)
	clr.l	$94(a4)
	clr.w	$98(a4)
	move.l	a3,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
