; ---------------------------------------------------------------------------
; BabyBio_LevelEnd - clear the byte $FFE562 (static, class slot 23, +$62; does not call the parent)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 23 of class descriptor $11B74C (name string "BABYBIO", parent BIONPC)
; ---------------------------------------------------------------------------
BabyBio_LevelEnd:
	link.w	a6,#$0
	clr.b	g_BabyBioUnused(a5)
	unlk	a6
	rts
