; ---------------------------------------------------------------------------
; SwampPlatform_StateIdle - SWAMPPLATFORM state: sit at its home height (+$12) on frame 0
; In:  8(a6) = this
; Out: d0
; Evidence: re-arms itself with +$6C = $FF; TAS 28316-30422
; Found: link-after-rts
; ---------------------------------------------------------------------------
SwampPlatform_StateIdle:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	SwampPlatform_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
