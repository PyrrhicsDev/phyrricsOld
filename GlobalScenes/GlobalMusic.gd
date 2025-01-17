extends AudioStreamPlayer

const level_music = preload("res://Arknights  Babel Piano Arrangement 明日方舟巴別塔重鑄未來方舟啟航[钢琴].mp3")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return

	stream = music
	volume_db = volume
	play()

func play_menu_music():
	_play_music(level_music)

func play_FX(stream: AudioStream, volume = 0.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = stream
	fx_player.name = "FX_PLAYER"
	fx_player.volume_db = volume
	add_child(fx_player)
	fx_player.play()

	await fx_player.finished
	fx_player.queue_free()
