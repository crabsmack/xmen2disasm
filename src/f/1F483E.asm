; ---------------------------------------------------------------------------
; Boot_StartApp - after the hardware/region checks: set A5 = $200, run the cold-start init on a fresh power-up, then jump to the main entry at ($21C)
; In:  none
; Out: does not return
; Evidence: lea $200,a5; if word $A10008 (port 1 control) is 0 calls jt $2A (sub_005458); pushes ($21C) = sub_005466 and rts
; ---------------------------------------------------------------------------
Boot_StartApp:
	lea.l	($200).w,a5
	tst.w	($A10008).l
	bne.s	loc_1F484E
	jsr	$2A(a5)	; -> unk_Boot_005458
loc_1F484E:
	move.l	($21C).w,-(a7)
	rts
