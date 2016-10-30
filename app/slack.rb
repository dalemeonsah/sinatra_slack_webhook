class Slack

  # As mentioned in Incoming Webhooks section, Slack requires JSON payload and it requires a text field at the minimum.
  # The username and icon emoji fields are optional and editable at any time.
  # 
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