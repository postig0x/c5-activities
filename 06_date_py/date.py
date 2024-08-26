# date.py 
# 08/26/2024

# DATE SIMULATOR

# 1. User inputs who is on the date with them
date = input("Who is your date? ")

# 2. User inputs budget for the date
try:
    budget = float(input("What is your budget? "))
except ValueError:
    print("Error: budget should be an integer or decimal.")

# 3. Print the restaurant menu

# 4. User inputs their food/drink item choices

# 5. Tell the user how much money they have left after each order

# 6. At the end, user must agree to pay the bill and then their final bill is shown to them

# 7. Challenge: based on all user inputs, script should decide if they will get a 2nd date
