defmodule Mix.Tasks.Compile.Neotoma do
  @moduledoc """
  Custom mix task to compile the Neotoma-based template parser.
  """
  use Mix.Task

  @shortdoc "Compile all `.peg` files in the `src` directory"
  def run(_) do
    Application.ensure_all_started(:neotoma)

    "src/**/*.peg"
    |> Path.wildcard()
    |> Enum.reduce_while(:ok, fn source, :ok ->
      target =
        source
        |> Path.basename(".peg")
        |> then(fn basename ->
          source
          |> Path.dirname()
          |> Path.join("#{basename}.erl")
        end)

      with {:ok, %{mtime: peg_mtime}} <- File.stat(source),
           peg_mtime <- mtime_to_integer(peg_mtime),
           {:ok, %{mtime: erl_mtime}} <- File.stat(target),
           erl_mtime when erl_mtime > peg_mtime <- mtime_to_integer(erl_mtime) do
        {:cont, :ok}
      else
        _ ->
          source
          |> compile_file()
          |> case do
            :ok -> {:cont, :ok}
            {:error, reason} -> {:halt, {:error, reason}}
          end
      end
    end)
  end

  defp compile_file(file) do
    file
    |> String.to_charlist()
    |> :neotoma.file()
  end

  defp mtime_to_integer(mtime) do
    with {:ok, mtime} <- NaiveDateTime.from_erl(mtime),
         {:ok, mtime} <- DateTime.from_naive(mtime, "Etc/UTC") do
      DateTime.to_unix(mtime)
    end
  end
end
