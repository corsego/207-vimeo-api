class VimeoJob < ApplicationJob
  queue_as :default

  ACCESS_TOKEN = "testtesttesttesttesttest"
  def perform(*args)
    url = "https://api.vimeo.com"
    conn = Faraday.new(url:) do |faraday|
      faraday.request :authorization, :Bearer, ACCESS_TOKEN
    end

    # response = conn.get('/me')
    # return unless response.success?
    # body = JSON.parse response.body

    # user_id = body["uri"]
    # response = conn.get(user_id)
    # return unless response.success?
    # body = JSON.parse response.body

    # response = conn.get('/me/videos')
    # return unless response.success?
    # body = JSON.parse response.body
    # response = conn.get('/users/:id/videos')
    
    response = conn.get("/videos/123123123")
    return unless response.success?
    body = JSON.parse response.body
    video = Video.create(vimeo_payload: body.to_h)
  end
end
