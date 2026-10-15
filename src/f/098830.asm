; ---------------------------------------------------------------------------
; EvilNightcrawler_StateTeleportOut - EVILNIGHTCRAWLER state: invisible for (distance to the target)/8 frames, then reappear
; In:  8(a6) = this
; Out: d0
; Evidence: frame $FF; +$6C = (|dx|+|dy|) >> 3; next EvilNightcrawler_StateTeleportIn
; Found: link-after-rts
; ---------------------------------------------------------------------------
EvilNightcrawler_StateTeleportOut:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	moveq	#$0,d0
	move.l	d0,$44(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	ext.l	d6
	move.w	$BA(a4),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
	sge.b	d3
	neg.b	d3
	beq.s	loc_09887C
	ext.l	d6
	move.w	$BA(a4),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
	bra.s	loc_09888A
loc_09887C:
	ext.l	d6
	move.w	$BA(a4),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
	neg.l	d1
loc_09888A:
	ext.l	d7
	move.w	$BC(a4),d0
	ext.l	d0
	move.l	d7,d2
	sub.l	d0,d2
	sge.b	d3
	neg.b	d3
	beq.s	loc_0988AA
	ext.l	d7
	move.w	$BC(a4),d0
	ext.l	d0
	move.l	d7,d2
	sub.l	d0,d2
	bra.s	loc_0988B8
loc_0988AA:
	ext.l	d7
	move.w	$BC(a4),d0
	ext.l	d0
	move.l	d7,d2
	sub.l	d0,d2
	neg.l	d2
loc_0988B8:
	move.w	d2,d5
	add.w	d1,d5
	move.w	d5,d6
	asr.w	#$3,d6
	cmpi.w	#$FFFF,d6
	addq.w	#$8,a7
	bne.s	loc_0988DA
	lea.l	EvilNightcrawler_StateTeleportIn(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	EvilNightcrawler_StateTeleportIn(pc)
	addq.w	#$4,a7
	bra.s	loc_0988EC
loc_0988DA:
	move.w	d6,$6C(a4)
	lea.l	EvilNightcrawler_StateTeleportIn(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0988EC:
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
