class Reminder < ApplicationRecord
  has_and_belongs_to_many :journals

  before_save :set_time

  enum day: [
    :sunday,
    :monday,
    :tuesday,
    :wednesday,
    :thursday,
    :friday,
    :saturday
  ]

  def self.ready_to_send
    time = Time.zone.now
    where('day = ? AND hour < ? AND minute < ?', time.wday, time.hour, time.min)
  end

  private

    def set_time
      offset = ActiveSupport::TimeZone.new(time_zone).utc_offset
      time = local_time + offset
      self.hour = time.hour
      self.minute = time.min
    end
end
