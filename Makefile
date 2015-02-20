NIM_TARGET=t

$(NIM_TARGET): $(NIM_TARGET).nim
	nim c -r $<

release: $(NIM_TARGET).nim
	nim c -r --d:release $<

clean:
	@rm -rf nimcache $(NIM_TARGET)
