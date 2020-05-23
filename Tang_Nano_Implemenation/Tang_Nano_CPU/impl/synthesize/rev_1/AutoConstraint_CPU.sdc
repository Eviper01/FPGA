
#Begin clock constraint
define_clock -name {CPU|clk} {p:CPU|clk} -period 12.303 -clockgroup Autoconstr_clkgroup_0 -rise 0.000 -fall 6.152 -route 0.000 
#End clock constraint

#Begin clock constraint
define_clock -name {TRI_BUF|F_inferred_clock} {n:TRI_BUF|F_inferred_clock} -period 3.812 -clockgroup Autoconstr_clkgroup_1 -rise 0.000 -fall 1.906 -route 0.000 
#End clock constraint
