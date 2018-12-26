-- requires the json api

os.loadAPI("json")

-- helper cause im bad at lua
local function len(tab) do
	n = 0
	for k,v in pairs(tab) do
		n = n+1
	end
	return n
end

local str = http.get("https://api.github.com/repos/blottn/turtles/contents/programs/").readAll()
local programs = json.decode(str)

local base = "https://raw.githubusercontent.com/blottn/turtles/master/programs/"

if not fs.exists("./prg") then
	fs.makeDir("./prg")
end


for i = 1,len(programs) do
	url = base .. programs[i].name
	c = http.get(url).readAll()
	h = fs.open("./prg/" .. programs[i].name, "w")
	h.write(c)
	h.close()
end
