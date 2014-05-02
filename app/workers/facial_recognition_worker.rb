class FacialRecognitionWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(search_id)
    email = Search.find(search_id).email
  	begin
      # Run php crawler script
      logger.info `cd vendor/FacebookCrawler; php crawler.php; cd ..`
      # Run python script for facial recognition
      # with the search id as a command-line argument
      logger.info `cd vendor/DogFaceRecognizer; python main2.py #{search_id}`
      # logger.info email
      RecognitionNotifier.complete(email).deliver
    rescue Exception => e
      logger.info e
      RecognitionNotifier.error(email).deliver
    end
  end
end
