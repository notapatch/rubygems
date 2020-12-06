class ApplicationMailer < ActionMailer::Base
  default from: 'rubygems-bcs-io.herokuapp.com'
  layout 'mailer'
end
