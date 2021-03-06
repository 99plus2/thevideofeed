class Emailer
  class << self
    def perform
      videos = Video.where('created_at > ?', 24.hours.ago.utc).includes(:first_person)

      if videos.any?
        Subscriber.all.each do |subscriber|
          SubscriptionMailer.subscription(subscriber, videos).deliver
        end
      end
    end
  end
end
