; ---------------------------------------------------------------------------
; Cyclops_GetSize - CYCLOPS slot +$06: return sizeof(Cyclops object) = $E2
; In:  none
; Out: d0 = $E2
; Evidence: vtable CYCLOPS $11398E; beam fields +$BC sprite instance .. +$E0 beam active
; ---------------------------------------------------------------------------
Cyclops_GetSize:
	link.w	a6,#$0
	move.l	#$E2,d0
	unlk	a6
	rts
