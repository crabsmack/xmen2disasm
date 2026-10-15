; ---------------------------------------------------------------------------
; BigBio_Script - BIGBIO AI script thunks (table $120826)
; In:  jmp thunks
; Out: -
; Evidence: AiScript_Set(+$96, jt $34AA) in BigBio_StartScript; first entry BigBio_ActSpit3
; ---------------------------------------------------------------------------
BigBio_Script:
	jmp	$3522(a5)	; -> BigBio_ActSpit3
loc_12082C:
	jmp	$3522(a5)	; -> BigBio_ActSpit3
	jmp	$351A(a5)	; -> BigBio_ActRoarThenMorph
	jmp	$3552(a5)	; -> BigBio_ActRoarThenLaunch
	jmp	$354A(a5)	; -> BigBio_ActChargePlayer
	jmp	$3542(a5)	; -> BigBio_ActStartArcSwoop
	jmp	$353A(a5)	; -> BigBio_ActJumpToSide
	jmp	$3532(a5)	; -> BigBio_ActFaceIdle90
	jmp	$3522(a5)	; -> BigBio_ActSpit3
	jmp	$351A(a5)	; -> BigBio_ActRoarThenMorph
	jmp	$3552(a5)	; -> BigBio_ActRoarThenLaunch
	jmp	$354A(a5)	; -> BigBio_ActChargePlayer
	jmp	$3542(a5)	; -> BigBio_ActStartArcSwoop
	jmp	$353A(a5)	; -> BigBio_ActJumpToSide
	jmp	$352A(a5)	; -> BigBio_ActFaceSide
	jmp	$351A(a5)	; -> BigBio_ActRoarThenMorph
