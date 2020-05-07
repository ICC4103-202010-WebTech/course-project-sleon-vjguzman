# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User #1
u1 = User.new(username: 'vjguzman', full_name: 'Veronica Guzman', short_bio: 'Hi, my name is Veronica', location: 'Los Andes', email: 'vjguzman@miuandes.cl', password: '12345678')
u1.save!
#Organization #1
o1 = Organization.new(name: 'UANDES', description: 'only for students of UAndes')
o1.save!
#Member_List #1
m1 = MembersList.new(user_role: 'member')
u = User.first
o = Organization.first
m1.user_id = u.id
m1.organization_id = o.id
m1.save!
#User #2
u1 = User.new(username: 'sleon', full_name: 'Santiago Leon', short_bio: 'Hi, my name is Santiago', location: 'Las Condes', email: 'sleon@miuandes.cl', password: 'hola123')
u1.save!
#Member_List #2
m2 = MembersList.new(user_role: 'admin')
u1 = User.second
o2 = Organization.first
m2.user_id = u1.id
m2.organization_id = o2.id
m2.save!
#Privacy #1
p1 = Privacy.new(name: 'Public', description: 'see if the event is public in an organization')
p1.save!
#Privacy #2
p2 = Privacy.new(name: 'Private', description: 'see if the event is private in an organization')
p2.save!
#Choice_of_Date #1
c1 = ChoiceOfDate.new(description: 'The event creator can set a minimum number of guests that must commit their votes, before the system automatically picks the date with the most votes')
c1.save!


#Choice_of_Date #2
c2 = ChoiceOfDate.new(description: 'The event creator can set a minimum number of guests that must commit their votes, before he/she is allowed to manually decide the date for the event')
c2.save!
#Event #1
e = Event.new(description: 'Tournament of Lol 2020', location: 'Uandes', final_date: 20200821170000, creation_date: 2020042018000)
o = Organization.first
e.organization_id = o.id
c = ChoiceOfDate.first
e.choice_of_date_id = c.id
p = Privacy.first
e.privacy_id = p.id
e.save!
#Event_Creator #1
c = EventCreator.new()
e = Event.first
u = User.second
c.user_id = u.id
c.event_id = e.id
c.save!
#User_Invitations #1
i = UserInvitation.new(description: 'invitation to Lol tournament 2020')
u = User.first
e = Event.first
i.user_id = u.id
i.event_id = e.id
i.save!
#Comments #1
c = Comment.new(message: 'hi, I’m really interest in the event!!')
u = User.first
e = Event.first
c.user_id = u.id
c.event_id = e.id
c.save!
#Comments #2
c = Comment.new(message: ':)')
u = User.second
e = Event.first
c.user_id = u.id
c.event_id = e.id
c.save!

#Guest_List #1
g = GuestList.new()
u = User.first
e = Event.first
g.user_id = u.id
g.event_id = e.id
g.save!

#Event #2
e = Event.new(description: 'party',  location: 'Los Andes', final_date: 20200821170000, creation_date: 2020042018000)
o = Organization.first
c = ChoiceOfDate.second
p = Privacy.second
e.organization_id = o.id
e.choice_of_date_id = c.id
e.privacy_id = p.id
e.save!

#Event_Creator #2
c = EventCreator.new()
e = Event.second
u = User.first
c.user_id = u.id
c.event_id = e.id
c.save!
#User_Invitations #2
i = UserInvitation.new(description: 'invitation to a party')
u = User.second
e = Event.second
i.user_id = u.id
i.event_id = e.id
i.save!
#Comments #3
c = Comment.new(message: 'I love parties!')
u = User.second
e = Event.second
c.user_id = u.id
c.event_id = e.id
c.save!
#Guest_List #2
g = GuestList.new()
u = User.second
e = Event.second
g.user_id = u.id
g.event_id = e.id
g.save!
#System_Admin #1
s = SystemAdmin.new(admin: true)
u = User.second
s.user_id = u.id
s.save!
#System_Admin #2
s = SystemAdmin.new(admin: true)
u = User.first
s.user_id = u.id
s.save!