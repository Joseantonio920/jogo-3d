local d={}

local width, height=love.graphics.getDimensions()
local fov=(width+height)/2

local cam={
	x=0,
	y=0,
	z=0,
	
	rx=0,
	ry=0,
	rz=0
}
function d:getCam()
	return cam
end
function d:setCam(pos, r)
	cam.x=pos[1] or cam.x
	cam.y=pos[2] or cam.y
	cam.z=pos[3] or cam.z
	
	cam.rx=r[1] or cam.rx
	cam.ry=r[2] or cam.ry
	cam.rz=r[3] or cam.rz
end
function d:addV(x, y, z)
	return {x=x, y=y, z=z}
end
function d:addM(poly, pos, rot)
	local m={
		points={},
		pos=pos or {0, 0, 0},
		rot=rot or {0, 0, 0}
	}
	
	for i=3, #poly, 3 do
		table.insert(m.points, {poly[i-2], poly[i-1], poly[i]})
	end
	
	return m
end

function d:cube(poly, pos, tam)
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]-tam[2]/2, pos[3]-tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]-tam[2]/2, pos[3]-tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]+tam[2]/2, pos[3]-tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]+tam[2]/2, pos[3]-tam[3]/2))
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]+tam[2]/2, pos[3]-tam[3]/2))
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]-tam[2]/2, pos[3]-tam[3]/2))
	
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]-tam[2]/2, pos[3]-tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]-tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]+tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]+tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]+tam[2]/2, pos[3]-tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]-tam[2]/2, pos[3]-tam[3]/2))
	
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]-tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]-tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]+tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]+tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]+tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]-tam[2]/2, pos[3]+tam[3]/2))
	
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]-tam[2]/2, pos[3]-tam[3]/2))
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]-tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]+tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]+tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]+tam[2]/2, pos[3]-tam[3]/2))
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]-tam[2]/2, pos[3]-tam[3]/2))
	
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]-tam[2]/2, pos[3]-tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]-tam[2]/2, pos[3]-tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]-tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]-tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]-tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]-tam[2]/2, pos[3]-tam[3]/2))
	
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]+tam[2]/2, pos[3]-tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]+tam[2]/2, pos[3]-tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]+tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]+tam[1]/2, pos[2]+tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]+tam[2]/2, pos[3]+tam[3]/2))
	table.insert(poly, d:addV(pos[1]-tam[1]/2, pos[2]+tam[2]/2, pos[3]-tam[3]/2))
end

function d:getPos(poly)
	return poly.pos
end

function d:setPos(poly, pos)
	poly.pos=pos or poly.pos
end

function d:getR(poly)
	return poly.rot
end

function d:setR(poly, rot)
	poly.rot=rot or poly.rot
end

function d:rotate(poly, r, c)
	poly.x=poly.x-c[1]
	poly.y=poly.y-c[2]
	poly.z=poly.z-c[3]
	
	local a1, b1, c1, a2, b2, c2, a3, b3, c3, a4, b4, c4
	a1, b1, c1=poly.x, poly.y, poly.z
	
	a2=a1
	b2=(math.cos(r[1])*b1)-(math.sin(r[1])*c1)
	c2=(math.sin(r[1])*b1)+(math.cos(r[1])*c1)
	
	a3=(math.cos(r[2])*a2)+(math.sin(r[2])*c2) 
	b3=b2
	c3=-(math.sin(r[2])*a2)+(math.cos(r[2])*c2)
	
	a4=(math.cos(r[3])*a3)-(math.sin(r[3])*b3) 
	b4=(math.sin(r[3])*a3)+(math.cos(r[3])*b3) 
	c4=c3
	
	poly.x=a4+c[1]
	poly.y=b4+c[2]
	poly.z=c4+c[3]
end

function d:p3d(poly, pos, rot)
	local p3d=d:addV(poly.x, poly.y, poly.z)
	
	p3d.x=(p3d.x-cam.x)+pos[1]
	p3d.y=(p3d.y-cam.y)+pos[2]
	p3d.z=(p3d.z-cam.z)+pos[3]
	d:rotate(p3d, {rot[1], rot[2], rot[3]}, {pos[1], pos[2], pos[3]})
	d:rotate(p3d, {-cam.rx, -cam.ry, -cam.rz}, {0, 0, 0})
	
	if p3d.z==0 then
		p3d.z=-0.1
	end
	if p3d.z<0 then
		p3d.z=-p3d.z
		local x=fov*p3d.x*p3d.z
		local y=fov*p3d.y*p3d.z
		
		return x+width/2, y+height/2
	end
	
	local x=fov*p3d.x/p3d.z
	local y=fov*p3d.y/p3d.z
	
	return x+width/2, y+height/2
end

function d:drawM(mesh)
	local pos=mesh.pos
	local rot=mesh.rot
	
	for i, p in ipairs(mesh.points) do
		local x1, y1=d:p3d(p[1], pos, rot)
		local x2, y2=d:p3d(p[2], pos, rot)
		local x3, y3=d:p3d(p[3], pos, rot)
		
		if not ((x1<0 or x1>width) and (y1<0 or y1>height) and (x2<0 or x2>width) and (y2<0 or y2>height) and (x3<0 or x3>width) and (y3<0 or y3>height)) then
			love.graphics.polygon("line", x1, y1, x2, y2, x3, y3)
		end
	end
end

return d