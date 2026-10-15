; ---------------------------------------------------------------------------
; BabyBio_GetMoveLimit_Vert - BabyBio_GetMoveLimit cases 2/3: current y, kind 0
; In:  inside BabyBio_GetMoveLimit
; Out: -
; Evidence: Sw_11C662 target
; ---------------------------------------------------------------------------
BabyBio_GetMoveLimit_Vert:
	clr.b	(a3)
	move.l	$A0(a4),d0
	asr.l	#$8,d0
