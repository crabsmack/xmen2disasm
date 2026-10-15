; ---------------------------------------------------------------------------
; Apocalypse_ActFlyOff - APOCALYPSE script action: fly up off the screen (to 256, -20)
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: Apocalypse_MoveTo($10000, -$1400, 5); next Apocalypse_StateFlyOffWait
; ---------------------------------------------------------------------------
Apocalypse_ActFlyOff:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$5,d0
	move.l	d0,-(a7)
	move.l	#$FFFFEC00,-(a7)
	move.l	#$10000,-(a7)
	move.l	a4,-(a7)
	jsr	Apocalypse_MoveTo(pc)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	Apocalypse_StateFlyOffWait(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
