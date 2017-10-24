class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def admin?
  	self.role == 'admin'
  end
  has_many :orders
  has_many :items, :through => :orders
  has_many :purchases
  has_many :orders, :through => :purchases
end
