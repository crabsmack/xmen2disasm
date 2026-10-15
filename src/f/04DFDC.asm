; ---------------------------------------------------------------------------
; ApocBomb_ClassInit - per-level class setup: ApocBomb_NopStatic, SprDef_Add sprite set jt $B42 into -$3C6E, then ApocBomb_StartAccelTimer (APOCBOMB override of slot +$5E ClassInit)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor APOCBOMB slot +$5E (tools/classes.py); TAS frames 24044-24044 (1 active)
; ---------------------------------------------------------------------------
ApocBomb_ClassInit:
	link.w	a6,#$0
	jsr	ApocBomb_NopStatic(pc)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$B42(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_ApocBombSprDef(a5)
	jsr	ApocBomb_StartAccelTimer(pc)
	unlk	a6
	rts
