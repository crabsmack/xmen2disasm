; ---------------------------------------------------------------------------
; BigBio_StateStart - BIGBIO first state: stand on the ground segment (type $21), wait for the players
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: TAS frame 36584 (SpaceB1 boss)
; ---------------------------------------------------------------------------
BigBio_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$6,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	andi.w	#$FFF7,$A2(a4)
	andi.b	#$F7,$2E(a4)
	andi.b	#$EF,$2E(a4)
	move.w	$10(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	moveq	#$21,d0
	move.l	d0,-(a7)
	move.l	$C(a4),d1
	asr.l	#$8,d1
	move.l	d1,-(a7)
	move.l	$8(a4),d1
	asr.l	#$8,d1
	move.l	d1,-(a7)
	jsr	$4F42(a5)	; -> Seg_FindNearestOfType
	lea.l	$C(a7),a7
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4EBA(a5)	; -> Obj_StandOnSeg
	move.w	#$7000,$22(a4)
	move.w	#$7000,$24(a4)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	BigBio_StateWaitPlayers(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
