defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %{}, details: "", severity: 1
end

#iex(43)> report = %BugReport{owner: %{name: "Dave", company: "Pragmatic"}, details: "broken"}
#%BugReport{details: "broken", owner: %{company: "Pragmatic", name: "Dave"},severity: 1}

#iex(44)> report.owner
#%{company: "Pragmatic", name: "Dave"}

#iex(45)> report.owner.company
#"Pragmatic"

#iex(46)> put_in(report.owner.company, "PragProg")
#%BugReport{details: "broken", owner: %{company: "PragProg", name: "Dave"}, severity: 1}

#iex(48)> update_in(report.owner.name, &("Mr. " <> &1))
#%BugReport{details: "broken", owner: %{company: "Pragmatic", name: "Mr. Dave"}, severity: 1}
