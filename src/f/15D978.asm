; ---------------------------------------------------------------------------
; Actor_ClassInit - ACTOR slot +$5E: per-level class initialisation (empty for ACTOR itself)
; In:  8(a6) = 0   $C(a6) = class index
; Out: none
; Evidence: link/unlk/rts; ClassList_InitAll calls slot +$5E for every class in g_ClassList
; ---------------------------------------------------------------------------
Actor_ClassInit:
	link.w	a6,#$0
	unlk	a6
	rts
