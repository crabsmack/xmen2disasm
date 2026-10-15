; ---------------------------------------------------------------------------
; ThronePhone_EmptyHelper - empty helper called from sub_037F7E (THRONEPHONE code, before Scene_EndAfter)
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
ThronePhone_EmptyHelper:
	link.w	a6,#$0
	unlk	a6
	rts
