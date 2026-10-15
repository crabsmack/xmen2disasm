; ---------------------------------------------------------------------------
; SmallBrood_StateArmed - SMALLBROOD state: arm - start a 100-frame fuse (+$6E) and begin flashing
; In:  8(a6) = this
; Out: d0
; Evidence: +$6E = 100 (ACTOR Update counts it down), state SmallBrood_StateFlash
; Found: link-after-rts
; ---------------------------------------------------------------------------
SmallBrood_StateArmed:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$64,$6E(a4)
	clr.w	$6C(a4)
	lea.l	SmallBrood_StateFlash(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
