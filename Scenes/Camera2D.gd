extends Camera2D

var targetPosition = Vector2.ZERO

export(Color, RGB) var backgroundColor
export (OpenSimplexNoise) var shakeNoise
export (OpenSimplexNoise) var eventShakeNoise

var xNoiseSampleVector = Vector2.RIGHT
var yNoiseSampleVector = Vector2.DOWN
var xNoiseSamplePosition = Vector2.ZERO
var yNoiseSamplePosition = Vector2.ZERO

#regular camera shake
var noiseSampleTravelRate = 10
var maxShakeOffset = 100
var currentShakePercentage = 0

#event camera shake
var eventNoiseSampleTravelRate = 1000000000000000
var eventMaxShakeOffset = 100
var eventCurrentShakePercentage = 0
var eventShakeDecay = .8

func _ready():
	VisualServer.set_default_clear_color(backgroundColor)

func _process(delta):
	acquire_target_position()
	global_position = lerp(targetPosition, global_position, pow(4,-20 * delta))
	# normal camera shake
	if (currentShakePercentage > 0):
		xNoiseSamplePosition += xNoiseSampleVector * noiseSampleTravelRate * delta
		yNoiseSamplePosition += yNoiseSampleVector * noiseSampleTravelRate * delta
		var xSample = shakeNoise.get_noise_2d(xNoiseSamplePosition.x, xNoiseSamplePosition.y)
		var ySample = shakeNoise.get_noise_2d(yNoiseSamplePosition.x, yNoiseSamplePosition.y)
		
		var calculated_offset = Vector2(xSample, ySample) * maxShakeOffset * currentShakePercentage
		offset = calculated_offset
	
	#event camera shake
	elif (eventCurrentShakePercentage > 0):
		xNoiseSamplePosition += xNoiseSampleVector * noiseSampleTravelRate * delta
		yNoiseSamplePosition += yNoiseSampleVector * noiseSampleTravelRate * delta
		var xSample = eventShakeNoise.get_noise_2d(xNoiseSamplePosition.x, xNoiseSamplePosition.y)
		var ySample = eventShakeNoise.get_noise_2d(yNoiseSamplePosition.x, yNoiseSamplePosition.y)
		
		var calculated_offset = Vector2(xSample, ySample) * eventMaxShakeOffset * eventCurrentShakePercentage
		offset = calculated_offset
		eventCurrentShakePercentage = clamp(eventCurrentShakePercentage - eventShakeDecay * delta, 0, 1)
		
func acquire_target_position():
	var players = get_tree().get_nodes_in_group("player")
	if (players.size() > 0):
		var player = players[0]
		targetPosition = player.global_position

func apply_shake(percentage):
	currentShakePercentage = clamp(currentShakePercentage + percentage, 0, 1)

func apply_event_shake(percentage):
	eventCurrentShakePercentage = clamp(eventCurrentShakePercentage + percentage, 0, 1)
