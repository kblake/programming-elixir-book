# Find users with highest score

users = %{
  john:     %{ score:   5  },
  sara:     %{ score:  17  },
  mark:     %{ score:   2  },
  amanda:   %{ score:   7  },
  mason:    %{ score: nil  },
  corey:    %{ score:  17  }
}


users = Enum.reject users, &(is_nil(elem(&1, 1).score))
users_by_score = Enum.group_by users, &(elem(&1, 1).score)
highest_scorers = Enum.max_by users_by_score, &(elem(&1, 0))
IO.inspect highest_scorers


# ===============================================================

#highest_scorer = Enum.max_by users, &(elem(&1, 1).score)
#IO.inspect highest_scorer


# ===============================================================
# ===============================================================

#scores = Enum.map users, &(elem(&1, 1).score)
#scores = Enum.reject(scores, &is_nil/1)
#high_score = Enum.max(scores)

#highest_scorers = Enum.filter Map.keys(users), fn(name) ->
  #users[name].score == high_score
#end

#IO.inspect %{high_score: high_score, highest_scorers: highest_scorers}

