t: t.nim
	nim c -r $<

clean:
	@rm -rf nimcache t
