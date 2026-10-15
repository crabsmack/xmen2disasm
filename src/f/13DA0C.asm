; ---------------------------------------------------------------------------
; ExplodeFx_BurstPuffAim - give a burst puff its outward velocity from the explosion centre plus gravity
; In:  8(a6) = puff  $C(a6) = long centre x  $10(a6) = long centre y (8.8 fixed)
; Out: none
; Evidence: vx = (x - cx) >> 5, vy = (y - cy) >> 5, ax = (x - cx) >> 10, ay = $C; caller ExplodeFx_Burst for each puff
; ---------------------------------------------------------------------------
ExplodeFx_BurstPuffAim:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.l	$C(a6),d7
	movea.l	$8(a6),a4
	move.l	(a4),d0
	sub.l	d7,d0
	asr.l	#$5,d0
	move.w	d0,$8(a4)
	move.l	$4(a4),d0
	sub.l	$10(a6),d0
	asr.l	#$5,d0
	move.w	d0,$A(a4)
	move.l	(a4),d0
	sub.l	d7,d0
	moveq	#$A,d1
	asr.l	d1,d0
	move.w	d0,$C(a4)
	move.w	#$C,$E(a4)
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
