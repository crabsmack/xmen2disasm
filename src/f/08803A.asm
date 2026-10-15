; ---------------------------------------------------------------------------
; CloneA5_SegHook16 - CloneA5 floor-segment hook for type $16: always 1
; Out: d0 = 1
; Evidence: CloneA5_RunScene stores it at g_SegTypeHooks+$58(a5) = g_SegTypeHooks[$16]; type $16 segments are the ones BroodBossDamage_Init takes over
; Found: jt 642
; ---------------------------------------------------------------------------
CloneA5_SegHook16:
	link.w	a6,#$0
	moveq	#$1,d0
	unlk	a6
	rts
