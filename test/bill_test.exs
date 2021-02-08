defmodule BillTest do
  use ExUnit.Case
  doctest Bill

  test "empty product list" do
    assert_raise RuntimeError, "There's no valid list of products to process the bill.", fn -> 
      Bill.sum_bill([],["a@email.com","b@email.org","c@email.net"])
    end
  end

  test "empty email list" do
    assert_raise RuntimeError, "There's no valid list of addresses to process the payment due.", fn -> 
      Bill.sum_bill([{"Alfafa",1,100},{"Quirera",2,340}],[])
    end
  end

  test "negative price" do
    assert_raise RuntimeError, ~r/cannot have a negative price!/, fn ->
       Bill.sum_bill([{"Alfafa",1,-100},{"Quirera",2,340}],["a@email.com","b@email.org","c@email.net"])
    end
  end

  test "negative amount" do
    assert_raise RuntimeError, ~r/cannot have a negative amount!/, fn ->
       Bill.sum_bill([{"Alfafa",-1,100},{"Quirera",2,340}],["a@email.com","b@email.org","c@email.net"])
    end
  end

  test "without email repetition" do
    assert Bill.sum_bill([{"Alho",1,2},{"Cebola",2,3},{"Tomate",3,4},{25,34,56},{"aipo",55,67},{"#0003477",111,556677}],["a@email.com","b@email.net","c@email.org","d@email.edu","e@email.mil"]) == %{"a@email.com" => 12359352,"b@email.net" => 12359351,"c@email.org" => 12359351,"d@email.edu" => 12359351,"e@email.mil"=> 12359351}
  end

  test "with email repetition" do
    assert Bill.sum_bill([{"Alho",1,2},{"Cebola",2,3},{"Tomate",3,4},{25,34,56},{"aipo",55,67},{"#0003477",111,556677}],["a@email.com","b@email.net","c@email.org","d@email.edu","e@email.mil","a@email.com","b@email.net","c@email.org","d@email.edu","e@email.mil","a@email.com","b@email.net","c@email.org","d@email.edu","e@email.mil"]) == %{"a@email.com" => 4119784,"b@email.net" => 4119784,"c@email.org" => 4119784,"d@email.edu" => 4119784,"e@email.mil"=> 4119784}
  end
end