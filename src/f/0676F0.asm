; ---------------------------------------------------------------------------
; PortraitActor_StateIdle - portrait: idle; when the cursor changed, fly the old portrait out (or the first character in)
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: cursor +$33 changed flag, +$3C/+$3D index; next PortraitActor_StartFlyOut / PortraitActor_StateFirstChar
; ---------------------------------------------------------------------------
PortraitActor_StateIdle:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a0
	tst.b	$33(a0)
	beq.s	loc_06774A
	moveq	#-$1,d0
	cmp.b	$3C(a0),d0
	bne.s	loc_067730
	moveq	#-$1,d0
	cmp.b	$3D(a0),d0
	beq.s	loc_067730
	movea.l	a0,a1
	move.b	$3D(a0),$3C(a1)
	clr.w	$6C(a4)
	lea.l	PortraitActor_StateFirstChar(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_067772
loc_067730:
	tst.l	$30(a4)
	beq.s	loc_06774A
	clr.w	$6C(a4)
	lea.l	PortraitActor_StartFlyOut(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_067772
loc_06774A:
	movea.l	$8C(a4),a0
	clr.b	$33(a0)
	tst.l	$44(a4)
	bne.s	loc_067760
	move.l	a4,-(a7)
	jsr	PlayerSelect_PlayIdleAnim(pc)
	addq.w	#$4,a7
loc_067760:
	clr.w	$6C(a4)
	lea.l	PortraitActor_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_067772:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
