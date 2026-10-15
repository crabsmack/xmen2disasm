; ---------------------------------------------------------------------------
; Psylocke_AfterState - PSYLOCKE slot +$72: just the parent post-state hook
; In:  8(a6) = player
; Out: none
; Evidence: calls XPLAYER +$72 via lea jt / 2(a0)
; ---------------------------------------------------------------------------
Psylocke_AfterState:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	lea.l	$2BAA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	unlk	a6
	rts
