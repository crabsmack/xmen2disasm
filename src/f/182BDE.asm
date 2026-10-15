; ---------------------------------------------------------------------------
; Beast_WallJump - jump away from the wall Beast is clinging to
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: vy = char +$10 (0 if +$90 $10000), gravity char +$E, vx accel +/-$100 away by facing, SetFrame 9, climb state cleared, delay 16 then control; from Beast_StateGrabWall when jump was pressed during the grab (+$C0 bit $40)
; ---------------------------------------------------------------------------
Beast_WallJump:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	#$10000,d0
	and.l	$90(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_182C04
	movea.l	$8C(a4),a0
	movea.w	$10(a0),a0
	bra.s	loc_182C08
loc_182C04:
	movea.w	#$0,a0
loc_182C08:
	move.w	a0,$18(a4)
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_182C26
	move.l	#$FFFFFF00,d0
	bra.s	loc_182C2C
loc_182C26:
	move.l	#$100,d0
loc_182C2C:
	move.w	d0,$1E(a4)
	moveq	#$9,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#-$4,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	moveq	#$0,d1
	or.w	d0,d1
	move.w	d1,$C0(a4)
	addq.w	#$8,a7
	move.w	#$10,$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
