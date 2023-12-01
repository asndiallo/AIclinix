# frozen_string_literal: true

# Application Mailer helper
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
