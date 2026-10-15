; ---------------------------------------------------------------------------
; Apocalypse_Deactivate - vtable +$46: deactivate a APOCALYPSE
; In:  8(a6) = this (APOCALYPSE object)
; Out: none
; Evidence: class descriptor APOCALYPSE slot +$46 (tools/classes.py); TAS frames 27245-27245 (1 active)
; ---------------------------------------------------------------------------
Apocalypse_Deactivate:
	link.w	a6,#$0
	movem.l	d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$92(a4),a3
	move.l	a4,-(a7)
	lea.l	$B3A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	andi.b	#$DF,(a3)
	move.w	$6(a3),d5
	move.w	$8(a3),d6
	moveq	#$2,d7
	movea.l	-$34A6(a5),a0
	movea.l	$8(a0),a4
	addq.w	#$4,a7
	bra.s	loc_04CD1A
loc_04CCDE:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_04CD0A
	cmp.w	$34(a4),d5
	bge.s	loc_04CD0A
	pea.l	$2E(a4)
	jsr	$5072(a5)	; -> sub_1FB126
	sub.w	d6,$34(a4)
	addq.w	#$4,a7
loc_04CD0A:
	addq.w	#$1,d7
	move.w	d7,d0
	ext.l	d0
	movea.l	-$34A6(a5),a0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_04CD1A:
	cmp.w	-$13F2(a5),d7
	blt.s	loc_04CCDE
	sub.w	d6,-$3598(a5)
	move.b	#$FF,$D(a3)
	move.b	#$FF,$C(a3)
	movem.l	-$14(a6),d5-d7/a3-a4
	unlk	a6
	rts
