function dofile (filename)
  local f = assert(loadfile(filename))
  return f()
end

-- file `foo.lua'
function foo (x)
 print(x)
end

f = loadfile("foo.lua")

f()           -- defines `foo'
foo("ok")     --> ok

f = loadstring("i = i + 1")
i = 0
f(); print(i)   --> 1
f(); print(i)   --> 2

assert(loadstring(s))()
