defmodule ChunkySVG.Renderer do
  defstruct [:root_opts, :figures]

  alias __MODULE__

  def new(opts \\ [x: 0, y: 0, width: 100, height: 100]) do
    %Renderer{root_opts: Enum.into(opts, Map.new()), figures: []}
  end

  def add(%Renderer{figures: figures} = renderer, figure) do
    %{renderer | figures: [parse_figure(figure) | figures]}
  end

  def render(%Renderer{root_opts: root_opts, figures: figures} = renderer) do
    {:svg, root_opts, figures}
    |> XmlBuilder.generate()
  end

  def add_background(%Renderer{figures: figures} = renderer, color) when is_binary(color) do
    %{renderer | figures: [{:rect, %{width: "100%", height: "100%", fill: color}, nil} | figures]}
  end

  defp parse_figure(figure) when is_tuple(figure) do
    parse_figure([figure])
  end

  defp parse_figure(figures) when is_list(figures) do
    figures
    |> ChunkySVG.Builtin.expand()
    |> ChunkySVG.InlineMacro.expand()
  end
end
