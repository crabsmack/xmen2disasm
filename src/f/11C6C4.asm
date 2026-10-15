; ---------------------------------------------------------------------------
; BabyBio_GetMoveLimit_Done - BabyBio_GetMoveLimit common exit
; In:  -
; Out: -
; Evidence: 2 branch sources
; ---------------------------------------------------------------------------
BabyBio_GetMoveLimit_Done:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
