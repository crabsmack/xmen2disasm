; ---------------------------------------------------------------------------
; BroodBoss_StateStompLand - BROODBOSS state: stomp landed - frame 7
; In:  8(a6) = this
; Out: d0
; Evidence: clears +$44, SetFrame(7), next BroodBoss_StateShockOn
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateStompLand:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateShockOn(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
