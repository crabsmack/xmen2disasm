; ---------------------------------------------------------------------------
; Pad_IsP2Connected - test whether a pad is plugged into port 2
; In:  none
; Out: d0 = $FF if word -$7A6(a5) bit 15 is clear (pad present), else 0
; Evidence: Pad_ReadPort returns $8000 for no pad; caller sub_1FA124 (TAS frames 165-263)
; ---------------------------------------------------------------------------
Pad_IsP2Connected:
	moveq	#$0,d0
	tst.w	-$7A6(a5)
	spl.b	d0
	rts
