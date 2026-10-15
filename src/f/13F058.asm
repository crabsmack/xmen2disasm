; ---------------------------------------------------------------------------
; Pop_ClassInit - does nothing: only calls the empty sub_13F282 (this class's override of: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; ClassList_InitAll))
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $13F28A (name string "POP", parent ACTOR)
; ---------------------------------------------------------------------------
Pop_ClassInit:
	link.w	a6,#$0
	jsr	sub_13F282(pc)
	unlk	a6
	rts
