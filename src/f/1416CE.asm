; ---------------------------------------------------------------------------
; Tank_ClassInit - TANK slot +$5E: register the tank sprite definition for the level
; In:  none
; Out: none
; Evidence: $FFE790 = SprDef_Add(def at $14018E, 3)
; ---------------------------------------------------------------------------
Tank_ClassInit:
	link.w	a6,#$0
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$3BCA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_TankSprDef(a5)
	unlk	a6
	rts
