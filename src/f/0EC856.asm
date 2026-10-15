; ---------------------------------------------------------------------------
; CoreElevator_Init - CoreElevator: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $0EC98E (name string "COREELEVATOR", parent ACTOR)
; ---------------------------------------------------------------------------
CoreElevator_Init:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2902(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	-$3BD6(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> sub_1F6334
	lea.l	sub_0EC572(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	ori.w	#$5283,$6(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$18(a7),a7
	bne.s	loc_0EC8D8
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_0EC8D0
	ori.b	#$4,$2E(a4)
	bra.s	loc_0EC91E
loc_0EC8D0:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0EC91E
loc_0EC8D8:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0EC908
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_0EC900
	ori.b	#$4,$2E(a4)
	bra.s	loc_0EC91E
loc_0EC900:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0EC91E
loc_0EC908:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_0EC918
	ori.b	#$4,$2E(a4)
	bra.s	loc_0EC91E
loc_0EC918:
	andi.b	#$FB,$2E(a4)
loc_0EC91E:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$290A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> sub_1F4A40
	move.w	$8(a3),d7
	beq.s	loc_0EC94A
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_0EC952
loc_0EC94A:
	move.w	$4(a3),d0
	sub.w	#$60,d0
loc_0EC952:
	move.w	d0,$8E(a4)
	move.w	$A(a3),d7
	beq.s	loc_0EC962
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_0EC96A
loc_0EC962:
	move.w	$4(a3),d0
	add.w	#$60,d0
loc_0EC96A:
	move.w	d0,$8C(a4)
	move.w	$C(a3),d7
	beq.s	loc_0EC978
	move.w	d7,d0
	bra.s	loc_0EC97C
loc_0EC978:
	move.w	#$200,d0
loc_0EC97C:
	move.w	d0,$90(a4)
	lea.l	$C(a7),a7
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
