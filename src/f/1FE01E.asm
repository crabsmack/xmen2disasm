; ---------------------------------------------------------------------------
; Pad_GetP2Clean - pad 2 raw buttons with impossible Up+Down / Left+Right pairs cleared
; In:  none
; Out: d0 = word: buttons
; Evidence: same as Pad_GetP1Clean on word -$7A6(a5)
; ---------------------------------------------------------------------------
Pad_GetP2Clean:
	move.w	-$7A6(a5),d0
loc_1FE022:
	move.w	d0,d1
	moveq	#$3,d2
	and.w	d2,d1
	cmp.w	d2,d1
	bne.s	loc_1FE02E
	eor.w	d2,d0
loc_1FE02E:
	move.w	d0,d1
	moveq	#$C,d2
	and.w	d2,d1
	cmp.w	d2,d1
	bne.s	loc_1FE03A
	eor.w	d2,d0
loc_1FE03A:
	rts
