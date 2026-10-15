; ---------------------------------------------------------------------------
; Mine_StatePickTarget - mine state: choose the nearest live player as target and watch it for 60 frames
; In:  8(a6) = mine record
; Out: d0 = target or 0
; Evidence: Player_NearestLive -> +$20; non-zero: +$1E = 60, +$18 = Mine_StateWatch
; ---------------------------------------------------------------------------
Mine_StatePickTarget:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EB2(a5)	; -> Player_NearestLive
	move.l	d0,$20(a4)
	movea.l	d0,a3
	move.l	a3,d0
	addq.w	#$4,a7
	beq.s	loc_13AC36
	move.w	#$3C,$1E(a4)
	lea.l	Mine_StateWatch(pc),a0
	move.l	a0,$18(a4)
	clr.w	$1C(a4)
loc_13AC36:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
