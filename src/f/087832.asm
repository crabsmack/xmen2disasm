; ---------------------------------------------------------------------------
; BroodBoss_StateMakeUnhittable - BROODBOSS state: take the boss out of the hit list, next step
; In:  8(a6) = this
; Out: none
; Evidence: +6 |= 2, List_Unlink(+$84, $FFEBAE)
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateMakeUnhittable:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$2,$6(a4)
	pea.l	g_HitListEnemyBody(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	tst.l	$92(a4)
	addq.w	#$8,a7
	bne.s	loc_087868
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_087894
loc_087868:
	addq.w	#$1,$90(a4)
	movea.l	$92(a4),a0
	move.w	$90(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_08787C
	clr.w	$90(a4)
loc_08787C:
	movea.l	$92(a4),a0
	addq.l	#$2,a0
	move.w	$90(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_087894:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
