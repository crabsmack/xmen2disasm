; ---------------------------------------------------------------------------
; Tower_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a TOWER
; In:  8(a6) = this (TOWER object)
; Out: none
; Evidence: class descriptor TOWER slot +$12 (tools/classes.py); TAS frames 10621-12742 (10 active)
; ---------------------------------------------------------------------------
Tower_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3EA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$40A(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	lea.l	Tower_StateIdle(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	ori.w	#$83,$6(a4)
	move.w	$2(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	$4(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.l	a3,d0
	lea.l	$10(a7),a7
	beq.s	loc_01AB7C
	moveq	#$2,d0
	cmp.w	$6(a3),d0
	bne.s	loc_01AB62
	lea.l	$402(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addi.l	#$FFFFD900,$C(a4)
	addq.w	#$8,a7
	bra.s	loc_01AB8C
loc_01AB62:
	lea.l	$3FA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addi.l	#$FFFFD900,$C(a4)
	addq.w	#$8,a7
	bra.s	loc_01AB8C
loc_01AB7C:
	lea.l	$3F2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
loc_01AB8C:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
