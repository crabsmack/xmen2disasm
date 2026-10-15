; ---------------------------------------------------------------------------
; sub_097016	[link-after-rts]
; ---------------------------------------------------------------------------
sub_097016:
	link.w	a6,#$0
	move.l	a4,-(a7)
	lea.l	$1A22(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$E(a6),d1
	ext.l	d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	move.w	$A(a6),d1
	ext.l	d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	lea.l	$4DC2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$4DC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$14(a7),a7
	beq.s	loc_097082
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#-$20,d1
	move.l	d1,-(a7)
	moveq	#-$10,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$1A1A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$3AFA(a5)	; -> sub_13EFA0
	lea.l	$18(a7),a7
loc_097082:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
