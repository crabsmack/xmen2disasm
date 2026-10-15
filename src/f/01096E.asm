; ---------------------------------------------------------------------------
; BigAcolyte_LoadSprite - level-load callback: add the BIGACOLYTE debris sprite definition and store its id
; In:  none
; Out: none
; Evidence: SprDef_Add(jt $21F3E, 0) -> word at (-$3CDA)+4; registered with Spr_ReloadDefs by BigAcolyte_ActAppear
; ---------------------------------------------------------------------------
BigAcolyte_LoadSprite:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$4F2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	movea.l	g_BigAcolyteDebris(a5),a0
	move.w	d0,$4(a0)
	unlk	a6
	rts
