class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  has_many :likes
  has_and_belongs_to_many :tags
end
