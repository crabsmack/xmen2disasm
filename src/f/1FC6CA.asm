; ---------------------------------------------------------------------------
; sub_1FC6CA
; ---------------------------------------------------------------------------
sub_1FC6CA:
	tst.b	-$C61(a5)
	bmi.s	loc_1FC6E4
	beq.s	loc_1FC6E2
	movem.l	d3-d7/a1-a4,-(a7)
	jsr	sub_1FC6F6(pc)
	move.b	d0,-$C61(a5)
	movem.l	(a7)+,d3-d7/a1-a4
loc_1FC6E2:
	rts
loc_1FC6E4:
	movem.l	d3-d7/a1-a4,-(a7)
	jsr	sub_1FC708(pc)
	move.b	d0,-$C61(a5)
	movem.l	(a7)+,d3-d7/a1-a4
	rts
