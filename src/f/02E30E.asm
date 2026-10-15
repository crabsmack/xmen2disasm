; ---------------------------------------------------------------------------
; ExodusBlast_ClassInit - per-level class setup: call ExodusBlast_NopStatic, then SprDef_Add sprite set jt $5FA into -$3CB2 (EXODUSBLAST override of slot +$5E ClassInit)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor EXODUSBLAST slot +$5E (tools/classes.py); TAS frames 17191-17191 (1 active)
; ---------------------------------------------------------------------------
ExodusBlast_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	ExodusBlast_NopStatic(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$5FA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_ExodusBlastSprDef(a5)
	unlk	a6
	rts
