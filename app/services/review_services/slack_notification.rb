module ReviewServices
  class SlackNotification
    def initialize(channel = ENV['SLACK_WEBHOOK_CHANNEL'])
      @uri = URI(ENV['SLACK_WEBHOOK_URL'])
      @channel = channel
    end

    def build_message(title, content, rating)
      params = {
                "text": title,
                "blocks": [
                  {
                    "type": "section",
                    "text": {
                      "type": "mrkdwn",
                      "text": "*#{title}* - #{content}\n#{'★' * rating}"
                    }
                  }
                ]
              }
      @params = generate_payload(params)
      self
    end

    def deliver
      begin
        Net::HTTP.post_form(@uri, @params)
      rescue => e
        Rails.logger.error("TaskSlackbotService: Error when sending: #{e.message}")
      end
    end

    private

    def generate_payload(params)
      {
        payload: { channel: @channel }.merge(params).to_json
      }
    end
  end
end