; ---------------------------------------------------------------------------
; sub_022AF6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_022AF6:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	move.w	#$300,-$3CD0(a5)
	move.w	-$3CD0(a5),-$3AFA(a5)
	unlk	a6
	rts
