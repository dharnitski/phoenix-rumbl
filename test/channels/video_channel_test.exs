defmodule Rumbl.VideoChannelTest do
  use Rumbl.ChannelCase

  alias Rumbl.VideoChannel

  setup do
    {:ok, _, socket} =
      socket("user_id", %{user_id: 1})
      |> subscribe_and_join(VideoChannel, "videos:1")

    {:ok, socket: socket}
  end

  #test "new annotation", %{socket: socket} do
  #  ref = push socket, "new_annotation", %{"hello" => "there"}
  #  assert_reply ref, :ok, %{"hello" => "there"}
  #end

end
