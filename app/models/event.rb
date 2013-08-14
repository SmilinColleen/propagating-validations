class Event < ActiveRecord::Base
  validates :date, presence: true
  validates :title, presence: true, uniqueness: true
  validates :organizer_name, presence: true
  validates :organizer_email, presence: true,
      format: { with: /(.{1,})(\@)(\w{1,})(\.)(\w{2,})/}

  validate :date_in_the_past

  def date_in_the_past
    if date && date < Date.today  #DateTime.now
      errors.add(:date, "event can't happen in the past")
    end
  end

end
