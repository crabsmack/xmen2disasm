; ---------------------------------------------------------------------------
; BigAcolyte_Activate - run the parent Activate with the sprite pointer +$30 hidden (so no sprite is set up), then restore it and set frames +$2F/+$38 to $FF (BIGACOLYTE override of slot +$3E Activate)
; In:  8(a6) = this (BIGACOLYTE object)
; Out: none
; Evidence: class descriptor BIGACOLYTE slot +$3E (tools/classes.py); TAS frames 13007-13007 (1 active)
; ---------------------------------------------------------------------------
BigAcolyte_Activate:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$30(a4),a3
	lea.l	$2E(a4),a0
	move.l	a0,-$4(a6)
	moveq	#$0,d0
	move.l	d0,$30(a4)
	move.l	a4,-(a7)
	lea.l	$1CA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	move.l	a3,$30(a4)
	move.b	#$FF,$2F(a4)
	move.b	#$FF,$38(a4)
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
