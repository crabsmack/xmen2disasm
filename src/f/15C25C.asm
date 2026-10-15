; ---------------------------------------------------------------------------
; sub_15C25C
; ---------------------------------------------------------------------------
sub_15C25C:
	tst.l	d0
	bmi.s	loc_15C274
	tst.l	d1
	bmi.s	loc_15C26A
	jsr	sub_15C2AC(pc)
	rts
loc_15C26A:
	neg.l	d1
	jsr	sub_15C2AC(pc)
	neg.l	d1
	rts
loc_15C274:
	neg.l	d0
	tst.l	d1
	bmi.s	loc_15C284
	jsr	sub_15C2AC(pc)
	neg.l	d0
	neg.l	d1
	rts
loc_15C284:
	neg.l	d1
	jsr	sub_15C2AC(pc)
	neg.l	d0
	rts
