; ---------------------------------------------------------------------------
; BigBio_StateLaunch - BIGBIO: leap into the air (sound $FA) and form the orb ring
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: next StateFormRing
; ---------------------------------------------------------------------------
BigBio_StateLaunch:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3492(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	BigBio_Launch(pc)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	move.w	#$3C,$9C(a4)
	move.w	#$78,$9E(a4)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$12(a4)
	subi.l	#$8200,$C(a4)
	pea.l	($FA).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($FA).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$18(a7),a7
	clr.w	$6C(a4)
	lea.l	BigBio_StateFormRing(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
