; ---------------------------------------------------------------------------
; sub_1FE28C
; ---------------------------------------------------------------------------
sub_1FE28C:
	jsr	$5202(a5)	; -> sub_1FE3F6
	lea.l	($C00004).l,a1
	move.w	-$1D48(a5),d0
	ori.w	#$10,d0
	move.w	d0,(a1)
	move.w	#$9340,(a1)
	move.w	#$9401,(a1)
	lea.l	-$1FDA(a5),a0
	move.l	a0,d1
	lsr.l	#$1,d1
	move.w	#$9500,d0
	move.b	d1,d0
	move.w	d0,(a1)
	move.b	#$96,d1
	rol.w	#$8,d1
	move.w	d1,(a1)
	swap	d1
	andi.w	#$7F,d1
	ori.w	#$9700,d1
	move.w	d1,(a1)
	move.l	#$70000083,-(a7)
	move.w	(a7)+,(a1)
	move.w	(a7)+,(a1)
	moveq	#$2,d0
loc_1FE2D8:
	and.w	(a1),d0
	bne.s	loc_1FE2D8
	move.w	-$1D48(a5),(a1)
	lea.l	-$7A4(a5),a0
	move.w	-$7B4(a5),d2
	bra.w	loc_1FE308
loc_1FE2EC:
	addq.w	#$8,a0
	move.w	(a0)+,(a1)
	move.w	(a0)+,(a1)
	move.w	(a0)+,(a1)
	move.w	(a0)+,(a1)
	move.w	(a0)+,(a1)
	move.w	(a0)+,(a1)
	move.w	(a0)+,(a1)
	move.w	(a0)+,(a1)
	moveq	#$2,d0
loc_1FE300:
	and.w	(a1),d0
	bne.s	loc_1FE300
	move.w	-$1D48(a5),(a1)
loc_1FE308:
	dbra	d2,loc_1FE2EC
	clr.w	-$7B4(a5)
	jsr	$520A(a5)	; -> sub_1FE434
	rts
