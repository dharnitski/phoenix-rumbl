defmodule Rumbl.UserControllerTest do
  use Rumbl.ConnCase
  alias Rumbl.User

  @valid_attrs %{name: "A User", username: "eva", password: "secret"}
  @invalid_attrs %{}


  setup %{conn: conn} = config do
    if username = config[:login_as] do
      user = insert_user(username: username)
      conn = assign(conn, :current_user, user)
      {:ok, conn: conn, user: user}
    else
      :ok
    end
  end

  test "requires user authentication on user and show actions", %{conn: conn} do
    Enum.each([
      get(conn, user_path(conn, :index)),
      get(conn, user_path(conn, :show, "123")),
    ], fn conn ->
      assert html_response(conn, 302)
      assert conn.halted
    end)
  end

  @tag login_as: "max"
  test "list all users on index", %{conn: conn, user: user} do
    other_user = insert_user(username: "other")

    conn = get conn, user_path(conn, :index)
    assert html_response(conn, 200) =~ ~r/Listing Users/
    #assert html_response(conn, 200) =~ user.name
    #assert String.contains?(conn.resp_body, user.name)
    #assert String.contains?(conn.resp_body, other_user.name)
  end

  @tag login_as: "max"
  test "shows chosen resource", %{user: owner, conn: conn} do
    conn = get conn, user_path(conn, :show, owner)
    assert html_response(conn, 200) =~ "Showing User"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, user_path(conn, :new)
    assert html_response(conn, 200) =~ "New User"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @valid_attrs
    assert redirected_to(conn) == user_path(conn, :index)
    #assert Repo.get_by(User, @valid_attrs)
  end

end
