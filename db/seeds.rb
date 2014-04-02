# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Lol Doge
def sample_file(filename="doge.jpg")
  File.new("public/system/samples/#{filename}")
end

Search.delete_all
Prediction.delete_all
FacebookUrl.delete_all

# Dog ID 1
s1 = Search.new(date_lost: "2012-01-01",
  num_results: 50,
  email: "tewing10@gmail.com",
  status: "failed")
s1.photo = sample_file("dog1.jpg")
s1.save!

# # Dog ID 1
s2 = Search.new(date_lost: "2014-01-01",
  num_results: 75,
  email: "tewing10@gmail.com",
  status: "queued")
s2.photo = sample_file("dog1.jpg")
s2.save!

# Dog ID 5
s3 = Search.new(date_lost: "2012-01-01",
  num_results: 150,
  email: "tewing10@gmail.com",
  status: "finished")
s3.photo = sample_file("dog5.jpg")
s3.save!

# Search ID 3
Prediction.create!(dog_id: 5,
  search_id: s3.id,
  url: "www.google.com")

# Search ID 3
Prediction.create!(dog_id: 1,
  search_id: s3.id,
  url: "www.petfinder.com")
