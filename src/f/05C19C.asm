; ---------------------------------------------------------------------------
; Tusk_HookReturn0 - scene hook in -$321A after the TUSK arena opens: always 0
; In:  none
; Out: d0 = 0
; Evidence: installed by Tusk_UnlockArena
; ---------------------------------------------------------------------------
Tusk_HookReturn0:
	link.w	a6,#$0
	moveq	#$3,d0
	cmp.w	$A(a6),d0
	bne.s	loc_05C1AC
	moveq	#$0,d0
	bra.s	loc_05C1AE
loc_05C1AC:
	moveq	#$0,d0
loc_05C1AE:
	unlk	a6
	rts
