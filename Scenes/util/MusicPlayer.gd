extends Node

var songs := []
var currentSongIndex = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for song in get_children():
		if song is AudioStreamPlayer:
			songs.append(song)
	
	play_next_song()

func play_next_song():
	if songs.size() > 0:
		var currentSong = songs[currentSongIndex]
		currentSong.play()
		currentSong.connect("finished", self, "song_finished")
		currentSongIndex = (currentSongIndex + 1) % songs.size()

func song_finished():
	play_next_song()
