class User < ApplicationRecord

    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :description, presence: true
    validates :email, presence: true,  uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
    validates :age, presence: true, numericality: {only_integer: true}
    validates :password, presence: true
    
    

    belongs_to :city, optional: true
    has_many :gossips

    

    #has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
    #has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
end
