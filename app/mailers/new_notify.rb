class NewNotify < ActionMailer::Base
  default :from => "alexjonespodcasts@gmail.com"

  def newTicket()
    mail(:to => "ajalonh@gmail.com", :subject => "New Ticket Added" + Date.today.to_s(:long_ordinal))
  end

end
