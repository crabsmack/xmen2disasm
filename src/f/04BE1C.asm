; ---------------------------------------------------------------------------
; Apocalypse_ActGoRight - APOCALYPSE script action: face right and move to (400, 140), then approach the player
; In:  8(a6) = this
; Out: none
; Evidence: Apocalypse_MoveTo($19000, $8C00, +$9E)
; ---------------------------------------------------------------------------
Apocalypse_ActGoRight:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	#$19000,d6
	move.l	#$8C00,d7
	andi.b	#$EF,$2E(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.b	$9E(a4),d0
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	jsr	Apocalypse_MoveTo(pc)
	lea.l	Apocalypse_StateApproach(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Apocalypse_StateApproach(pc)
	lea.l	$1C(a7),a7
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
