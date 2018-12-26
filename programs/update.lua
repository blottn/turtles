-- requires the json api

os.loadAPI("json")

local function len(tab) do
	n = 0
	for k,v in pairs(tab) do
		n = n+1
	end
	return n
end

str = http.get("https://api.github.com/repos/blottn/turtles/contents/programs/").readAll()
programs = json.decode(str)
for i = 1,len(programs) do
	print(programs[i].name)
end
