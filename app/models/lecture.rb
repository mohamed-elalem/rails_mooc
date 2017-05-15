class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  acts_as_commentable
  acts_as_votable

  has_attached_file :attachment
  do_not_validate_attachment_file_type :attachment

  validates :title, :content, :course, :user, presence: true
  validates :title, :content, length: {:minimum => 3}
  validates :content, length: {:maximum => 500}

  def attachment_remote_url=(url_value)
    URI.parse(url_value)
  end

end
