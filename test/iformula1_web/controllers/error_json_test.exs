defmodule Iformula1Web.ErrorJSONTest do
  use Iformula1Web.ConnCase, async: true

  test "renders 404" do
    assert Iformula1Web.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Iformula1Web.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
