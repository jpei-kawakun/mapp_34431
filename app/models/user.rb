class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :name
    validates :birth_day
    validates :gender
    validates :hobby
    validates :self_introduction, length: { maximum: 200 }
    validates :image
  end

    enum gender: { man: 0, woman: 1}

    has_one_attached :image
end
