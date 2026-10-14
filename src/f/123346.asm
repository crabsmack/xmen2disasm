; ---------------------------------------------------------------------------
; sub_123346	[link-after-rts]
; ---------------------------------------------------------------------------
sub_123346:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	andi.w	#$FFBF,$6(a4)
	moveq	#$0,d0
	move.b	$B8(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	-$33D2(a5),a0
	pea.l	(a0,d0.w)
	jsr	$4F22(a5)	; -> sub_1F7CFE
	move.w	#$C8,-$359A(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	lea.l	$4DC2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$4DC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	ori.b	#$4,$2E(a3)
	move.w	$4C(a4),d0
	move.w	d0,$4C(a3)
	ext.l	d0
	move.l	$C(a3),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$3B42(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$3AF2(a5)	; -> sub_13EEFA
	lea.l	$3472(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	pea.l	($F9).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($F9).w
	jsr	$521A(a5)	; -> sub_1FE584
	lea.l	$3C(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_1232F0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
