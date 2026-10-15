; ---------------------------------------------------------------------------
; Launcher_ClearShots - LAUNCHER: clear its four 10-byte shot slots (+$90..+$B8)
; In:  8(a6) = this
; Out: none
; Evidence: TAS 27946-30538
; Found: link-after-rts
; ---------------------------------------------------------------------------
Launcher_ClearShots:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	lea.l	$90(a3),a4
	bra.s	loc_0BE802
loc_0BE7FA:
	moveq	#$0,d0
	move.l	d0,(a4)
	lea.l	$A(a4),a4
loc_0BE802:
	lea.l	$B8(a3),a0
	cmpa.l	a4,a0
	bhi.s	loc_0BE7FA
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
