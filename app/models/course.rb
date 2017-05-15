class Course < ActiveRecord::Base
    belongs_to :user
    has_many :lectures
    
    validates :title, :content, :user, presence: true
    validates :title, :content, length: {:minimum => 3}
    validates :content, length: {:maximum => 500}


end
