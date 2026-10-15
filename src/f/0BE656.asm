; ---------------------------------------------------------------------------
; Barbarian_EndHurt - BARBARIAN slot +$76 EndHurt: parent EndHurt, restore the saved flags; if it was walking re-engage after 5 frames
; In:  8(a6) = this
; Out: none
; Evidence: XNPC slot +$76; jt 1053; TAS 28028-33033
; Found: jt 1053
; ---------------------------------------------------------------------------
Barbarian_EndHurt:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$211A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$76(a0),a1
	jsr	(a1)
	move.w	#$5000,d0
	and.w	$96(a4),d0
	or.w	d0,$6(a4)
	tst.b	$BF(a4)
	beq.s	loc_0BE69C
	lea.l	Barbarian_StateEngage(pc),a0
	move.l	a0,$5C(a4)
	move.w	#$5,$6C(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
loc_0BE69C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
