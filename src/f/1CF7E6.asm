; ---------------------------------------------------------------------------
; Gambit_UpdateCard_TrailNext - Gambit_UpdateCard trail loop: step to the next trail position (skip off-screen ones) and pick its flip by frame
; In:  a6 frame of Gambit_UpdateCard, d7 = sprites left
; Out: none
; Evidence: inner label of Gambit_UpdateCard's trail loop; flips cycle 0/$1000/0/$1800 by (count + frame/2) & 3
; ---------------------------------------------------------------------------
Gambit_UpdateCard_TrailNext:
	move.l	d7,d0
	subq.l	#$1,d7
loc_1CF7EA:
	tst.l	d7
	bne.w	loc_1CF6F4
loc_1CF7F0:
	movem.l	-$34(a6),d3-d7/a3-a4
	unlk	a6
	rts
