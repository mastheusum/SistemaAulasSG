class AddHomeworkLinkToLesson < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :homework_link, :string
  end
end
