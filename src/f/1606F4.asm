; ---------------------------------------------------------------------------
; Obj_GetLiftCarrier - return the object this one is attached to when it is a moving lift (vertical motion, or a segment of type '$'/'#')
; In:  8(a6) = object
; Out: d0 = carrier object or 0
; Evidence: carrier = g_ObjTable[+$3A]; with carrier flag $1000 requires |vy| > |vx|; else carrier segment +$76 type byte '$' or '#'; Cam_TrackPlayer then keeps y simple
; ---------------------------------------------------------------------------
Obj_GetLiftCarrier:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d0
	move.b	$3A(a3),d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_160714
	moveq	#$0,d0
	bra.s	loc_160724
loc_160714:
	moveq	#$0,d0
	move.b	$3A(a3),d0
	movea.l	g_ObjTable(a5),a0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_160724:
	movea.l	d0,a4
	move.l	a4,d0
	bne.s	loc_16072E
	moveq	#$0,d0
	bra.s	loc_160796
loc_16072E:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_160778
	tst.w	$18(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_16074A
	move.w	$18(a4),d0
	ext.l	d0
	bra.s	loc_160752
loc_16074A:
	move.w	$18(a4),d0
	ext.l	d0
	neg.l	d0
loc_160752:
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_160764
	move.w	$16(a4),d1
	ext.l	d1
	bra.s	loc_16076C
loc_160764:
	move.w	$16(a4),d1
	ext.l	d1
	neg.l	d1
loc_16076C:
	cmp.l	d0,d1
	bge.s	loc_160774
	move.l	a4,d0
	bra.s	loc_160796
loc_160774:
	moveq	#$0,d0
	bra.s	loc_160796
loc_160778:
	movea.l	$76(a4),a3
	move.b	$1(a3),d0
	ext.w	d0
	move.w	d0,d7
	cmpi.w	#$24,d7
	beq.s	loc_160790
	cmpi.w	#$23,d7
	bne.s	loc_160794
loc_160790:
	move.l	a4,d0
	bra.s	loc_160796
loc_160794:
	moveq	#$0,d0
loc_160796:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
