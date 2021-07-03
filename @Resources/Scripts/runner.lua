function Initialize()
    Location = SKIN:GetVariable("@").."app"
end


function Update()
    if SKIN:GetVariable("AppRun") == "on" then
        SKIN:Bang("!SetVariable", "AppRun", "off")

        local command = table.concat({
            [[start %ComSpec% /D /E:ON /F:OFF /K]],
            string.format([["call cd %s &]], Location),
            [[bundle install & bundle exec ruby app.rb"]]
        })

        os.execute(command)
    end
end