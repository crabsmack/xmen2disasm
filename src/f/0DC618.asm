; ---------------------------------------------------------------------------
; Barrier_ClassInit - per-level class setup: Barrier_NopStatic, then SprDef_Add sprite set jt $24D2 into g_BarrierSprDef (BARRIER override of slot +$5E ClassInit)
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Out: none
; Evidence: slot +$5E of the BARRIER descriptor $0DCAAA; TAS frames 9712-9712 (1 frames active)
; ---------------------------------------------------------------------------
Barrier_ClassInit:
	link.w	a6,#$0
	jsr	Barrier_NopStatic(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$24D2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_BarrierSprDef(a5)
	unlk	a6
	rts
