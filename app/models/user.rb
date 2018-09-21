class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         acts_as_approval_user

         has_many :pending_articles

         after_initialize :set_defaults

         def set_defaults
            self.reputation = 0 if self.new_record?
         end
end
