class Search < ActiveRecord::Base
	has_many :predictions
	has_many :facebook_urls
	has_attached_file :photo,
		styles: { normal: "500x500>", thumb: "100x100>"},
		path: "public/system/:class/:id/:style/:filename",
		url: "/system/:class/:id/:style/:filename"

  accepts_nested_attributes_for :facebook_urls, reject_if: proc { |a| a[:url].blank? }

	validates :date_lost, :num_results, :email, presence: true
	validates :num_results, numericality: { greater_than: 0, less_than_or_equal_to: 1000 }
	validates_format_of :email, with: /@/
	validates_attachment_presence :photo
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

	after_commit :recognize, :on => :create

	def recognize
		# Run async
		FacialRecognitionWorker.perform_async(self.id, self.email)
	end

	def predictions
		Prediction.where("search_id = #{id}")
	end

	def urls
		facebook_url_string.split
	end
end
