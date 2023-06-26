filtype = ["single","mfj","mfs","head"] #filing options
tryagain = 1
while tryagain == 1: #use a loop to check the user input against the filing options
    filing = input("How are you filing?(Single,MFJ,MFS,Head): ").lower() #case insensitive
    if filing in filtype:
        tryagain = 0 #move on
    else:
        print("Please select from the available options") #loop back and try again

perc = [0.1,0.12,0.22,0.24,0.32,0.35,0.37] #interest rates are the same across filing types
if filing == filtype[0]: #using if/else to check the filing type and apply the proper income brackets
    bracket = [0,10275,41775,89075,170050,215950,539900]
elif filing == filtype[1]:
    bracket = [0,20550,83550,178150,340100,431900,647850]
elif filing == filtype[2]:
    bracket = [0,10275,41775,89075,170050,215950,323925]
elif filing == filtype[3]:
    bracket = [0,14650,55900,89050,170050,215950,539900] 

income = round(float(input("what is your income?: "))) #ask the user for their income
taxsum = 0
tier = 6
def inctax(): #function that will cycle through all the lower brackets and add up the tax
    tier = level
    taxsum = 0
    while tier > 0:
        taxsum = (bracket[tier] - bracket[tier-1]) * perc[tier-1] + taxsum
        tier = tier - 1
    return taxsum #outputs the result

while tier > 0: #looping through the brackets to find the right one and calculate the tax on the remainder
    if income > bracket[tier]:
        level = tier
        tax = round((income - bracket[tier]) * perc[tier] + inctax()) #all taxes added up and rounded
        income = "${:,d}".format(income)
        tax = "${:,d}".format(tax)
        print (f"An income of {income} will be required to pay {tax} in taxes") #output the total tax owed
        break
    tier = tier-1
