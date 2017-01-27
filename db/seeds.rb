user = User.find_by(email: 'protsiv.roman@gmail.com')
user.update_attribute(:password, 'password')
