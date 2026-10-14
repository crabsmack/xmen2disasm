; ---------------------------------------------------------------------------
; loc_065CBC
; ---------------------------------------------------------------------------
loc_065CBC:
	moveq	#$0,d0
	move.l	d0,-$1758(a5)
	clr.w	-$1754(a5)
	dc.w	$1B7C,$FFFF,$C444	; move.b #$ff, -$3bbc(a5)
	movea.l	-$3B2C(a5),a0
	move.b	-$3BBB(a5),d0
	cmp.b	$3C(a0),d0
	beq.s	loc_065CF2
	moveq	#-$1,d0
	cmp.b	-$3BBB(a5),d0
	bne.s	loc_065CE8
	move.w	#$700,-$3B96(a5)
loc_065CE8:
	movea.l	-$3B2C(a5),a0
	move.b	$3C(a0),-$3BBB(a5)
loc_065CF2:
	move.w	#$C000,-$1844(a5)
	move.b	-$3BBB(a5),d0
	bmi.s	loc_065D74
	cmpi.b	#$6,d0
	bgt.s	loc_065D74
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$65D12(pc,d1.w),d1
	jmp	$65D10(pc,d1.w)
