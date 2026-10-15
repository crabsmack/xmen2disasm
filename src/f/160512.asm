; ---------------------------------------------------------------------------
; Rand_Seed - seed Rand_Next: split a word into the three table indexes and the history
; In:  8(a6) = word seed
; Out: none
; Evidence: bits 0-4 -> g_RandIdx3 (x4), 5-9 -> g_RandIdx2, 10-15 -> g_RandIdx1; g_RandPrev = seed, g_RandPrev2 = 0; jt 2092
; ---------------------------------------------------------------------------
Rand_Seed:
	link.w	a6,#$0
	move.w	$A(a6),d0
	andi.w	#$1F,d0
	add.w	d0,d0
	add.w	d0,d0
	move.w	d0,g_RandIdx3(a5)
	move.w	$A(a6),d0
	andi.w	#$3E0,d0
	lsr.w	#$3,d0
	move.w	d0,g_RandIdx2(a5)
	move.w	$A(a6),d0
	andi.w	#$FC00,d0
	rol.w	#$7,d0
	move.w	d0,g_RandIdx1(a5)
	move.w	$A(a6),g_RandPrev(a5)
	clr.w	g_RandPrev2(a5)
	unlk	a6
	rts
