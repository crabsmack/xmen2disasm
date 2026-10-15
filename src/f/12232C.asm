; ---------------------------------------------------------------------------
; BigBio_StateSpitBetween - BIGBIO: mouth frame $85 for one frame between spits
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: SetFrame($85), +$6C = 1, +$5C = BigBio_StateSpitFire (which shows frame $86 and spits)
; ---------------------------------------------------------------------------
BigBio_StateSpitBetween:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($85).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	move.w	#$1,$6C(a4)
	lea.l	BigBio_StateSpitFire(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
