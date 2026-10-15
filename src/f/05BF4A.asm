; ---------------------------------------------------------------------------
; Boulder_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a BOULDER
; In:  8(a6) = this (BOULDER object)
; Out: none
; Evidence: class descriptor BOULDER slot +$12 (tools/classes.py); TAS frames 20650-20958 (4 active)
; ---------------------------------------------------------------------------
Boulder_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a3,-(a7)
	lea.l	$D22(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	ori.w	#$1080,$6(a3)
	move.b	#$1,$70(a3)
	move.w	-$3C6A(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	moveq	#-$4,d0
	and.b	$2E(a3),d0
	moveq	#$2,d1
	or.b	d0,d1
	move.b	d1,$2E(a3)
	moveq	#$0,d0
	move.l	d0,$B8(a3)
	clr.l	$26(a3)
	move.b	#$FF,$B1(a3)
	move.b	#$FF,$B0(a3)
	move.b	#$FF,$B2(a3)
	move.b	#$FF,$B3(a3)
	move.l	d0,$B4(a3)
	dc.w	$177C,$FF80,$00A4	; insn: move.b #$80, $a4(a3)
	clr.b	$A5(a3)
	moveq	#-$4,d1
	and.b	$A4(a3),d1
	moveq	#$2,d2
	or.b	d1,d2
	move.b	d2,$A4(a3)
	move.w	-$3C6C(a5),d1
	ext.l	d1
	lsl.l	#$2,d1
	move.l	d1,d2
	lsl.l	#$2,d1
	add.l	d2,d1
	lea.l	g_SpriteDefs(a5),a0
	lea.l	(a0,d1.w),a4
	move.l	$2(a4),$A6(a3)
	move.w	$6(a4),$AA(a3)
	move.w	$8(a4),$AC(a3)
	ori.b	#$4,$2E(a3)
	ori.b	#$4,$A4(a3)
	lea.l	$18(a7),a7
	lea.l	Boulder_StateShatter(pc),a0
	move.l	a0,$60(a3)
	move.l	a3,-(a7)
	jsr	Boulder_FindFloorBelow(pc)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	btst	#$0,d1
	addq.w	#$4,a7
	beq.s	loc_05C03C
	move.w	#$150,$16(a3)
	bra.s	loc_05C042
loc_05C03C:
	move.w	#$FEB0,$16(a3)
loc_05C042:
	movea.l	$14(a6),a0
	move.w	$6(a0),d0
	beq.s	loc_05C052
	subq.w	#$1,d0
	beq.s	loc_05C060
	bra.s	loc_05C06C
loc_05C052:
	lea.l	Boulder_StateStartRoll(pc),a0
	move.l	a0,$64(a3)
	move.l	a0,$5C(a3)
	bra.s	loc_05C06C
loc_05C060:
	lea.l	Boulder_StateStart(pc),a0
	move.l	a0,$64(a3)
	move.l	a0,$5C(a3)
loc_05C06C:
	move.w	#$4B,$6E(a3)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
