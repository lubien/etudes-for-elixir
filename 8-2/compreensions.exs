people = [{"Federico", "M", 22}, {"Kim", "F", 45}, {"Hansa", "F", 30},
  {"Tran", "M", 47}, {"Cathy", "F", 32}, {"Elias", "M", 50}]

IO.inspect for {name, gender, age} <- people, gender == "M", age > 40, do: name

IO.inspect for {name, gender, age} <- people, gender == "M" or age > 40, do: name

