class AddAttachmentToLectures < ActiveRecord::Migration
  def up
    add_attachment :lectures, :attachment
  end

  def down
    remove_attachment :lectures, :attachment
  end
end
