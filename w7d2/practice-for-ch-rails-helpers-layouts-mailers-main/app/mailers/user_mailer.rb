class UserMailer < ApplicationMailer
    default 

    def welcome_email(user)
        @user = user
        @url = 'http://localhost:3000/session/new'
        mail(to: user.username, subject: 'Welcome to 99 Cats!', from: '99catsadmin@appacademy.io')
    end
end
