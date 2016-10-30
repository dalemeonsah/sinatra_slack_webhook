class Slack

  def self.to_channel(channel, message, attachments=nil)
    RestClient.post(
      'https://hooks.slack.com/services/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', 
      {
        payload: {
          channel: "#{channel}",
          text: "#{message}",
          username: "reinhardcustomnamebot",
          icon_emoji: ":ghost:",
          attachments: attachments
        }.to_json
      }
    )
  end

end