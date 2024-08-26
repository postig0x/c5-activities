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
    "appetizers": {
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
    "main courses": {
        "lasagna": {
            "description": "Type of layered pasta dish",
            "price": 18.00
        },
        "pizza": {
            "description": "A cheesy pie",
            "price": 16.00,
        },
        "burger": {
            "description": "It's a burger",
            "price": 10.00,
        },
        "paella": {
            "description": "Medley of rice, seafood, sausage, vegetables",
            "price": 20.00
        }
    },
    "desserts": {
        "milkshake": {
            "calories": 400,
            "price": 4.00,
        },
        "sundae": {
            "calories": 600,
            "price": 6.00,
        },
        "lava cake": {
            "calories": 800,
            "price": 8.00,
        },
        "sorbet": {
            "calories": 200,
            "price": 6.00
        }
    },
    "beverages": {
        "mango lassi": {
            "is_vegan": False,
            "ingredients": ['mango', 'yogurt', 'water'],
            "price": 6.00,
        },
        "thai iced tea": {
            "is_vegan": False,
            "ingredients": ['milk', 'black tea', 'sugar'],
            "price": 3.50,
        },
        "sugarcane juice": {
            "is_vegan": True,
            "ingredients": ['sugarcane', 'ice'],
            "price": 4.50,
        },
        "water": {
            "is_vegan": True,
            "ingredients": ['hydrogen^2', 'oxygen'],
            "price": 3.00,
        }
    }
}

