class BectorChannel < ApplicationCable::Channel
  def subscribed
    stream_from "bector:micropost"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def message
    BectorChannel.broadcast_to("micropost", "hello")
  end
end
