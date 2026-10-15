; ---------------------------------------------------------------------------
; LittleLeg_SetWalking - LITTLELEG: switch the walking animation on/off (three leg sprites)
; In:  8(a6) = this, $C(a6) = byte: 1 = walking
; Out: none
; Evidence: on a change to non-zero sets the animation pointers of the three sprite instances (+$E/+$2A/+$46) to jt[$165A]/[$1662]/[$166A] and resets their counters; +$C holds the flag; 8 callers in the BROODBOSS code
; Found: link-after-rts
; ---------------------------------------------------------------------------
LittleLeg_SetWalking:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.b	$F(a6),d7
	movea.l	$8(a6),a4
	cmp.b	$C(a4),d7
	beq.s	loc_085C54
	move.b	d7,$C(a4)
	moveq	#$0,d0
	move.b	$C(a4),d0
	tst.l	d0
	beq.s	loc_085C54
	lea.l	$145A(a5),a0
	move.l	$2(a0),$E(a4)
	clr.l	$12(a4)
	movea.l	$E(a4),a0
	move.b	$7(a0),$17(a4)
	lea.l	$1462(a5),a0
	move.l	$2(a0),$2A(a4)
	clr.l	$2E(a4)
	movea.l	$2A(a4),a0
	move.b	$7(a0),$33(a4)
	lea.l	$146A(a5),a0
	move.l	$2(a0),$46(a4)
	clr.l	$4A(a4)
	movea.l	$46(a4),a0
	move.b	$7(a0),$4F(a4)
loc_085C54:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
