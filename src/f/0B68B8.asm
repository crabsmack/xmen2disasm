; ---------------------------------------------------------------------------
; BrainBabyBio_StateStart - BRAINBABYBIO first state: start its AI script after 10 frames
; In:  8(a6) = this
; Out: none
; Evidence: +$5C/+$64 set by BrainBabyBio_Init; TAS 33539
; Found: link-after-rts
; ---------------------------------------------------------------------------
BrainBabyBio_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$98(a4)
	bne.s	loc_0B68D6
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_0B68F4
loc_0B68D6:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_0B68F4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
