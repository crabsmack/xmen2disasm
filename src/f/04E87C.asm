; ---------------------------------------------------------------------------
; ApocBomb_TakeDamage - vtable +$26: a APOCBOMB takes a hit
; In:  8(a6) = this (APOCBOMB object)
; Out: none
; Evidence: class descriptor APOCBOMB slot +$26 (tools/classes.py); TAS frames 24849-25910 (3 active)
; ---------------------------------------------------------------------------
ApocBomb_TakeDamage:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.w	-$3B08(a5),d0
	subq.w	#$1,-$3B08(a5)
	moveq	#$10,d0
	cmp.w	$98(a4),d0
	addq.w	#$8,a7
	bne.s	loc_04E8E0
	lea.l	$B5A(a5),a0
	movea.l	$2(a0),a3
	move.l	a4,-(a7)
	jsr	ApocBomb_Explode(pc)
	move.l	#$10000,$8(a4)
	move.l	#$10000,$C(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#-$10,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$3AFA(a5)	; -> ExplodeFx_ChainRepeat
	lea.l	$1C(a7),a7
	bra.s	loc_04E8E8
loc_04E8E0:
	move.l	a4,-(a7)
	jsr	$3AD2(a5)	; -> ExplodeFx_BurstSmall
	addq.w	#$4,a7
loc_04E8E8:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
