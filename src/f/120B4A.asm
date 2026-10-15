; ---------------------------------------------------------------------------
; BioSentinel_StateStart - BIOSENTINEL first state: variant 1 hangs on the ceiling (segment type $22) and crawls; others stand on the floor and think
; In:  8(a6) = this
; Out: none
; Evidence: byte +$96 variant; sub_1F80CA/sub_1F6B56 attach to a segment; next StateCeilingCrawl or StateThink; TAS 35044-48732
; ---------------------------------------------------------------------------
BioSentinel_StateStart:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	moveq	#$1,d0
	cmp.b	$96(a4),d0
	bne.s	loc_120BC4
	moveq	#$22,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$4F42(a5)	; -> sub_1F80CA
	lea.l	$C(a7),a7
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4EBA(a5)	; -> sub_1F6B56
	move.w	#$50,$22(a4)
	move.w	#$5,$1E(a4)
	andi.b	#$EF,$2E(a4)
	ori.b	#$8,$2E(a4)
	lea.l	$3432(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	clr.b	$A6(a4)
	lea.l	BioSentinel_StateCeilingCrawl(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	BioSentinel_StateCeilingCrawl(pc)
	lea.l	$14(a7),a7
	bra.s	loc_120BF8
loc_120BC4:
	move.b	#$1,$A6(a4)
	pea.l	($3E9).w
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$4F42(a5)	; -> sub_1F80CA
	lea.l	$C(a7),a7
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4EBA(a5)	; -> sub_1F6B56
	lea.l	BioSentinel_StateThink(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	BioSentinel_StateThink(pc)
	lea.l	$C(a7),a7
loc_120BF8:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
