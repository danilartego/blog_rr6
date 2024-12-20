class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  has_many :comments, dependent: :destroy
  before_destroy :delete_comments

  private

  def delete_comments
    comments.destroy_all
  end
end
