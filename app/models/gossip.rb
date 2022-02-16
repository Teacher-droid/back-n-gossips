class Gossip < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    has_many :comments

    belongs_to :user, optional: true
end
