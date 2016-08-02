defmodule College do
  def make_room_list(file) do
    case (File.read file) do
      {:ok, device} -> handle_room_list_data device
      error -> error
    end
  end

  defp handle_room_list_data(device) do
    device
      |> String.strip()
      |> String.split("\n")
      |> Enum.map(&(String.split(&1, ",")))
      |> Enum.reduce(%{}, &handle_room_list_reduce/2)
  end

  defp handle_room_list_reduce([_course_id, course_number, room_number], acc) do
    Map.update(acc, room_number, [course_number], fn others -> [course_number | others] end)
  end
end
