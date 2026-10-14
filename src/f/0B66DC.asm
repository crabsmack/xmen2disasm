; ---------------------------------------------------------------------------
; sub_0B66DC	[jt 917]
; ---------------------------------------------------------------------------
sub_0B66DC:
	link.w	a6,#$0
	movea.l	-$3B14(a5),a0
	move.b	#$2,(a0)
	movea.l	-$3B14(a5),a0
	clr.b	$1(a0)
	movea.l	-$3B14(a5),a0
	move.b	#$2,$2(a0)
	movea.l	-$3B14(a5),a0
	move.b	#$5,$3(a0)
	movea.l	-$3B14(a5),a0
	move.b	#$A,$4(a0)
	movea.l	-$3B14(a5),a0
	move.b	#$F,$5(a0)
	movea.l	-$3B14(a5),a0
	move.b	#$1E,$6(a0)
	movea.l	-$3B14(a5),a0
	move.b	#$FF,$7(a0)
	move.w	#$32,-$3B02(a5)
	move.w	-$3B02(a5),-$3B04(a5)
	clr.w	-$3B06(a5)
	unlk	a6
	rts
