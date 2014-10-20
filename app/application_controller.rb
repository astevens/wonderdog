class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def index
    render :text => "responding"
  end

  # this is setup to be as fast as possible, so that it can catch big streams
  # of sends from multiple servers without barfing
  # the record is inserted manually, without validation or model code
  # and we rely on manyal synchronization to keep the R3 code up to date
  def sendgridhook
    params['_json'].each do |event|
      next unless event['event'] == 'open'
      Sequel::Model.db[:campaign_result_events].insert(
          :id => event['sg_event_id'],
          :type => event['event'].capitalize,
          :campaign_id => event['category'].last,
          :campaign_result_id => event['crid'],
          :ip => event['ip'],
          :url => event['url'],
          :created => Time.at(event['timestamp'])
        )
    end

    render :text => "success"
  end
end
