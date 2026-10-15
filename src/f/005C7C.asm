; ---------------------------------------------------------------------------
; sub_005C7C	[jt 2]
; ---------------------------------------------------------------------------
sub_005C7C:
	link.w	a6,#$0
	clr.w	-$3B94(a5)
	dc.w	$1B7C,$FFFF,$C444	; insn: move.b #$ff, -$3bbc(a5)
	moveq	#$0,d0
	move.l	d0,-$1758(a5)
	clr.w	-$1754(a5)
	move.w	#$9,-$38A8(a5)
	clr.w	-$3B96(a5)
	dc.w	$1B7C,$FFFF,$C445	; insn: move.b #$ff, -$3bbb(a5)
	move.l	d0,-$1848(a5)
	clr.w	-$1844(a5)
	move.w	#$9,-$38AA(a5)
	moveq	#$0,d1
	move.b	-$3B70(a5),d1
	move.w	d1,-$359C(a5)
	move.b	#$1,-$38C2(a5)
	unlk	a6
	rts
