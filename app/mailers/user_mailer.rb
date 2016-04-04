class UserMailer < ActionMailer::Base
    default from:'joaopaulo95jp@gmail.com'

    def exchange_email(user)
    @user = user
    mail(to: @user.email, subject: 'Troca recebida')
    end
end
