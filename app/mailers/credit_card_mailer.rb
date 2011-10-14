class CreditCardMailer < ActionMailer::Base
  default :to => "business@tsl.pomona.edu",
  	  :from => "someone@example.com" #enter an email address here and then configure stmp settings, see this pagehttp://guides.rubyonrails.org/action_mailer_basics.html

  def new_user_email(credit_card)
    @user = credit_card
    mail(:subject => "A New User has Registered")
  end

end
