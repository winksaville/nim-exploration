# An example of why we need immediate an ordinary per const debugVerbose = true
var logFile: File = stdout

# As an ordinary template we get a compile error
template debugLog(s: string) = #{.immediate.} =
  when debugVerbose:
    logFile.write($len(s) & ":" & s)

#debugLog(1) # Uncommenting this generates a compile time error whether
             # debugVerbose is true or false
debugLog("some debug outside of the template")

template debugLogImmd(s: string) {.immediate.} =
  when debugVerbose:
    logFile.write($len(s) & ":" & s)

#debugLogImmd(2) # Uncommenting this generates a compile time error only
                 # only if debugVerbose is true
debugLogImmd("some debug outside of the template")

