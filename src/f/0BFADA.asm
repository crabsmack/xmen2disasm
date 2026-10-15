; ---------------------------------------------------------------------------
; SwampBubbles_Init - parent Init, then flags |= $408A, sprite def jt $238A (palette 0), +$8C = 0, bubble count +$8E = 1, state SwampBubbles_StateIdle (+$5C/+$64) (SWAMPBUBBLES override of slot +$12 Init)
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Out: none
; Evidence: slot +$12 of the SWAMPBUBBLES descriptor $0BFCE4; never runs in the corpus
; ---------------------------------------------------------------------------
SwampBubbles_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2242(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	ori.w	#$408A,$6(a4)
	lea.l	$10(a7),a7
	lea.l	$238A(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	clr.w	$8C(a4)
	move.b	#$1,$8E(a4)
	lea.l	SwampBubbles_StateIdle(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
