; ---------------------------------------------------------------------------
; Boulder_StateShatter - BOULDER hit: split into three pieces, frame 4, invulnerable, then let the pieces fall
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: Boulder_SplitIntoPieces; +6 |= $1000; +$6A = 1000; next Boulder_StatePiecesFall
; ---------------------------------------------------------------------------
Boulder_StateShatter:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	Boulder_SplitIntoPieces(pc)
	ori.w	#$1000,$6(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.w	#$3E8,$6A(a4)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	Boulder_StatePiecesFall(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
