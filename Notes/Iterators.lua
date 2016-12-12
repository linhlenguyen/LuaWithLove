function list_iter (t)
  local i = 0
  local n = table.getn(t)
  return function ()
           i = i + 1
           if i <= n then return t[i] end
         end
end

t = {10, 20, 30}
iter = list_iter(t)    -- creates the iterator
while true do
  local element = iter()   -- calls the iterator
  if element == nil then break end
  print(element)
end

t = {10, 20, 30}
for element in list_iter(t) do
  print(element)
end

function allwords ()
  local line = io.read()  -- current line
  local pos = 1           -- current position in the line
  return function ()      -- iterator function
    while line do         -- repeat while there are lines
      local s, e = string.find(line, "%w+", pos)
      if s then           -- found a word?
        pos = e + 1       -- next position is after this word
        return string.sub(line, s, e)     -- return the word
      else
        line = io.read()  -- word not found; try next line
        pos = 1           -- restart from first position
      end
    end
    return nil            -- no more lines: end of traversal
  end
end

for word in allwords() do
  print(word)
end

function iter (a, i)
  i = i + 1
  local v = a[i]
  if v then
    return i, v
  end
end

function ipairs (a)
  return iter, a, 0
end

local iterator   -- to be defined later

function allwords ()
  local state = {line = io.read(), pos = 1}
  return iterator, state
end

function iterator (state)
  while state.line do        -- repeat while there are lines
    -- search for next word
    local s, e = string.find(state.line, "%w+", state.pos)
    if s then                -- found a word?
      -- update next position (after this word)
      state.pos = e + 1
      return string.sub(state.line, s, e)
    else    -- word not found
      state.line = io.read() -- try next line...
      state.pos = 1          -- ... from first position
    end
  end
  return nil                 -- no more lines: end loop
end

local count = 0
for w in allwords() do
  if w == "hello" then count = count + 1 end
end
print(count)

function allwords (f)
  -- repeat for each line in the file
  for l in io.lines() do
    -- repeat for each word in the line
    for w in string.gfind(l, "%w+") do
      -- call the function
      f(w)
    end
  end
end

allword(print)

local count = 0
allwords(function (w)
  if w == "hello" then count = count + 1 end
end)
print(count)



for var_1, ..., var_n in explist do block end

do
  local _f, _s, _var = explist
  while true do
    local var_1, ... , var_n = _f(_s, _var)
    _var = var_1
    if _var == nil then break end
    block
  end
end

--If iterator function is f, the invariant state is s, and the initial value for the control variable is a0,
--the control variable will loop over the values a1 = f(s, a0), a2 = f(s, a1), and so on, until ai is nil.
--If the for has other variables, they simply get the extra values returned by each call to f
