# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

------------------------------
*Explain what should happen model-wise if an event is deleted and guests have already cast votes. Explain how your model layer is well-behaved in this scenario. 

If an event is deleted, the votes associated with that event also be erased. This happens because the model Vote has an Association to Guest_List as a FK and the model Guest_List has Event_id as FK, so if the event is deleted their event_id won’t exist and neither would guest_list exist.  Our model layer is well-behaved in this scenario because we implement in the associations a thing called dependent: :destroy, so we can be sure that everything associated with that event will be deleted.

*Explain what should happen model-wise if an organization is deleted and events have been already created within the organization. Explain how your model layer is well-behaved in this scenario.
    
As above, we have the Events directly associated with Organization through a FK in the Events model, so if we implement the same association with dependent: :destroy, the events will also be deleted. This happens because there is a direct association between the models.

