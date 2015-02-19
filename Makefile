t: t.nim
	nim c -r $<

release: t.nim
	nim c -r --d:release $<

clean:
	@rm -rf nimcache t
