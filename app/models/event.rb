class Event < ApplicationRecord
 belongs_to:customer
 belongs_to:group,optional: true
 
  validates :title, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
  validate :start_finish_check
  validate :start_check

  def start_finish_check
    errors.add(:finish_time, "は開始時刻より遅い時間を選択してください") if self.start_time > self.finish_time
  end

  def start_check
    errors.add(:start_time, "は現在の日時より遅い時間を選択してください") if self.start_time < Time.now
  end
end