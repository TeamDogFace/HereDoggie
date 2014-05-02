class RecognitionNotifier < ActionMailer::Base
  default from: "DogFace Admin <no-reply@dogface.psu.edu>"

  def complete(email)
    mail to: email, subject: 'Finished Dog Search'
  end

  def error(email)
    mail to: email, subject: 'Error with Dog Search'
  end
end
