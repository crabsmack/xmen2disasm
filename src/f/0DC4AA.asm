; ---------------------------------------------------------------------------
; SentinelsD1_RunScene - scene function for 'SentinelsD1 Exterior_1': load the level, set it up, run it
; In:  none
; Out: none
; Evidence: registered under that name (jt 1150); Level_Run; TAS 2381
; Found: jt 1150
; ---------------------------------------------------------------------------
SentinelsD1_RunScene:
	link.w	a6,#$0
	jsr	SentinelsD1_LoadLevel(pc)
	jsr	SentinelsD1_InstallHooks(pc)
	jsr	$5002(a5)	; -> Level_Run
	unlk	a6
	rts
