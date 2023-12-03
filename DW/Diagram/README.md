Diagrams
The design of the Data Warehouse was drawn in an information package and star schema with respective attributes :

Dimensions

(-) Date Dimension : Represents the dates when customers rented cars

(-) Car Dimension : Represents the cars that were rented. Captures information about the rental cars, including car model, car type, production year, and number plate.

(-) Location Dimension : Represents the locations where cars were rented.

(-) Fare Dimension : Maintains details about the car rental fares, including rental rates.

(-) Rental Duration Dimension : Tracks the length of car rentals, encompassing attributes like rental duration in days.

Facts

(-) Income : Car rental fares * rental duration
