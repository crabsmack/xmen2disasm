; ---------------------------------------------------------------------------
; Seg_InitDefaults - initialise a floor-segment record: in use, type, layer, no neighbours, placeholder endpoints
; In:  8(a6) = segment  $F(a6) = byte type  $13(a6) = byte layer
; Out: none
; Evidence: +0 = $A0, +1 type, +2 layer, +3/+4 = 0, +$10/+$11 = $FF (no prev/next), endpoints (-100,-100)-(-90,-90), +$12 = $FE, +$13 = $FF; used by Seg_Setup
; ---------------------------------------------------------------------------
Seg_InitDefaults:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	dc.w	$18BC,$FFA0	; insn: move.b #$a0, (a4)
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
	dc.w	$197C,$FFFE,$0012	; insn: move.b #$fe, $12(a4)
	move.b	#$FF,$13(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
