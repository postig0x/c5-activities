# design personalized menu using nested dictionaries

# categories:
#   - appetizers (apps)
#   - main courses
#   - desserts
#   - beverages

# For each item:
#   - price
#   - ingredients
#   - other

# create appetizers

food_menu = {
    "appetizer": {
        "samosa": {
            "price": 3.00
        },
        "fries": {
            "price": 5.00
        },
        "calamari": {
            "price": 10.00
        },
        "dumplings": {
            "price": 7.50
        }
    },
    "main course": {
        "lasagna": {
            "description": "Type of layered pasta dish"
        },
        "pizza": {
            "description": "A cheesy pie"
        },
        "burger": {
            "description": "It's a burger"
        },
        "paella": {
            "description": "Medley of rice, seafood, sausage, vegetables"
        }
    },
    "desserts": {
        "milkshake": {
            "calories": 400
        },
        "sundae": {
            "calories": 600
        },
        "lava_cake": {
            "calories": 800
        },
        "sorbet": {
            "calories": 200
        }
    },
    "beverages": {
        "mango lassi": {
            "is_vegan": False,
            "ingredients": ['mango', 'yogurt', 'water']
        },
        "thai iced tea": {
            "is_vegan": False,
            "ingredients": ['milk', 'black tea', 'sugar']
        },
        "sugarcane juice": {
            "is_vegan": True,
            "ingredients": ['sugarcane', 'ice']
        },
        "water": {
            "is_vegan": True,
            "ingredients": ['hydrogen^2', 'oxygen']
        }
    }
}

