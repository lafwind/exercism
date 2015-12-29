defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
	def reduce([], acc, _fxn), do: acc
	def reduce([head|tail], acc, fxn) do
		tail |> reduce(fxn.(head, acc), fxn)
	end

	@spec count(list) :: non_neg_integer
  def count(l) do
		l |> reduce(0, fn (_, acc) -> acc + 1 end)
  end

  @spec reverse(list) :: list
  def reverse(l) do
		l |> reduce([], &([&1 | &2]))
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
		l
		|> reverse
		|> reduce([], &([f.(&1) | &2]))
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
		l
		|> reverse
		|> reduce([], make_reducer(f))
  end

	defp make_reducer(fxn) do
		fn (ele, acc) ->
			if fxn.(ele) do
				[ele | acc]
			else
				acc
			end
		end
	end


  @spec append(list, list) :: list
  def append(a, b) do
		a
		|> reverse
		|> reduce(b, &([&1 | &2]))
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
		ll |> reduce([], &append(&2, &1))
  end
end
