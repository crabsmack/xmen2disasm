; ---------------------------------------------------------------------------
; Rand_Seed - seed Rand_Next: split a word into the three table indexes and the history
; In:  8(a6) = word seed
; Out: none
; Evidence: bits 0-4 -> -$7AE (x4), 5-9 -> -$7B0, 10-15 -> -$7B2; -$7AC = seed, -$7AA = 0; jt 2092
; ---------------------------------------------------------------------------
Rand_Seed:
	link.w	a6,#$0
	move.w	$A(a6),d0
	andi.w	#$1F,d0
	add.w	d0,d0
	add.w	d0,d0
	move.w	d0,-$7AE(a5)
	move.w	$A(a6),d0
	andi.w	#$3E0,d0
	lsr.w	#$3,d0
	move.w	d0,-$7B0(a5)
	move.w	$A(a6),d0
	andi.w	#$FC00,d0
	rol.w	#$7,d0
	move.w	d0,-$7B2(a5)
	move.w	$A(a6),-$7AC(a5)
	clr.w	-$7AA(a5)
	unlk	a6
	rts
