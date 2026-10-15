; ---------------------------------------------------------------------------
; RThetaObject_Init - RThetaObject: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $118C8E (name string "RTHETAOBJECT", parent ACTOR)
; ---------------------------------------------------------------------------
RThetaObject_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2E62(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$20(a4)
	clr.l	$8C(a4)
	move.w	#$1000,$90(a4)
	moveq	#$0,d0
	move.l	d0,$92(a4)
	move.l	d0,$96(a4)
	move.l	d0,$9A(a4)
	andi.w	#$BFFF,$4(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
