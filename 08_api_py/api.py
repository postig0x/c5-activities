# 09/03/2024
# Google Translate API (using RapidAPI)
# script that utilizes the Google Translate API from RapidAPI
# (https://rapidapi.com/IRCTCAPI/api/google-translator9)

import requests
import json
import sys
from pprint import pprint

# establish URLS to be used
language_url = "https://google-translator9.p.rapidapi.com/v2/languages"
detect_url = "https://google-translator9.p.rapidapi.com/v2/detect"
translate_url = "https://google-translator9.p.rapidapi.com/v2"

# same headers for every call
headers = {
	"x-rapidapi-key": "d7c1fa9ff5msh53ee3d4f927bc97p1049c2jsn5d95bc4ca58d",
	"x-rapidapi-host": "google-translator9.p.rapidapi.com",
	"Content-Type": "application/json"
}

# detect language function
def detect_language():
    phrase = input("what would you like to translate? ")
    query = {
        "q": phrase
    }

    response = requests.post(detect_url, json=query, headers=headers)
    detected_lang = response.json()['data']['detections'][0][0]['language']

    # if the language is english, offer to translate to another language
    if detected_lang == "en":
        resume = input("This is English. Do you want to translate this to something else (yes/no)? ")
        if resume == "yes":
            target_lang = input("Please provide the ISO-639 language code you want to translate to: ")
            return translate(phrase, detected_lang, target_lang)
        else:
            print("Thanks for using the Translate API!")
    else:
        return detected_lang

# translate any phrase to any language (mostly relies on auto language detection)
def translate(phrase, source="auto", target="en"):
    source = '' if source == "auto" else source
    query = {
	    "q": phrase,
	    "source": source,
	    "target": target,
	    "format": "text"
    }
    response = requests.post(translate_url, json=query, headers=headers)
    return response.json()['data']['translations'][0]['translatedText']

# get all ISO-639 Language Codes and save into a file called languages.txt
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

# load language codes into a list
languages = get_available_languages()

# show menu
print("GOOGLE TRANSLATE API\n"
        "1) Detect Language\n"
        "2) Translate Phrase\n"
        "3) Show available language codes\n")
# act on menu choice
action = input("What would you like to do (1,2,q)? ")
match action:
    case '1':
        # detect
        found_lang = detect_language()
        # if found_lang is actually a translation, change the print statement
        if len(found_lang) > 2:
            print("Translation:", found_lang)
        else:
            print("This is ISO-639 language code", found_lang + ".")
    case '2':
        # translate
        phrase = input("What phrase would you like to translate? ")
        target = input("What language would you like to translate to? Provide the ISO-639 language code: ")
        result = translate(phrase, target=target)
        print("Translation:", result)
    case '3':
        # view languages
        print([lang for lang in languages])
    case 'q':
        # quit
        sys.exit(0)
    case _:
        # default
        print("Input not recognized!")
        sys.exit(1)

