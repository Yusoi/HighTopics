defmodule Hightopics.ThemesTest do
  use Hightopics.DataCase

  alias Hightopics.Themes

  describe "themes" do
    alias Hightopics.Themes.Theme

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def theme_fixture(attrs \\ %{}) do
      {:ok, theme} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Themes.create_theme()

      theme
    end

    test "list_themes/0 returns all themes" do
      theme = theme_fixture()
      assert Themes.list_themes() == [theme]
    end

    test "get_theme!/1 returns the theme with given id" do
      theme = theme_fixture()
      assert Themes.get_theme!(theme.id) == theme
    end

    test "create_theme/1 with valid data creates a theme" do
      assert {:ok, %Theme{} = theme} = Themes.create_theme(@valid_attrs)
      assert theme.description == "some description"
      assert theme.name == "some name"
    end

    test "create_theme/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Themes.create_theme(@invalid_attrs)
    end

    test "update_theme/2 with valid data updates the theme" do
      theme = theme_fixture()
      assert {:ok, theme} = Themes.update_theme(theme, @update_attrs)
      assert %Theme{} = theme
      assert theme.description == "some updated description"
      assert theme.name == "some updated name"
    end

    test "update_theme/2 with invalid data returns error changeset" do
      theme = theme_fixture()
      assert {:error, %Ecto.Changeset{}} = Themes.update_theme(theme, @invalid_attrs)
      assert theme == Themes.get_theme!(theme.id)
    end

    test "delete_theme/1 deletes the theme" do
      theme = theme_fixture()
      assert {:ok, %Theme{}} = Themes.delete_theme(theme)
      assert_raise Ecto.NoResultsError, fn -> Themes.get_theme!(theme.id) end
    end

    test "change_theme/1 returns a theme changeset" do
      theme = theme_fixture()
      assert %Ecto.Changeset{} = Themes.change_theme(theme)
    end
  end
end
