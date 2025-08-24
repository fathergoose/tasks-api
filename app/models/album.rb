class Album < ApplicationRecord
  belongs_to :genre
  belongs_to :artist
end
