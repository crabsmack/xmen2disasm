; ---------------------------------------------------------------------------
; sub_04C332	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04C332:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	move.l	#$FFFFD800,-(a7)
	move.l	#$F600,-(a7)
	jsr	$BEA(a5)	; -> sub_04EAC8
	movea.l	-$4(a6),a4
	unlk	a6
	rts
