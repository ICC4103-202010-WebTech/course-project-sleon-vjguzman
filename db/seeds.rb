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
#User #1
u1 = User.new(username: 'vjguzman', full_name: 'Veronica Guzman', short_bio: 'Hi, my name is Veronica', location: 'Los Andes', email: 'vjguzman@miuandes.cl', password: '12345678')
u1.save!
#User #2
u1 = User.new(username: 'sleon', full_name: 'Santiago Leon', short_bio: 'Hi, my name is Santiago', location: 'Las Condes', email: 'sleon@miuandes.cl', password: 'hola123')
u1.save!
#User #3
u3 = User.new(username: 'arancexd', full_name: 'Roberto Arance', short_bio: 'Hi, my name is Arance', location: 'Las Condes', email: 'arance@miuandes.cl', password: 'lolcito123')
u3.save!
#User #4
u4 = User.new(username: 'thomasmayer', full_name: 'Thomas Mayenberger', short_bio: 'Hi, my name is Thomas and I like to drink beer', location: 'Las Condes', email: 'tgmayer@miuandes.cl', password: 'bier123')
u4.save!
#Organization #1
o1 = Organization.new(name: 'UANDES', description: 'only for students of UAndes')
o1.save!
#Member_List #1
m1 = MembersList.new(user_role: 'member')
u1 = User.first
o1 = Organization.first
m1.user_id = u1.id
m1.organization_id = o1.id
m1.save!
#Member_List #2
m2 = MembersList.new(user_role: 'admin')
u2 = User.second
o1 = Organization.first
m2.user_id = u2.id
m2.organization_id = o1.id
m2.save!
#Organization 2
o2 = Organization.new(name: 'Party Planners', description: 'only for people who like to party!')
o2.save!
#Member_List 3
m3 = MembersList.new(user_role: 'member')
u3 = User.third
o2 = Organization.second
m3.user_id = u3.id
m3.organization_id = o2.id
m3.save!
#Member_List 4
m3 = MembersList.new(user_role: 'member')
u4 = User.fourth
o2 = Organization.second
m3.user_id = u4.id
m3.organization_id = o2.id
m3.save!
#Event #1
e1 = Event.new(description: 'Tournament of Lol 2020', location: 'Uandes', final_date: '13/12/2020 - 17:00', creation_date: '11/01/2020 - 13:00')
o1 = Organization.first
e1.organization_id = o1.id
c1 = ChoiceOfDate.first
e1.choice_of_date_id = c1.id
p1 = Privacy.first
e1.privacy_id = p1.id
e1.save!
#Event_Creator #1
c1 = EventCreator.new()
e1 = Event.first
u2 = User.second
c1.user_id = u2.id
c1.event_id = e1.id
c1.save!
#User_Invitations #1
i1 = UserInvitation.new(description: 'invitation to Lol tournament 2020')
u1 = User.first
e1 = Event.first
i1.user_id = u1.id
i1.event_id = e1.id
i1.save!
#User_Invitations #2
i2 = UserInvitation.new(description: 'invitation to Lol tournament 2020')
u3 = User.third
e1 = Event.first
i2.user_id = u3.id
i2.event_id = e1.id
i2.save!
#Comments #1
c1 = Comment.new(message: 'hi, I’m really interest in the event!!')
u1 = User.first
e1 = Event.first
c1.user_id = u1.id
c1.event_id = e1.id
c1.save!
#Comments #2
c2 = Comment.new(message: ':)')
u2 = User.second
e1 = Event.first
c2.user_id = u2.id
c2.event_id = e1.id
c2.save!
#Guest_List #1
g1 = GuestList.new()
u1 = User.first
e1 = Event.first
g1.user_id = u1.id
g1.event_id = e1.id
g1.save!
#Guest_List #2
g2 = GuestList.new()
u3 = User.thirds
e1 = Event.first
g1.user_id = u3.id
g1.event_id = e1.id
g2.save!
#Event #2
e2 = Event.new(description: 'party',  location: 'Los Andes', final_date: '13/12/2020 - 17:00', creation_date: '11/10/2020 - 13:00')
o1 = Organization.first
c2 = ChoiceOfDate.second
p2 = Privacy.second
e2.organization_id = o1.id
e2.choice_of_date_id = c2.id
e2.privacy_id = p2.id
e2.save!
#Event_Creator #2
c2 = EventCreator.new()
e2 = Event.second
u1 = User.first
c2.user_id = u1.id
c2.event_id = e2.id
c2.save!
#User_Invitations #2
i3 = UserInvitation.new(description: 'invitation to a party')
u2 = User.second
e2 = Event.second
i3.user_id = u2.id
i3.event_id = e2.id
i3.save!
#Comments #3
c3 = Comment.new(message: 'I love parties!')
u2 = User.second
e2 = Event.second
c3.user_id = u2.id
c3.event_id = e2.id
c3.save!
#Comments #4
c4 = Comment.new(message: 'I wanna go!')
u2 = User.first
e2 = Event.second
c4.user_id = u2.id
c4.event_id = e2.id
c4.save!
#Guest_List #2
g3 = GuestList.new()
u2 = User.second
e2 = Event.second
g3.user_id = u2.id
g3.event_id = e2.id
g3.save!
#Event #3
e3 = Event.new(description: 'beer tasting',  location: 'Card Belarmino 1212', final_date: '01/08/2020 - 18:00', creation_date: '04/05/2020 - 13:00')
o1 = Organization.first
c2 = ChoiceOfDate.second
p2 = Privacy.second
e3.organization_id = o1.id
e3.choice_of_date_id = c2.id
e3.privacy_id = p2.id
e3.save!
#Event_Creator #3
c3 = EventCreator.new()
e3 = Event.third
u1 = User.first
c3.user_id = u1.id
c3.event_id = e3.id
c3.save!
#Guest_List #3
g3 = GuestList.new()
u2 = User.first
e2 = Event.third
g3.user_id = u2.id
g3.event_id = e2.id
g3.save!
#Comments #5
c5 = Comment.new(message: 'I hope you like the event!')
u2 = User.third
e2 = Event.third
c5.user_id = u2.id
c5.event_id = e2.id
c5.save!
#Comments #6
c6 = Comment.new(message: 'I wanna be there now!')
u2 = User.first
e2 = Event.second
c6.user_id = u2.id
c6.event_id = e2.id
c6.save!
#Event #4
e4 = Event.new(description: 'pool party',  location: 'casa vero', final_date: '11/01/2021 - 17:00', creation_date: '01/07/2019 - 18:00')
o1 = Organization.first
c1 = ChoiceOfDate.first
p1 = Privacy.first
e4.organization_id = o1.id
e4.choice_of_date_id = c1.id
e4.privacy_id = p1.id
e4.save!
#Event_Creator #4
c4 = EventCreator.new()
e4 = Event.fourth
u1 = User.first
c4.user_id = u1.id
c4.event_id = e4.id
c4.save!
#Comments #6
c6 = Comment.new(message: 'I hope it is sunny that day')
u2 = User.first
e2 = Event.fourth
c6.user_id = u2.id
c6.event_id = e2.id
c6.save!
#Event #5
e5 = Event.new(description: 'Cumpleaños Luna',  location: 'Casa Santi', final_date: '12/01/2020 - 17:00', creation_date: '11/10/2019 - 13:00')
o1 = Organization.first
c1 = ChoiceOfDate.first
p1 = Privacy.first
e5.organization_id = o1.id
e5.choice_of_date_id = c1.id
e5.privacy_id = p1.id
e5.save!
#Event_Creator #5
c5 = EventCreator.new()
e5 = Event.fifth
u3 = User.third
c5.user_id = u3.id
c5.event_id = e5.id
c5.save!
#Guest_List 5
g5 = GuestList.new()
u1 = User.first
e5 = Event.fifth
g5.user_id = u1.id
g5.event_id = e5.id
g5.save!
#System_Admin #1
s1 = SystemAdmin.new(admin: true)
u2 = User.second
s1.user_id = u2.id
s1.save!
#System_Admin #2
s2 = SystemAdmin.new(admin: true)
u1 = User.first
s2.user_id = u1.id
s2.save!
#System_Admin #3
s3 = SystemAdmin.new(admin: false)
u3 = User.third
s3.user_id = u3.id
s3.save!
#System_Admin #4
s4 = SystemAdmin.new(admin: false)
u4 = User.fourth
s4.user_id = u4.id
s4.save!
#System_Admin #5
s5 = SystemAdmin.new(admin: false)
u5 = User.fifth
s5.user_id = u5.id
s5.save!