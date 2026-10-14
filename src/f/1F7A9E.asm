; ---------------------------------------------------------------------------
; sub_1F7A9E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F7A9E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	dc.w	$18BC,$FFA0	; move.b #$a0, (a4)
	move.b	$F(a6),$1(a4)
	move.b	$13(a6),$2(a4)
	clr.b	$3(a4)
	clr.w	$4(a4)
	move.b	#$FF,$10(a4)
	move.b	#$FF,$11(a4)
	move.w	#$FF9C,$8(a4)
	move.w	#$FF9C,$A(a4)
	move.w	#$FFA6,$C(a4)
	move.w	#$FFA6,$E(a4)
	dc.w	$197C,$FFFE,$0012	; move.b #$fe, $12(a4)
	move.b	#$FF,$13(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
