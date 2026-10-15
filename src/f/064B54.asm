; ---------------------------------------------------------------------------
; PlayerSelect_RevertCursor - put a cursor back on its saved slot (+$3D) and clear its +$33 flag
; In:  8(a6) = cursor
; Out: none
; Evidence: +$3C = +$3D, PlayerSelect_PlaceCursor; callers are cursor class methods
; ---------------------------------------------------------------------------
PlayerSelect_RevertCursor:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$3D(a4),$3C(a4)
	clr.b	$33(a4)
	move.l	a4,-(a7)
	jsr	PlayerSelect_PlaceCursor(pc)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
