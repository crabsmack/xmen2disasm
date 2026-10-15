; ---------------------------------------------------------------------------
; BabyBio_ClassInit - does nothing: only calls the empty BabyBio_Nop6A (static, class slot 22, +$5E ClassInit)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: BabyBio_Nop6A = link/unlk/rts; method 22 of class descriptor $11B74C (name string "BABYBIO", parent BIONPC)
; ---------------------------------------------------------------------------
BabyBio_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	BabyBio_Nop6A(pc)
	addq.w	#$4,a7
	unlk	a6
	rts
