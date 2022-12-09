hasSkid = false
startTween = false
floating = false
function onCreatePost()
	makeLuaSprite('Background','stages/terios',0,0)
	makeAnimatedLuaSprite('cannon','stages/cannon2',330.45,844.4)
	scaleObject('cannon', 2.24, 2.24)
	scaleObject('Background', 2.5, 2.5);

	addLuaSprite('Background',false)
	addLuaSprite('cannon',true)
	
	setProperty('gf.x', getProperty('gf.x') + 1500)

end

function onEvent(n,v1,v2)

	if n == 'Fire' then
		addAnimationByPrefix('cannon', 'fire', 'fire',24, false);
		objectPlayAnimation('cannon', 'fire');
	end

	if n == 'CamHUD Fade' then
	
		doTweenAlpha('camGameFade','camGame',0, 0.8,'linear')
	end

end


function onTweenCompleted(tag)
	if tag == 'floatDown' then
		doTweenY('floatUp', 'dad', getProperty('dad.y') - 150, 2, 'sineInOut')
	end
	
	if tag == 'floatUp' then
		startTween = true
	end
end

function onUpdate(elapsed)
	if getProperty('gf.animation.curAnim.name') == 'skid' and hasSkid == false then
		doTweenX('skidIntoScene', getProperty('gf'), getProperty('gf.x') - 1600, 0.6, 'sineOut')
		hasSkid = true
	end
	
    if not mustHitSection then
		setProperty('defaultCamZoom',0.55)
	else
		setProperty('defaultCamZoom',0.75)
	end

	if getProperty('dad.idleSuffix') == '-mad' and floating == false then
		floating = true
		startTween = true
	end
	
	if startTween then
		startTween = false
		doTweenY('floatDown', 'dad', getProperty('dad.y') + 150, 2, 'sineInOut')
	end
	if not middlescroll then
	if curBeat == 0 then
	 setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
			setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)

			setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)

			setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)

			setPropertyFromGroup('playerStrums', 4, 'x', defaultOpponentStrumX4)

			setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 + 0)

			setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 + 0)

			setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 + 0)

			setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3 + 0)

			setPropertyFromGroup('opponentStrums', 4, 'x', defaultPlayerStrumX4 + 0)
    end
	end
	function onUpdatePost(elapsed)
	P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
	P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
	setProperty('iconP1.x',P1Mult - 110)
	setProperty('iconP1.origin.x',240)
	setProperty('iconP1.flipX',true)
	setProperty('iconP2.x',P2Mult + 110)
	setProperty('iconP2.origin.x',-100)
	setProperty('iconP2.flipX',true)
	setProperty('healthBar.flipX',true)
	end
	
	if not gfSection then
		if not mustHitSection then
			setProperty('defaultCamZoom',0.55)
		else
			setProperty('defaultCamZoom',0.65)
		end
	else
		setProperty('defaultCamZoom',0.85)
	end
end

