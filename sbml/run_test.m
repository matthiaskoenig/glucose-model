solver = @ode23s
options = odeset()
tspan = [0,100]

[t x rInfo] = Koenig2014_Hepatic_Glucose_Model(tspan,solver,options)