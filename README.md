# README
//Assignment 1.1// <br/>
* Explain what should happen model-wise if an event is deleted and guests have already cast votes. Explain how your model layer is well-behaved in this scenario. 

If an event is deleted, the votes associated with that event also be erased. This happens because the model Vote has an Association to Guest_List as a FK and the model Guest_List has Event_id as FK, so if the event is deleted their event_id won’t exist and neither would guest_list exist.  Our model layer is well-behaved in this scenario because we implement in the associations a thing called dependent: :destroy, so we can be sure that everything associated with that event will be deleted.

* Explain what should happen model-wise if an organization is deleted and events have been already created within the organization. Explain how your model layer is well-behaved in this scenario.
    
As above, we have the Events directly associated with Organization through a FK in the Events model, so if we implement the same association with dependent: :destroy, the events will also be deleted. This happens because there is a direct association between the models.

<br/>

//Assignment 2// <br/>
* Summary of implemented features.<br/>
    We implemented features for the important sections of the site, like Events, Organizations, User, Comment, System_Admin,       for that we do the following things<br/>
    1. We make the appropriate routes and nested routes for all of the sections just like we did in the lab assignment 7 also        we put a root route of the application point to pages#home.<br/>
    2. We make the controller for all of the sections and one for the home page named PagesController that just have the home        action.<br/>
    3. We implement APIs to perform CRUD operations on Event and Comments, like destroy, create, read and update. For this we        had to work with the files edit, destroy, new in the views of Event and Comment.<br/>
    4. We create a collection of request in Postman to test the API operations.<br/>
    5. Then we make the HTML for all of the sections trying to follow the wireframes prototypes we made for the assignment            1.1. We make everything like tables because we think it’s more organized to see all the things in the db, also we make        a navigation bar to make it easier to access the other sections.<br/>
    6. We also put more things in the bd (in the seeds.rb file), like Events, Organizations, Users, Comments on Events,               System_Admins, so we populated the database with more resources.<br/>
    7. We ensure that the HTML and CSS views complies with web standards, so we use validations services provided by W3C.<br/>
    8. Finally we investigate about the Bootstrap in order to implement a layout for the web application.<br/>
    
* Summary of features required in the assignment but pending.<br/>

* API Tests, which should include links to your Postman collection containing tests for your APIs.<br/>
    https://www.getpostman.com/collections/d9675644004b161cbc0f

* Commentaries:
    This webpage was designed in a screen with a resolution of 1920 x 1080 (in case some designes looks a bit disproportional), and         there are some blacked spaces that are designed to place the respetive images of the profile pictures and events.
<br/>

//Assignment 3// <br/>
* Summary of implemented features.<br/>
   1. We make the controllers for the models Event_Dates, Votes, Event_Creators and Multimedia, also we put the appropriate routes and nested routes for the models.<br/>
    2. We perform (just like in the project assignment 2) CRUD operations for Organizations and we amend some little errors from the CRUD operations in Events and Events Comments.<br/>
    3. We create a collection of request in Postman to prove that all of the CRUD operations works perfectly.  It’s the same link from the last assignment which is posted above in the section of Assignment 2.<br/>
    4. We make possible to see an user profile with his information, events to which the user has been invited, also we implements the corresponding things to make an user (the one is log in) to edit their information like the name, bio and location. We also make possible to see the created events from this user in the section of the nav bar call “My Events”.<br/>
    5. Then we make the HTML for all of the sections trying to follow the wireframes prototypes we made for the assignment            1.1. We make everything like tables because we think it’s more organized to see all the things in the db, also we make        a navigation bar to make it easier to access the other sections.<br/>
    6. Then we make possible to see the organization page and manage their information (assuming that the logged user is an admin of the organization). We also put the code to see the public events of this organization.<br/>
    7. Regarding events we make possible to see their page with this information like title, description, location and creation date. We also put their images, videos and file attachments, with the ActiveStorage.<br/>
    8. We implement an unless in case it doesn't have attached a picture, banner, images, videos, etc <br/>
    9. We make possible to star event date vote with our Event_Date model, since this keeps all of the dates that the creator puts for the guest to vote. We also make possible to configure the event date vote and be able to vote for the events that the logged user is invited to.<br/> 
    10. We make possible to delete an event from the section “My Events” and all of their related information in other models.<br/>
    11. Regarding to the comments of an event, we make possible to add a comment and view all of the comments in the event.<br/>
    12. We implement a search bar so that the user can search users and their events, organizations and their public events and the events.<br/>
    13. Finally we put a feedback to the user in every action in the web page with an “notification” message.<br/>
   <br/>
* Summary of features required in the assignment but pending.<br/>
    1. It’s not an required feature but we choose not to implement the fixtures and fake data.<br/>
    2. We couldn't make it possible to vote for all of the events that the user is invited to, because we don't know how to select an event_id and put it in the new Vote section.<br/>
