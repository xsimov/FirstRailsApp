class UserMailer < ActionMailer::Base
  default from: "me@example.com"

  def confirm_visit(location,email_to_bother)
  	@location = location
  	mail(	to: email_to_bother,
  				subject: "New visit created at #{@location.name}")
  end
end
