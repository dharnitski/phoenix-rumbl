defmodule Rumbl.VideoTest do
  use Rumbl.ModelCase

  alias Rumbl.Video

  @valid_attrs %{description: "some content", title: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Video.changeset(%Video{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Video.changeset(%Video{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with valid attributes slugify title" do
    attrs = Map.put(@valid_attrs, :title, "My Title")
    changeset = Video.changeset(%Video{}, attrs)
    %{slug: slug} = changeset.changes
    assert changeset.valid?
    assert slug == "my-title""
  end

end
