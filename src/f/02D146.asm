; ---------------------------------------------------------------------------
; Exodus_HurtPlayer - hurt one player with the psychic flash (TakeDamage type 4) unless absent or protected
; In:  8(a6) = player object
; Out: none
; Evidence: slot $26 TakeDamage(player, 0, 4, 1, -1, -1); skipped when +4 bit $1000 and sub_1F429E says no; caller AvalonA3_PsiFlashStep
; ---------------------------------------------------------------------------
Exodus_HurtPlayer:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_02D19E
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_02D17E
	move.l	a4,-(a7)
	jsr	$4D72(a5)	; -> Player_ClimbState
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_02D19E
loc_02D17E:
	moveq	#-$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#$4,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_02D19E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
