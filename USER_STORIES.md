
User stories

## Viewing the menu

As a user
In order to initiate the application for someone who does not familiar with the app
I want to see what I need to do

Acceptance criteria:

    If user selects 1, they see "Enter your first name ..."
    If user selects 2, they see "Enter your first and passcode ..."
    If user selects 3, they see "Enter your name and passcode ..."
    If user selects 4, they see "Enter your name and passcode ..."

    User requested to enter name

Usage:

    > ./cal_meal
    What do you want to do? (Enter the number for your choice)
    1. Create a Diet Cal.
    2. View your Diet Cal.
    3. Edit your Diet Cal.
    4. Delete your Diet Cal.


## Selecting menu

# Adding user and diet

As a user
In order to initiate the correct response with user selection (#1)

Acceptance criteria:

  User can create multiple diet cal

Usage:

    > ./cal_meal
    What do you want to do? (Enter the number for your choice)
    1. Create a Diet Cal.
    2. View your Diet Cal.
    3. Edit your Diet Cal.
    4. Delete your Diet Cal.
    - 1
    Enter your first name (Example <Sam>)
    - Sam
    Select the type of diet (Enter the number for your choice)
    1. Vegetarian
    2. Vegan
    3. Full
    - 1
    How many meals a day? (Enter number 1 2 3 ...)
    - 4
    4 Vegeterian meals diet a day has been added with passcode 1.

# Viewing valide user and associated diet

As a user
In order to initiate the correct response with user selection (#2)

Acceptance criteria:

  User must provide his pass code
  User must enter his first name

Usage:

    > ./cal_meal
    What do you want to do? (Enter the number for your choice)
    1. Create a Diet Cal.
    2. View your Diet Cal.
    3. Edit your Diet Cal.
    4. Delete your Diet Cal.
    - 2
    Enter your firstname (Example <Sam>)
    - Sam
    Enter your Passcode (Example <1>)
    - 1
    Name: Sam
    Diet: Vegeterian diet.
    Frequencey: 4 meals a day.



# Editing valide user and associated diet

As a user
In order to initiate the correct response with user selection (#3)

Acceptance criteria:

  User must provide his pass code
  User must enter his first name

Usage:

    > ./cal_meal
    What do you want to do? (Enter the number for your choice)
    1. Create a Diet Cal.
    2. View your Diet Cal.
    3. Edit your Diet Cal.
    4. Delete your Diet Cal.
    - 3
    Enter your firstname (Example <Sam>)
    - Sam
    Enter your Passcode (Example <1>)
    - 1
    Name: Sam
    Diet: Vegeterian diet.
    Frequencey: 4 meals a day.
    Enter 1 to edit name, if not hit enter.
    - 1
    Enter the new first name.
    - Samuel
    Name has been updated to Samuel.
    Enter 2 to edit diet, if not hit enter.
    2
    Select the type of diet (Enter the number for your choice)
    1. Vegetarian
    2. Vegan
    3. Full
    - 2
    How many meals a day? (Enter number 1 2 3 ...)
    - 6
    Diet has been updated to: Vegan and frequency: 6.


# Deleting valide user

As a user
In order to initiate the correct response with user selection (#4)

Acceptance criteria:

  User must provide his pass code
  User must enter his first name

Usage:

    > ./cal_meal
    What do you want to do? (Enter the number for your choice)
    1. Create a Diet Cal.
    2. View your Diet Cal.
    3. Edit your Diet Cal.
    4. Delete your Diet Cal.
    - 4
    Enter your firstname (Example <Sam>)
    - Sam
    Enter your Passcode (Example <1>)
    - 1
    Enter 1 to delete user.. 2 to delete user and diet
    - 1
    'Sam' has been deleted.

# Deleting valide user and associated diet

As a user
In order to initiate the correct response with user selection (#4)

Acceptance criteria:

  User must provide his pass code
  User must enter his first name

Usage:

    > ./cal_meal
    What do you want to do? (Enter the number for your choice)
    1. Create a Diet Cal.
    2. View your Diet Cal.
    3. Edit your Diet Cal.
    4. Delete your Diet Cal.
    - 4
    Enter your firstname (Example <Sam>)
    - Sam
    Enter your Passcode (Example <1>)
    - 1
    Enter 1 to delete user.. 2 to delete user and diet
    - 2
    'Sam' and associated diet has been deleted.

