class FacialRecognitionWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(search_id)
  	# Run php crawler script
  	logger.info `cd vendor/FacebookCrawler; php crawler.php; cd ..`

    # Run python script for facial recognition
    # with the search id as a command-line argument
    logger.info `cd vendor/DogFaceRecognizer; python main.py #{search_id}`
    email = Search.find(search_id).email
    RecognitionNotifier.complete(email).deliver
  end
end
