class MyMailer < Devise::Mailer   

  helper :application
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def default_url_options
    {
      host: "localhost:3000"
    }
  end
end
