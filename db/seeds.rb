# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'xuorig', email: 'mgiroux0@gmail.com', password: 'allo1234', profile_pic_url: 'http://mgiroux.me/assets/images/avatar@2x.png')
User.create(username: 'glesauteur', email: 'glesauteur@gmail.com', password: 'allo1234', profile_pic_url: 'https://scontent-yyz1-1.xx.fbcdn.net/hphotos-xft1/v/t1.0-9/12189069_10153390341704775_201985339623299979_n.jpg?oh=25cc5f82df8cf700090264d17c9a975b&oe=570E699E')

a = FormCheck.create(title: '100kg Snatch PR', description: 'Curabitur eu nunc et nisi finibus placerat. Praesent venenatis nibh sed feugiat pulvinar. Etiam in augue gravida, volutpat mi interdum, mollis diam.
Vestibulum sollicitudin massa ipsum, quis fringilla mauris fringilla sed. Nunc eleifend urna et bibendum efficitur. Proin malesuada, sem vitae pretium volutpat, sapien.', user_id: 1)
a.comments.create(user_id: 1, content: 'congrats bro!!!')
a.comments.create(user_id: 1, content: 'Make sure you are keeping that back straight.')
a.comments.create(user_id: 2, content: 'nice pr!!!')
a.save!


FormCheck.create(title: '100kg Bench Fail', description: 'Curabitur eu nunc et nisi finibus placerat. Praesent venenatis nibh sed feugiat pulvinar. Etiam in augue gravida, volutpat mi interdum, mollis diam.
Vestibulum sollicitudin massa ipsum, quis fringilla mauris fringilla sed. Nunc eleifend urna et bibendum efficitur. Proin malesuada, sem vitae pretium volutpat, sapien.', user_id: 2)
FormCheck.create(title: 'Dribbling Help', description: 'Curabitur eu nunc et nisi finibus placerat. Praesent venenatis nibh sed feugiat pulvinar. Etiam in augue gravida, volutpat mi interdum, mollis diam.
Vestibulum sollicitudin massa ipsum, quis fringilla mauris fringilla sed. Nunc eleifend urna et bibendum efficitur. Proin malesuada, sem vitae pretium volutpat, sapien.', user_id: 2)
FormCheck.create(title: 'Crawl is feeling awkward', description: 'Curabitur eu nunc et nisi finibus placerat. Praesent venenatis nibh sed feugiat pulvinar. Etiam in augue gravida, volutpat mi interdum, mollis diam.
Vestibulum sollicitudin massa ipsum, quis fringilla mauris fringilla sed. Nunc eleifend urna et bibendum efficitur. Proin malesuada, sem vitae pretium volutpat, sapien.', user_id: 1)
FormCheck.create(title: 'Squat PR 3 plates', description: 'Curabitur eu nunc et nisi finibus placerat. Praesent venenatis nibh sed feugiat pulvinar. Etiam in augue gravida, volutpat mi interdum, mollis diam.
Vestibulum sollicitudin massa ipsum, quis fringilla mauris fringilla sed. Nunc eleifend urna et bibendum efficitur. Proin malesuada, sem vitae pretium volutpat, sapien.', user_id: 2)
FormCheck.create(title: 'Help with my swing', description: 'Curabitur eu nunc et nisi finibus placerat. Praesent venenatis nibh sed feugiat pulvinar. Etiam in augue gravida, volutpat mi interdum, mollis diam.
Vestibulum sollicitudin massa ipsum, quis fringilla mauris fringilla sed. Nunc eleifend urna et bibendum efficitur. Proin malesuada, sem vitae pretium volutpat, sapien.', user_id: 1)
FormCheck.create(title: 'Double Unders', description: 'Curabitur eu nunc et nisi finibus placerat. Praesent venenatis nibh sed feugiat pulvinar. Etiam in augue gravida, volutpat mi interdum, mollis diam.
Vestibulum sollicitudin massa ipsum, quis fringilla mauris fringilla sed. Nunc eleifend urna et bibendum efficitur. Proin malesuada, sem vitae pretium volutpat, sapien.', user_id: 2)
