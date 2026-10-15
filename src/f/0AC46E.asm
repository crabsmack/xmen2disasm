; ---------------------------------------------------------------------------
; PerimeterDoor_Init - vtable +$12 constructor: door at tile (x/32 - 1, y/32 - 1), solid-block id from placement +6; register as the scene's door (-$3C38)
; Evidence: +$90/+$8E tile column/row, +$8C block id; first state PerimeterDoor_StateStart; TAS 31695-32936
; ---------------------------------------------------------------------------
PerimeterDoor_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1BBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$30(a4)
	ori.w	#$5083,$6(a4)
	clr.w	$20(a4)
	lea.l	PerimeterDoor_StateStart(pc),a0
	move.l	a0,$5C(a4)
	lea.l	PerimeterDoor_StateStart(pc),a0
	move.l	a0,$64(a4)
	move.w	$4(a3),d1
	asr.w	#$5,d1
	subq.w	#$1,d1
	move.w	d1,$8E(a4)
	move.w	$2(a3),d1
	asr.w	#$5,d1
	subq.w	#$1,d1
	move.w	d1,$90(a4)
	move.w	$6(a3),$8C(a4)
	move.l	a4,-$3C38(a5)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
