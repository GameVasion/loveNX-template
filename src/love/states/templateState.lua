return {
    enter = function()
        hi = "hi"
    end,

    load = function()

    end,

    update = function(self, dt)

    end,

    draw = function()
        love.graphics.print(hi, 0, 0)
    end
}
