; ---------------------------------------------------------------------------
; XPlayer_SetAirFrameNop - XPLAYER slot +$7E: empty (characters choose their jump frame from vy)
; In:  none
; Out: none
; Evidence: Beast $182B3C / Wolverine $196560 override it with vy-banded SetFrame calls; called by XPlayer_AirSteer and XPlayer_EnterAirFrame
; ---------------------------------------------------------------------------
XPlayer_SetAirFrameNop:
	link.w	a6,#$0
	unlk	a6
	rts
