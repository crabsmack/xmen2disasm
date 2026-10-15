; ---------------------------------------------------------------------------
; BioBalls_IsDone - has the BIOBALLS object finished its formation (byte +$96); a missing object counts as done
; In:  8(a6) = bioballs or 0
; Out: d0.b
; Evidence: 7 callers in XCLONE/EVIL* code waiting on their balls form
; ---------------------------------------------------------------------------
BioBalls_IsDone:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,d0
	beq.s	loc_11F19C
	move.b	$96(a4),d0
	bra.s	loc_11F19E
loc_11F19C:
	moveq	#$1,d0
loc_11F19E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
