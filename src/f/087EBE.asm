; ---------------------------------------------------------------------------
; BroodBoss_StateVanish - BROODBOSS death: hide the body (frame $FF) for $1E frames
; In:  8(a6) = this
; Out: d0
; Evidence: clears +$44, SetFrame($FF); next BroodBoss_StateClawOut; TAS 50715
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateVanish:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	move.w	#$1E,$6C(a4)
	lea.l	BroodBoss_StateClawOut(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
