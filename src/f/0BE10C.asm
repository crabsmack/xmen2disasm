; ---------------------------------------------------------------------------
; Barbarian_StateLandSlide - BARBARIAN state: landing - frame $12 and slide a quarter of the way to the target x
; In:  8(a6) = this
; Out: d0
; Evidence: TAS 28082
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateLandSlide:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$9E(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d7
	sub.l	$8(a4),d7
	moveq	#$12,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	d7,d0
	asr.l	#$2,d0
	add.l	d0,$8(a4)
	addq.w	#$8,a7
	move.w	#$6,$6C(a4)
	lea.l	Barbarian_StateLanded(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
