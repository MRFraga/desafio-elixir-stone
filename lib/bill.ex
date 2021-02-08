defmodule Bill do

def sum_bill(products, emails)  do
       products !=[] or raise"There's no valid list of products to process the bill."
       emails   !=[] or raise"There's no valid list of addresses to process the payment due."    
       product_sum(products, 0, emails)
    end  

    defp product_sum([{name, amount, price} | products], accumulator, emails) do
              price  > 0 or raise"The product #{name} cannot have a negative price!"
              amount > 0 or raise"The product #{name} cannot have a negative amount!"
              product_sum(products, (price * amount) + accumulator, emails)
    end

    defp product_sum([], accumulator, emails),  do:   bill_prep(accumulator, emails)

    defp bill_prep(accumulator, emails)  do

      payers = length(emails)
      total = div(accumulator, payers)
      change = rem(accumulator, payers)
      div_bill(change,total,emails, [])
    end

    defp div_bill(change, total, [head | emails], due_amount) do 
      unless change == 0 do div_bill(change-1, total, emails, [{head, total+1} | due_amount])
      else                  div_bill(change, total, emails, [{head, total} | due_amount])
      end
    end

    defp div_bill(_, _, _, due_amount), do: Map.new(due_amount)
end	  