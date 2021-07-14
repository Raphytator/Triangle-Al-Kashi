io.stdout:setvbuf("no")

function math.dist(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end

local a = { x = 50, y = 100}
local b = { x = 200, y = 100}
local c = { x = 150, y = 200}

local type = "line"

local ADB, CDB, CDA, AD, DB, AB, DC, CB, AC

function love.update(dt)
    local mx, my = love.mouse.getPosition()
    
    AD = math.dist(a.x, a.y, mx, my)
    DB = math.dist(mx, my, b.x, b.y)
    DC = math.dist(c.x, c.y, mx, my)
    CB = math.dist(c.x, c.y, b.x, b.y)
    AB = math.dist(a.x, a.y, b.x, b.y)
    AC = math.dist(a.x, a.y, c.x, c.y)

    ADB = math.acos((AD^2 + DB^2 - AB^2) / (2 * AD*DB))    
    CDB = math.acos((DB^2 + DC^2 - CB^2) / (2 * DB*DC))
    CDA = math.acos((DC^2 + AD^2 - AC^2) / (2 * AD*DC))

    angleADB = math.deg(ADB)
    angleCDB = math.deg(CDB)
    angleCDA = math.deg(CDA)

    local totalAngle = angleADB + angleCDB + angleCDA
    print(totalAngle)

    type = "line"

    if math.round(totalAngle) == 360 then 
        type = "fill"
    end
end

function love.draw()
    love.graphics.polygon(type, a.x, a.y, b.x, b.y, c.x, c.y)
    love.graphics.print(type, 5, 5)
end 

function math.round(n, deci) deci = 10^(deci or 0) return math.floor(n*deci+.5)/deci end