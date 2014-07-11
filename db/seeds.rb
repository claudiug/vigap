##USERS
User.delete_all
user = User.create(username: "demo123", first_name: "c", last_name: "d", password:"1234567",
                    email: "email@example.net")
##ARTICLES
Article.delete_all
100.times do |a|
  user.articles << Article.create(title: "title#{a}", text: "text:#{a}")
end

##COMMENTS
Comment.delete_all
a = Article.first
a1 = Article.last
20.times do |c|
  a.comments << Comment.create(title: "title#{c}", body: "body#{c}")
end
20.times do |c|
  a1.comments << Comment.create(title: "title#{c}", body: "body#{c}")
end

##PROFILES
Profile.delete_all
u = User.first
u.create_profile!(bio: "bio", photo:"location of photo", rank: 3)











