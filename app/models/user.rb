class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  
  
  acts_as_voter

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  enum gender: {male: 0, female: 1}
  enum role: {admin: 1, instructor: 2, student: 3}

  belongs_to :role
  has_many :courses
  has_many :lectures
  has_many :courses
  has_many :lectures
  has_many :replies
  has_many :feedbacks

  validates :gender, :name, presence: true
  
  
  def is?(role)
    self.role == role
  end

#  def is?(role)
#    abort(self.role.name)
#    self.role.name == role.to_s
#  end
  
end
