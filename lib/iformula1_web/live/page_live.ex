defmodule Iformula1Web.PageLive do
  use Iformula1Web, :live_view

  def mount(_params, _session, socket) do

    {:ok, assign(socket, number: 0, form: to_form(%{add_amount_default: 90}))}
  end

  def render(assigns) do
    ~H"""
    <%= @number %>
    <.button phx-click="add">Add+</.button>
    <.simple_form for={@form} phx-submit="add_more">
      <.input field={@form[:add_amount]} value={@form.params.add_amount_default} />
      <.button>Add More</.button>
    </.simple_form>

    <%!-- <%= test("test") %> --%>
    <%!-- <.test/> --%>

    """
  end

  @spec handle_event(<<_::24, _::_*40>>, any(), any()) :: {:noreply, any()}
  def handle_event("add", _params, socket) do
    {:noreply, assign(socket, number: socket.assigns.number + 1)}
  end

  def handle_event("add_more", %{"add_amount" => the_added_amount}, socket) do
    amount_to_add_by = case Integer.parse(the_added_amount) do
      {number, _} -> number
      :error -> 3
    end

    {:noreply, assign(socket, number: socket.assigns.number + amount_to_add_by, form: to_form(%{add_amount_default: the_added_amount}))}
  end

  def test(assigns) do
    ~H"""
    Test Function!!!!
    """
  end

end
