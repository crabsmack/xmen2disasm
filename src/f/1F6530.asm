; ---------------------------------------------------------------------------
; Obj_Detach - detach an object from the parent object it rides, keeping the combined velocity, and unlink it from its siblings
; In:  8(a6) = object
; Out: d0 = 0
; Evidence: parent = object table[-$34A6][+$3A]; velocities +$16/+$18 combined with the parent's (sub_1F6EC4 when flag $1000 clear); Timer_Start(+$7C); fixes parent +$3B and sibling +$3C/+$3D links; flags +4: clear $800, set $1000; +$76 = 0, +$3A/+$3C/+$3D = $FF; 28 callers
; ---------------------------------------------------------------------------
Obj_Detach:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,d0
	beq.w	loc_1F6690
	moveq	#$0,d0
	move.b	$3A(a4),d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F6556
	moveq	#$0,d0
	bra.s	loc_1F6566
loc_1F6556:
	moveq	#$0,d0
	move.b	$3A(a4),d0
	movea.l	-$34A6(a5),a0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_1F6566:
	movea.l	d0,a3
	move.l	a3,d0
	beq.w	loc_1F660C
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1F65AE
	move.w	#$1000,d0
	and.w	$4(a3),d0
	beq.s	loc_1F6590
	move.w	$16(a3),$16(a4)
	move.w	$18(a3),$18(a4)
	bra.s	loc_1F65F2
loc_1F6590:
	move.w	$16(a3),d7
	move.l	a3,-(a7)
	jsr	$4EE2(a5)	; -> sub_1F6EC4
	move.w	$16(a3),$16(a4)
	move.w	$18(a3),$18(a4)
	move.w	d7,$16(a3)
	addq.w	#$4,a7
	bra.s	loc_1F65F2
loc_1F65AE:
	move.l	a4,-(a7)
	jsr	$4EE2(a5)	; -> sub_1F6EC4
	move.w	#$1000,d0
	and.w	$4(a3),d0
	addq.w	#$4,a7
	beq.s	loc_1F65D2
	move.w	$16(a3),d0
	add.w	d0,$16(a4)
	move.w	$18(a3),d0
	add.w	d0,$18(a4)
	bra.s	loc_1F65F2
loc_1F65D2:
	move.w	$16(a3),d7
	move.l	a3,-(a7)
	jsr	$4EE2(a5)	; -> sub_1F6EC4
	move.w	$16(a3),d0
	add.w	d0,$16(a4)
	move.w	$18(a3),d0
	add.w	d0,$18(a4)
	move.w	d7,$16(a3)
	addq.w	#$4,a7
loc_1F65F2:
	move.l	$7C(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	move.b	$3B(a3),d0
	cmp.b	$15(a4),d0
	addq.w	#$4,a7
	bne.s	loc_1F660C
	move.b	$3C(a4),$3B(a3)
loc_1F660C:
	moveq	#$0,d7
	move.b	$3C(a4),d7
	cmpi.w	#$FF,d7
	beq.s	loc_1F663C
	cmpi.w	#$FF,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F6626
	moveq	#$0,d0
	bra.s	loc_1F6634
loc_1F6626:
	ext.l	d7
	movea.l	-$34A6(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_1F6634:
	movea.l	d0,a0
	move.b	$3D(a4),$3D(a0)
loc_1F663C:
	moveq	#$0,d7
	move.b	$3D(a4),d7
	cmpi.w	#$FF,d7
	beq.s	loc_1F666C
	cmpi.w	#$FF,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F6656
	moveq	#$0,d0
	bra.s	loc_1F6664
loc_1F6656:
	ext.l	d7
	movea.l	-$34A6(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_1F6664:
	movea.l	d0,a0
	move.b	$3C(a4),$3C(a0)
loc_1F666C:
	andi.w	#$F7FF,$4(a4)
	ori.w	#$1000,$4(a4)
	moveq	#$0,d0
	move.l	d0,$76(a4)
	move.b	#$FF,$3A(a4)
	move.b	#$FF,$3C(a4)
	move.b	#$FF,$3D(a4)
loc_1F6690:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
