; ---------------------------------------------------------------------------
; Blast_ClassInit - per-level class setup: SprDef_Add the barrier sprite set jt $24D2 into g_BarrierSprDef (palette 0) and the zap set jt $3F72 into g_BlastSprDef (palette 1) (BLAST override of slot +$5E ClassInit)
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Out: none
; Evidence: slot +$5E of the BLAST descriptor $0DD0E8; TAS frames 2509-5203 (2 frames active)
; ---------------------------------------------------------------------------
Blast_ClassInit:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$24D2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_BarrierSprDef(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$3F72(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_BlastSprDef(a5)
	unlk	a6
	rts
