class Athlete < ActiveRecord::Base
  belongs_to :competition
  has_many :event_athletes
  validates_presence_of :competition_id
  validates_presence_of :name

  after_create :create_event_athletes
  
  private
  
  def create_event_athletes
    competition.events.each do |event|
      ea = EventAthlete.new(:athlete_id => self.id, :event_id => event.id)
      ea.save
    end
  end
  
end
