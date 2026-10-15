; ---------------------------------------------------------------------------
; SyncActor_CanActivate - SyncActor: may this inactive object activate now (camera range test) (class slot 13, +$3A)
; In:  8(a6) = this
; Out: d0.b = 1 to activate
; Evidence: method 13 of class descriptor $119ECA (name string "SYNCHRONIZEDACTOR", parent ACTOR)
; ---------------------------------------------------------------------------
SyncActor_CanActivate:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	move.b	d0,d7
	addq.w	#$4,a7
	beq.s	loc_119E14
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7A(a0),a1
	jsr	(a1)
	tst.w	d0
	addq.w	#$4,a7
	bne.s	loc_119E14
	moveq	#$0,d0
	move.b	$8B(a4),d0
	move.l	d0,-(a7)
	move.l	(a4),-(a7)
	lea.l	$2F12(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2F12(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	lea.l	$C(a7),a7
loc_119E14:
	moveq	#$0,d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
