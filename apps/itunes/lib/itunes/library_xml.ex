defmodule Itunes.Library do

    defmodule WrongFormat do
      defexception message: "wrong format of xml"
    end

    def parse_xml(data) do
      with {:ok, xml, _} <- :erlsom.simple_form(data),
           {'plist', _, [{'dict', _, nodes}]} <- xml do
        {:ok, parse(nodes)}
      else
        _ -> raise WrongFormat
      end
    rescue
      _error in WrongFormat ->
        {:error, :wrong_format, 1}
    end

    defp parse(nodes) do
      parse(nodes, Map.new)
    end

    defp parse([], map), do: map
    defp parse([{'key', _, [name]}, {type, _, value} | tail], map) do
      parse(tail, Map.put(map, List.to_string(name), convert(type, value)))
    end
    defp parse(node, _map) do
      IO.inspect(node)
      raise WrongFormat
    end

    defp convert('integer', [val]), do: parse_int(List.to_string(val))
    defp convert('date', [val]), do: Timex.parse!(List.to_string(val), "{ISO:Extended:Z}")
    defp convert('dict', val) when is_list(val), do: parse(val)
    defp convert('string', [val]), do: List.to_string(val)
    defp convert(_, val), do: val

    defp parse_int(val) do
      case Integer.parse(val) do
        {int, _} -> int
        _ -> val
      end
    end

end
