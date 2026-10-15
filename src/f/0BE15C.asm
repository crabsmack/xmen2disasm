; ---------------------------------------------------------------------------
; Barbarian_StateLanded - BARBARIAN state: now standing on the target segment, go idle
; In:  8(a6) = this
; Out: d0
; Evidence: Barbarian_StandOn(+$AA); TAS 28089
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateLanded:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$AA(a4),-(a7)
	move.l	a4,-(a7)
	jsr	Barbarian_StandOn(pc)
	move.b	$BD(a4),d0
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Barbarian_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
