return baton.new {
    controls = {
        confirm = {"key:return", "button:start"}
    },
    joystick = love.joystick.getJoysticks()[1]
}
