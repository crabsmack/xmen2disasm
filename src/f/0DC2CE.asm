; ---------------------------------------------------------------------------
; SentinelsD1_AnimLight - SentinelsD1: step the warning-light sprite through frames 3..0 every 5 frames
; In:  none
; Out: none
; Evidence: sprite $FFCC6A, Spr_SetFrame + Spr_UploadFrame; TAS 2543-10022
; Found: jt 1146
; ---------------------------------------------------------------------------
SentinelsD1_AnimLight:
	link.w	a6,#$0
	tst.w	-$3B32(a5)
	bne.s	loc_0DC30E
	move.w	#$5,-$3B32(a5)
	tst.w	-$3B3A(a5)
	bne.s	loc_0DC2EA
	move.w	#$4,-$3B3A(a5)
loc_0DC2EA:
	subq.w	#$1,-$3B3A(a5)
	move.w	-$3B3A(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	lea.l	$10(a7),a7
loc_0DC30E:
	subq.w	#$1,-$3B32(a5)
	unlk	a6
	rts
