; ---------------------------------------------------------------------------
; Tuskette_StateWaitSameFloor - TUSKETTE chaser: wait until the nearest player stands on its floor segment, then start after 20 frames
; In:  8(a6) = this
; Out: d0
; Evidence: +$76 floor segment compare; next Tuskette_StateChaseStart
; ---------------------------------------------------------------------------
Tuskette_StateWaitSameFloor:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$76(a3),d0
	cmp.l	$76(a4),d0
	addq.w	#$4,a7
	bne.s	loc_05D630
	move.w	#$14,$6C(a4)
	lea.l	Tuskette_StateChaseStart(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_05D630:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
