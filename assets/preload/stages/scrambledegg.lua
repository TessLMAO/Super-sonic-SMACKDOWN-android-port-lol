
function onCreate()
	
	--Makes the gloop sprite and marks down its animations
	makeLuaSprite('lights','stages/SEgg/lights', -200, 0)
	setScrollFactor('lights', 0.6, 0.6);
	scaleObject('lights', 2.5, 2.5);

	makeLuaSprite('floor','stages/SEgg/floor', 0, 1164)
	scaleObject('floor', 2.5, 2.5);

	addLuaSprite('lights',false)
	addLuaSprite('floor',false)

end

function onUpdate(elapsed)

    if not mustHitSection then
		setProperty('defaultCamZoom',0.6)
	else
		setProperty('defaultCamZoom',0.7)
	end
end