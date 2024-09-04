# 09/03/2024
# API (using RapidAPI)

import requests
import json
import sys
from pprint import pprint

language_url = "https://google-translator9.p.rapidapi.com/v2/languages"
detect_url = "https://google-translator9.p.rapidapi.com/v2/detect"
translate_url = "https://google-translator9.p.rapidapi.com/v2"

headers = {
	"x-rapidapi-key": "d7c1fa9ff5msh53ee3d4f927bc97p1049c2jsn5d95bc4ca58d",
	"x-rapidapi-host": "google-translator9.p.rapidapi.com",
	"Content-Type": "application/json"
}

def detect_language():
    phrase = input("what would you like to translate? ")
    query = {
        "q": phrase
    }

    response = requests.post(detect_url, json=query, headers=headers)
    detected_lang = response.json()['data']['detections'][0][0]['language']
    if detected_lang == "en":
        target_lang = input("what language do you want to translate to? ")
        translate_language(target_lang, phrase)
    # edge case: confidence on detected language is low
    # confidence = response['data']['detections'][0][0]['confidence']


def translate(phrase, source="es", target="en"):
    query = {
	    "q": phrase,
	    "source": source,
	    "target": target,
	    "format": "text"
    }
    response = requests.post(translate_url, json=query, headers=headers)
    print(response.json())

def get_available_languages():
    try:
        with open('languages.txt', 'x', encoding='utf-8') as f:
            response = requests.get(language_url, headers=headers).json()
            lang_list = [lang for langObj in response['data']['languages'] for lang in langObj.values()]
            json.dump(lang_list, f)
            return lang_list
    except FileExistsError:
        print("No need to waste an API call, languages.txt already exists.\n")
        with open('languages.txt', 'r') as f:
            return json.load(f)


languages = get_available_languages()

print("GOOGLE TRANSLATE API\n"
        "1) Detect Language\n"
        "2) Translate Phrase\n")
action = input("What would you like to do (1,2,q)? ")
match action:
    case '1':
        print('detect')
    case '2':
        print('translate')
    case 'q':
        sys.exit(0)
    case _:
        print("I'm confused")

translate("hola como estas")
