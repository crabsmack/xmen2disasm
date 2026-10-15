; ---------------------------------------------------------------------------
; sub_087E0C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_087E0C:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	moveq	#$6,d0
	move.l	d0,-(a7)
	move.l	-$3B14(a5),-(a7)
	move.w	d7,d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	d6,d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$3B6A(a5)	; -> sub_13F58A
	moveq	#$6,d0
	move.l	d0,-(a7)
	move.l	-$3B14(a5),-(a7)
	ext.l	d7
	move.l	d7,d1
	moveq	#-$18,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,d1
	moveq	#-$14,d0
	add.l	d0,d1
	move.l	d1,-(a7)
	jsr	$3B6A(a5)	; -> sub_13F58A
	moveq	#$6,d0
	move.l	d0,-(a7)
	move.l	-$3B14(a5),-(a7)
	ext.l	d7
	move.l	d7,d1
	moveq	#-$12,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,d1
	moveq	#$14,d0
	add.l	d0,d1
	move.l	d1,-(a7)
	jsr	$3B6A(a5)	; -> sub_13F58A
	moveq	#$34,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$34,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	pea.l	($CF).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($CF).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$40(a7),a7
	move.w	#$2,$6C(a4)
	lea.l	sub_087EBE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
