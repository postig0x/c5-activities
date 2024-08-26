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

# make key value pairs for menu item and price
price_list = {}
for i, itemObj in enumerate(food_menu.values()):
    for item in itemObj.keys():
        price_list[item] = itemObj[item]['price']

# grab cheapest item price from menu
price_limit = min(price_list.values())

# 3. Print the restaurant menu
def show_menu():
    global order
    print("Today's Menu")
    for i, (cat, blob) in enumerate(food_menu.items()):
        print(cat.title())
        print()
        for j, (item, obj) in enumerate(blob.items()):
            print(item.title() + ":", f"{obj['price']:.2f}")  
    print()
    order = input("What would you like to order? ").lower()

# 4. User inputs their food/drink item choices
items_ordered = 0 # count how many items the user orders
# when the budget is less than the price of the cheapest item, the date will end
while budget > price_limit:
    show_menu()
    if order == 'leave':
        print("You have left the restaurant.")
        break
    try:
        budget -= price_list[order]
        items_ordered += 1
        # 5. Tell the user how much money they have left after each order
        print(f"You have ${budget:.2f} left after your order.")
        print()
    except KeyError:
        print("Error: invalid item")
        print()

# 6. At the end, user must agree to pay the bill and then their final bill is shown to them
if order != 'leave':
    terms = input("Do you agree to pay the bill? (yes/no) ")
    if terms.lower() == 'yes':
        print(f"You paid ${start_budget - budget:.2f} for your date.")
    else:
        print("You did not agree to pay the bill.")

# 7. Challenge: based on all user inputs, script should decide if they will get a 2nd date
if (items_ordered > 4):
    print("You will get a second date.")
else:
    print("You will not get a second date.")
