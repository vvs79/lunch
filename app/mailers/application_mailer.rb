class ApplicationMailer < ActionMailer::Base
  default from: "vvs-lunch@gmail.com", template_path: 'mailers/orders'
end
