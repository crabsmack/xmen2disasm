; ---------------------------------------------------------------------------
; ControlBox_StateFire - CONTROLBOX state: step the firing pattern (restarting it at the end) and fire a blast every +$9E frames
; In:  8(a6) = this
; Out: none
; Evidence: slot +$72 ControlBox_FireBlast(x, y); TAS 2774-7269
; Found: link-after-rts
; ---------------------------------------------------------------------------
ControlBox_StateFire:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	tst.w	$6E(a3)
	bne.s	loc_0DD9D2
	addq.w	#$1,$94(a3)
	move.w	$94(a3),d0
	ext.l	d0
	move.l	d0,d7
	move.w	$96(a3),d0
	ext.l	d0
	cmp.l	d7,d0
	bne.s	loc_0DD9BC
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	move.w	$94(a3),d0
	ext.l	d0
	move.l	d0,d7
	addq.w	#$4,a7
loc_0DD9BC:
	movea.l	$90(a3),a0
	move.l	d7,d0
	asl.l	#$2,d0
	lea.l	$2(a0,d0.l),a4
	move.b	$3(a4),d0
	ext.w	d0
	move.w	d0,$6E(a3)
loc_0DD9D2:
	tst.w	$9C(a3)
	bne.s	loc_0DD9F4
	move.w	$9E(a3),$9C(a3)
	move.l	$C(a3),-(a7)
	move.l	$8(a3),-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	lea.l	$C(a7),a7
loc_0DD9F4:
	subq.w	#$1,$9C(a3)
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
