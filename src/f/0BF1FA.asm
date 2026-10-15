; ---------------------------------------------------------------------------
; SporeMine_RecFindTarget - spore handler: pick a player to watch (sub_1F6A32), then watch it for $3C frames
; In:  8(a6) = spore record
; Out: d0
; Evidence: next SporeMine_RecWatch
; Found: link-after-rts
; ---------------------------------------------------------------------------
SporeMine_RecFindTarget:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EB2(a5)	; -> sub_1F6A32
	move.l	d0,$20(a4)
	movea.l	d0,a3
	move.l	a3,d0
	addq.w	#$4,a7
	beq.s	loc_0BF22A
	move.w	#$3C,$1E(a4)
	lea.l	SporeMine_RecWatch(pc),a0
	move.l	a0,$18(a4)
	clr.w	$1C(a4)
loc_0BF22A:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
