; ---------------------------------------------------------------------------
; ToxicCan_ClassInit - TOXICCAN slot +$5E: calls the empty ToxicCan_NopStatic
; In:  none
; Out: none
; Evidence: only body is the call
; ---------------------------------------------------------------------------
ToxicCan_ClassInit:
	link.w	a6,#$0
	jsr	ToxicCan_NopStatic(pc)
	unlk	a6
	rts
