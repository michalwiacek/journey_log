# frozen_string_literal: true

class Trip < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :start_date_must_be_before_end_date

  private

  def start_date_must_be_before_end_date
    errors.add(:start_date, 'must be before end date') unless start_date <= end_date
  end
end
