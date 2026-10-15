; ---------------------------------------------------------------------------
; ICandy_SetSpriteDef - ICandy: copy sprite-definition fields (frames pointer, tile base, palette bits) from resource slot N
; In:  8(a6) = this  $F(a6) = byte resource index
; Out: none
; Evidence: table g_SpriteDefs / $FFC97C-$FFC982 + idx*$14 -> +$1E/+$22/+$24, +$1C bits 0-1
; ---------------------------------------------------------------------------
ICandy_SetSpriteDef:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d0
	move.b	$F(a6),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	lea.l	(a0,d0.w),a4
	move.l	$2(a4),$1E(a3)
	move.w	$6(a4),$22(a3)
	move.w	$8(a4),$24(a3)
	andi.b	#$FC,$1C(a3)
	moveq	#$3,d0
	and.b	(a4),d0
	or.b	d0,$1C(a3)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
