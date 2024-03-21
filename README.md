# City Explorer Backend 

## Objective:
1. A system which is responsible for fetching real-time weather data, querying a mapping service for
location-based information, storing user preferences, and generating personalized activity recommendations.

## Technologies Used:
1. Django Rest Framework
2. SQLite

## Setup:
1. Clone the repository / obtain the zip file and extract it
2. Install the requirements using `pip install -r requirements.txt` after navigating to the project directory and
setting up a virtual environment
3. Based on the .env.sample file, create a .env file with required settings
4. Run the migrations using `python manage.py make migrations` and `python manage.py migrate`
5. Run the server using `python manage.py runserver 8000`
6. General Migrations would be required for the database to be set up properly. SQL commands for populating the tables 
would be provided in the scripts' folder.
