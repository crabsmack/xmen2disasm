; ---------------------------------------------------------------------------
; Explosion_Spawn - start a harmless explosion at (x, y)
; In:  8(a6) = x  $C(a6) = y (16.16)  $13(a6) = byte h-flip
; Out: d0.b = 1 if started
; Evidence: Explosion_SpawnEx(.., 0); 27 callers (enemy deaths, Deathbird_StateFalling)
; ---------------------------------------------------------------------------
Explosion_Spawn:
	link.w	a6,#$0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	moveq	#$0,d2
	move.b	$13(a6),d2
	move.l	d2,-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	jsr	Explosion_SpawnEx(pc)
	lea.l	$10(a7),a7
	move.l	d0,d1
	move.l	(a7)+,d0
	tst.l	d1
	sne.b	d0
	neg.b	d0
	unlk	a6
	rts
