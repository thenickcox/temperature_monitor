class SMSNotifier

  def notify(temp)
    curl = "curl -X POST -H 'Content-Type: application/json' -d '{\"value1\":#{temp}}'"
    url = "https://maker.ifttt.com/trigger/temperature/with/key/#{Rails.application.secrets.ifttt_key}"
    request = [curl, url].join(' ')
    system request
  end

end
