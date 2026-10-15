; ---------------------------------------------------------------------------
; SentinelsB2_ResetAlarm - SentinelsB2: zero the alarm palette counters
; In:  none
; Out: none
; Evidence: clears $FFC6C8/$FFC6B8/$FFC6C0
; ---------------------------------------------------------------------------
SentinelsB2_ResetAlarm:
	link.w	a6,#$0
	clr.w	-$3B38(a5)
	clr.w	-$3B48(a5)
	clr.w	-$3B40(a5)
	unlk	a6
	rts
