defmodule Rumbl.WatchControllerTest do
  use Rumbl.ConnCase
  alias Rumbl.Video

  @valid_attrs %{url: "http://youtu.be", title: "vid", description: "a vid"}

  test "shows chosen resource", %{conn: conn} do
    user = insert_user(username: "username")
    video = insert_video(user, @valid_attrs)
    conn = get conn, watch_path(conn, :show, video)
    assert html_response(conn, 200) =~ "Annotations"
  end

end
