test_user = User.new(email: "tester@lewagon.com", fullname: "Chef", title: "User", password: "123456", expertise: "coding")
test_user.save!
puts "created new test user"
