# AQI

Project is using VIPER Archicture.
VIPER is a backronym for View, Interactor, Presenter, Entity, and Router.
View- Responsible for UI Creation and handlingg user action
Interactor- Responsible for appling business logic
Presenter - Responsible for applying presentation Logic
Entity - Hold app data
Router -  Responsible for navigation between one screen to another screen

Communication Flow

View --> Interactor --> Domain (BLL)  --> Presenter  --> ViewController(Update View data / routing)
