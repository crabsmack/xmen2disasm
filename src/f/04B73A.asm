; ---------------------------------------------------------------------------
; Apocalypse_ActStartBombs - APOCALYPSE script action: speed up the bombs (+$AC += 2, max $180), set up the bomb class and start dropping the current pattern
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: ApocBomb_SetSpeed(+$B0, speed, +$AF) (APOCBOMB setup); Apocalypse_SelectBombPattern; next Apocalypse_StateDropBombs
; ---------------------------------------------------------------------------
Apocalypse_ActStartBombs:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.w	#$180,$AC(a4)
	bge.s	loc_04B750
	addq.w	#$2,$AC(a4)
loc_04B750:
	moveq	#$0,d0
	move.b	$AF(a4),d0
	move.l	d0,-(a7)
	move.w	$AC(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	$B0(a4),d0
	move.l	d0,-(a7)
	jsr	$B8A(a5)	; -> ApocBomb_SetSpeed
	move.l	a4,-(a7)
	jsr	Apocalypse_SelectBombPattern(pc)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	Apocalypse_StateDropBombs(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
