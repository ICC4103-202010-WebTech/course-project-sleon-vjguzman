# README
//Assignment 1.1// <br/>
1* Explain what should happen model-wise if an event is deleted and guests have already cast votes. Explain how your model layer is well-behaved in this scenario. 

If an event is deleted, the votes associated with that event also be erased. This happens because the model Vote has an Association to Guest_List as a FK and the model Guest_List has Event_id as FK, so if the event is deleted their event_id won’t exist and neither would guest_list exist.  Our model layer is well-behaved in this scenario because we implement in the associations a thing called dependent: :destroy, so we can be sure that everything associated with that event will be deleted.

2*Explain what should happen model-wise if an organization is deleted and events have been already created within the organization. Explain how your model layer is well-behaved in this scenario.
    
As above, we have the Events directly associated with Organization through a FK in the Events model, so if we implement the same association with dependent: :destroy, the events will also be deleted. This happens because there is a direct association between the models.

<br/>

//Assignment 2// <br/>
1 > Summary of implemented features.
    We implemented features for the important sections of the site, like Events, Organizations, User, Comment, System_Admin,       for that we do the following things
    1. We make the appropriate routes and nested routes for all of the sections just like we did in the lab assignment 7 also        we put a root route of the application point to pages#home.
    2. We make the controller for all of the sections and one for the home page named PagesController that just have the home        action.
    3. We implement APIs to perform CRUD operations on Event and Comments, like destroy, create, read and update. For this we        had to work with the files edit, destroy, new in the views of Event and Comment.
    4. We create a collection of request in Postman to test the API operations.
    5. Then we make the HTML for all of the sections trying to follow the wireframes prototypes we made for the assignment            1.1. We make everything like tables because we think it’s more organized to see all the things in the db, also we make        a navigation bar to make it easier to access the other sections.
    6. We also put more things in the bd (in the seeds.rb file), like Events, Organizations, Users, Comments on Events,               System_Admins, so we populated the database with more resources.
    7. We ensure that the HTML and CSS views complies with web standards, so we use validations services provided by W3C.
    8. Finally we investigate about the Bootstrap in order to implement a layout for the web application.
    
2 > Summary of features required in the assignment but pending.

3 > API Tests, which should include links to your Postman collection containing tests for your APIs. 
