# This script is for replay recent recordings to help try to figure out audio
# errors, clipping bugs, etc
#tag: user.record_replay
-

# replay one of the last 10 audio recordings
replay last: user.replay_last_recording()
replay select: user.replay_recording_choose()
