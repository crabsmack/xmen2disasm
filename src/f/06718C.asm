; ---------------------------------------------------------------------------
; ScalingActor_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a SCALINGACTOR
; In:  8(a6) = this (SCALINGACTOR object)
; Out: none
; Evidence: class descriptor SCALINGACTOR slot +$12 (tools/classes.py); TAS frames 2346-49027 (21 active)
; ---------------------------------------------------------------------------
ScalingActor_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$FCA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	PortraitActor_StateInit(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	move.w	#$1,$68(a4)
	move.b	#$1,$70(a4)
	moveq	#$0,d0
	move.l	d0,$30(a4)
	moveq	#-$4,d1
	and.b	$2E(a4),d1
	moveq	#$1,d2
	or.b	d1,d2
	move.b	d2,$2E(a4)
	ori.w	#$1080,$6(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.l	$14(a6),$8C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
