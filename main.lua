local width, height=love.graphics.getDimensions()
local d=require "3d"
local r=0

local m={}
d:cube(m, {0, 0, 0}, {20, 20, 20})
d:cube(m, {15, 5, 0}, {10, 10, 10})
d:cube(m, {-15, 5, 0}, {10, 10, 10})
local poly=d:addM(m, {0, 0, 0}, {0, 0, 0})
function love.draw()
	d:drawM(poly)
	local p=d:getPos(poly)
	love.graphics.print("x:"..p[1]..", y:"..p[2]..", z:"..p[3], 0, 0)
end
function love.update(dt)
	local p=d:getPos(poly)
	d:setPos(poly, {p[1], p[2], 100+(math.cos(r)*200)})
	
	r=r+dt
end
function love.mousemoved(x, y, dx, dy)
	local r=d:getR(poly)
	d:setR(poly, {r[1]-math.rad(dy), r[2]-math.rad(dx), r[3]})
end