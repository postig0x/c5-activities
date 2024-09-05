#1/usr/bin/env python3

# 09.05.2024
# Runtime function

# Function that calculates the uptime percentage of a service based on the total number of hours
# and the number of hours the service was down. The function should take 2 parameters (total hrs, down hrs)
# The function should return the uptime percentage rounded to two decimal places

def runtime(total_hrs, down_hrs):
    return round(((total_hrs - down_hrs)/total_hrs) * 100, 2)

total_input = float(input("Total number of hours running? "))
down_input = float(input("Number of hours down? "))

percentage = runtime(total_input, down_input)

print(f"Service has been up {percentage}% of the time")
