import speech_recognition as sr
import sys


# obtain path to "english.wav" in the same folder as this script
from os import path

def main():

	AUDIO_FILE = str(sys.argv[1])
	# AUDIO_FILE = path.join(path.dirname(path.realpath(__file__)), "french.aiff")
	# AUDIO_FILE = path.join(path.dirname(path.realpath(__file__)), "chinese.flac")
	# use the audio file as the audio source
	r = sr.Recognizer()
	with sr.AudioFile(AUDIO_FILE) as source:
	    audio = r.record(source)  # read the entire audio file
	try:
	    # for testing purposes, we're just using the default API key
	    # to use another API key, use `r.recognize_google(audio, key="GOOGLE_SPEECH_RECOGNITION_API_KEY")`
	    # instead of `r.recognize_google(audio)`
	    text = r.recognize_google(audio)
	    print(text)
	except sr.UnknownValueError:
	    print("Google Speech Recognition could not understand audio")
	except sr.RequestError as e:
	    print("Could not request results from Google Speech Recognition service; {0}".format(e))	    

main()	    