; ---------------------------------------------------------------------------
; Pad_GetP1Clean - pad 1 raw buttons with impossible Up+Down / Left+Right pairs cleared
; In:  none
; Out: d0 = word: buttons
; Evidence: word -$7A8(a5); if bits 0-1 both set clears them, same for bits 2-3; tail shared with Pad_GetP2Clean
; ---------------------------------------------------------------------------
Pad_GetP1Clean:
	move.w	-$7A8(a5),d0
	bra.s	loc_1FE022
