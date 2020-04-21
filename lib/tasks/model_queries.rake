namespace :db do
  task :model_queries => :environment do
    #Get all events created by certain user.
    puts('Query 1: Get all events created by certain user, user_id = 2')
    result_1 = EventCreator.where("user_id= 2").select(:event_id)
    puts(result_1)
    puts('EOQ')

    #Get all users belonging to an organization
    puts('Query 2: Get all users belonging to an organization, organization_id = 1')
    result_2 = MembersList.where("organization_id = 1").select(:user_id)
    puts(result_2)
    puts('EOQ')

    #Get all public events in an organization (privacy id = 1 es público)
    puts('Query 3: Get all public events in an organization, privacy_id = 1 is public, organization_id = 1')
    result_3 = Event.where('organization_id= 1 and privacy_id = 1')
    puts(result_3)
    puts('EOQ')

    #Get all private events in an organization
    puts('Query 4: Get all private events in an organization, privacy_id = 2 is private, organization_id = 1')
    result_4 = Event.where('organization_id = 1 and privacy_id = 2')
    puts(result_4)
    puts('EOQ')

    #Get all guests that have been invited to a certain event
    puts('Query 5: Get all guest that have been invited to a certain event, event_id = 1')
    result_5 = GuestList.where(event_id: 1).select(:user_id)
    puts(result_5)
    puts('EOQ')

    #Get all guests that have voted for a date option in a certain event
    puts('Query 6: Get all guest that have voted for a date option in a certain event, event_id = 1')
    result_6 = GuestList.joins(:votes).where(guest_list: {event_id: 1})
    puts(result_6)
    puts('EOQ')

    #Get all comments written by users on a specific event
    puts('Query 7: Get all comments written by users on a specific event, event_id = 1')
    result_7 = Comment.where(event_id: 1)
    puts(result_7)
    puts('EOQ')

    #Get all comments written by a specific user on all events
    puts('Query 8: Get all comments written by a specific user on a all events, user_id = 2')
    result_8 = Comment.where(user_id: 2)
    puts(result_8)
    puts('EOQ')

    #Get all users with administrative privileges in an organization
    puts('Query 9: Get all users with administrative privileges in an organization, organization_id = 1')
    result_9 = MembersList.where('user_role= "admin" and organization_id= 1').select(:user_id)
    puts(result_9)
    puts('EOQ')

    #Get all users with administrative privileges in the system
    puts('Query 10: Get all users with administrative privileges in the system, organization_id = 1')
    result_10 = SystemAdmin.where(admin: true)

    puts(result_10)
    puts('EOQ')

  end
end