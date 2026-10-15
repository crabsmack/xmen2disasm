; ---------------------------------------------------------------------------
; BrainRocket_Init - BRAINROCKET constructor: parent Init, no motion, 6 px lower, state BrainRocket_StateLaunch, sprite Art_BrainRocketSpr (palette 1), damage byte +$70 = 1, flags |= $8A, +$42 = $60, frame $FF, target +$92 = 0 (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = placement entry or 0
; Out: none
; Evidence: method 3 of class descriptor $133CFC (name string "BRAINROCKET", parent ACTOR)
; ---------------------------------------------------------------------------
BrainRocket_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$361A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	addi.l	#$600,$C(a4)
	addq.w	#$6,$12(a4)
	lea.l	BrainRocket_StateLaunch(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	lea.l	$35B2(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.b	#$1,$70(a4)
	ori.w	#$8A,$6(a4)
	move.b	#$60,$42(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	clr.l	$92(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
