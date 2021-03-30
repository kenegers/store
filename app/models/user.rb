class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :basket
  after_create :build_basket

  private

  def build_basket
  	Basket.create(user_id: self.id)	
  end
end
