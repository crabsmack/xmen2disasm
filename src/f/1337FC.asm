; ---------------------------------------------------------------------------
; BrainRocket_ShouldDeactivate - BrainRocket: is the active object out of range and due to deactivate (class slot 15, +$42)
; In:  8(a6) = this
; Out: d0.b = 1 to deactivate
; Evidence: method 15 of class descriptor $133CFC (name string "BRAINROCKET", parent ACTOR)
; ---------------------------------------------------------------------------
BrainRocket_ShouldDeactivate:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	-$348E(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	-$3490(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	ext.l	d6
	move.w	-$35C2(a5),d0
	ext.l	d0
	move.w	$92(a4),d1
	ext.l	d1
	add.l	d0,d1
	cmp.l	d6,d1
	bge.s	loc_133840
	moveq	#$1,d0
	bra.s	loc_13388E
loc_133840:
	ext.l	d6
	move.w	-$35C0(a5),d0
	ext.l	d0
	move.w	$92(a4),d1
	ext.l	d1
	sub.l	d1,d0
	cmp.l	d6,d0
	ble.s	loc_133858
	moveq	#$1,d0
	bra.s	loc_13388E
loc_133858:
	ext.l	d7
	move.w	-$35C6(a5),d0
	ext.l	d0
	move.w	$94(a4),d1
	ext.l	d1
	add.l	d0,d1
	cmp.l	d7,d1
	bge.s	loc_133870
	moveq	#$1,d0
	bra.s	loc_13388E
loc_133870:
	ext.l	d7
	move.w	-$35C4(a5),d1
	ext.l	d1
	move.w	$94(a4),d2
	ext.l	d2
	sub.l	d2,d1
	cmp.l	d7,d1
	sgt.b	d3
	neg.b	d3
	subq.b	#$1,d3
	subx.b	d3,d3
	addq.b	#$1,d3
	move.b	d3,d0
loc_13388E:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
