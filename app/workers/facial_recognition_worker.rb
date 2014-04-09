class FacialRecognitionWorker
  include Sidekiq::Worker

  def perform(search_id)
    # Run python script for facial recognition
    # with the search id as a command-line argument
    # `python main.py #{search_id}`
    email = Search.find(search_id).email
    RecognitionNotifier.complete(email).deliver
  end
end
