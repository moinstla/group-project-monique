class Attendee < ActiveRecord::Base
  has_many :artists, dependent: :destroy
  validates :name, {:presence => true, :uniqueness => true}
  before_save :capitalize_name
  has_secure_password

private
  def capitalize_name
    self.name=(name.split(/(\W)/).map(&:capitalize).join)
  end
end
