; ---------------------------------------------------------------------------
; Tusk_UnlockArena - install Tusk_HookReturn0 as the scene hook and clear byte +2 of both TUSK floor segments
; In:  8(a6) = Tusk
; Out: none
; Evidence: segments +$90/+$94; called by Tusk_StateStartFight
; ---------------------------------------------------------------------------
Tusk_UnlockArena:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	Tusk_HookReturn0(pc),a0
	move.l	a0,g_SegTypeHooks+$50(a5)
	movea.l	$90(a4),a0
	clr.b	$2(a0)
	movea.l	$94(a4),a0
	clr.b	$2(a0)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
