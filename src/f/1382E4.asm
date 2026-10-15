; ---------------------------------------------------------------------------
; LaserCannon_StateIdle - LaserCannon state: show the rest frame and look for a target
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: vtable +$56 SetFrame(0), +$5C = LaserCannon_StatePickTarget; reached again after every reload
; ---------------------------------------------------------------------------
LaserCannon_StateIdle:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	LaserCannon_StatePickTarget(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
