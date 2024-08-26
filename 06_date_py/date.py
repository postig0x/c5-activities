# date.py 
# 08/26/2024

# DATE SIMULATOR

# import food menu
from menu import food_menu

# 1. User inputs who is on the date with them
date = input("Who is your date? ")

# 2. User inputs budget for the date
try:
    start_budget = float(input("What is your budget? "))
    budget = start_budget
except ValueError:
    print("Error: budget should be an integer or decimal.")

# 3. Print the restaurant menu
# grab cheapest item price from menu loop
price_limit = 0
order = ''
def show_menu():
    print("Today's Menu")
    for i, (cat, blob) in enumerate(food_menu.items()):
        print(cat.title())
        for j, (item, obj) in enumerate(blob.items()):
            print(item.title() + ":", obj['price'])
            if obj['price'] < price_limit or price_limit == 0:
                price_limit = obj['price']
    order = input("What would you like to order? ")

# get cheapest item value
# 4. User inputs their food/drink item choices
while budget > price_limit:
    show_menu()
    print(food_menu.values())

# 5. Tell the user how much money they have left after each order

# 6. At the end, user must agree to pay the bill and then their final bill is shown to them

# 7. Challenge: based on all user inputs, script should decide if they will get a 2nd date
