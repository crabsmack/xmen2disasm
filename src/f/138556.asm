; ---------------------------------------------------------------------------
; LaserCannon_StateWaitExtended - LaserCannon state: wait until animation flag +$98 bit 0 clears, then aim
; In:  8(a6) = this
; Out: d0 = flags & 8 when advancing, else bit 0
; Evidence: +$98 & 1 == 0 -> +$5C = LaserCannon_StateAim
; ---------------------------------------------------------------------------
LaserCannon_StateWaitExtended:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d0
	and.w	$98(a4),d0
	bne.s	loc_13857A
	clr.w	$6C(a4)
	lea.l	LaserCannon_StateAim(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_13857A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
