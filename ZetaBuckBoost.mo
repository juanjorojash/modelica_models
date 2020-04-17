model ZetaBuckBoost
  parameter Modelica.SIunits.Resistance Ronval=1e-05
    "Transistor closed resistance";
  parameter Modelica.SIunits.Conductance Goffval=1e-05
    "Transistor opened conductance";
  parameter Modelica.SIunits.Voltage Vkneeval=0
    "Transistor threshold voltage";
  parameter Modelica.SIunits.Temperature Tval=293.15
    "Transistor threshold voltage";
  parameter Modelica.SIunits.Capacitance Cinval=100e-6
    "Transistor threshold voltage";
  parameter Modelica.SIunits.Capacitance Coutval=100e-6
    "Transistor threshold voltage";
  parameter Modelica.SIunits.Capacitance C1val=30e-6
    "Transistor threshold voltage";
  parameter Modelica.SIunits.Inductance L1val=10e-3
    "Transistor threshold voltage";
  parameter Modelica.SIunits.Inductance L2val=10e-3
    "Transistor threshold voltage";
  Modelica.Electrical.Analog.Interfaces.PositivePin in_p annotation(
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin in_n annotation(
    Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin ou_p annotation(
    Placement(visible = true, transformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin ou_n annotation(
    Placement(visible = true, transformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor Cin(C = Cinval)  annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Capacitor C2(C = Coutval)  annotation(
    Placement(visible = true, transformation(origin = {80, 10}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Capacitor C1(C = C1val)  annotation(
    Placement(visible = true, transformation(origin = {0, 60}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.Inductor L1(L = L1val)  annotation(
    Placement(visible = true, transformation(origin = {-20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Inductor L2(L = L2val)  annotation(
    Placement(visible = true, transformation(origin = {60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput G1 annotation(
    Placement(visible = true, transformation(origin = {-46, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-46, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Electrical.Analog.Ideal.IdealDiode diode(Goff = Goffval, Ron = Ronval, T = Tval, Vknee = Vkneeval, off(start = false), useHeatPort = false) annotation(
    Placement(visible = true, transformation(origin = {20, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Electrical.Analog.Ideal.IdealGTOThyristor MOS1(Goff = Goffval, Ron = Ronval, T = Tval, Vknee = Vkneeval)  annotation(
    Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Cin.p, in_p) annotation(
    Line(points = {{-60, 20}, {-60, 60}, {-100, 60}}, color = {0, 0, 255}));
  connect(Cin.n, in_n) annotation(
    Line(points = {{-60, 0}, {-60, -60}, {-100, -60}}, color = {0, 0, 255}));
  connect(L1.n, in_n) annotation(
    Line(points = {{-20, 0}, {-20, -60}, {-100, -60}}, color = {0, 0, 255}));
  connect(C2.n, ou_n) annotation(
    Line(points = {{80, 0}, {80, -60}, {100, -60}}, color = {0, 0, 255}));
  connect(ou_n, in_n) annotation(
    Line(points = {{100, -60}, {-100, -60}, {-100, -60}, {-100, -60}}, color = {0, 0, 255}));
  connect(L2.p, C1.n) annotation(
    Line(points = {{50, 60}, {10, 60}}, color = {0, 0, 255}));
  connect(L2.n, ou_p) annotation(
    Line(points = {{70, 60}, {100, 60}}, color = {0, 0, 255}));
  connect(C2.p, ou_p) annotation(
    Line(points = {{80, 20}, {80, 60}, {100, 60}}, color = {0, 0, 255}));
  connect(diode.n, L2.p) annotation(
    Line(points = {{20, 20}, {20, 60}, {50, 60}}, color = {0, 0, 255}));
  connect(diode.p, ou_n) annotation(
    Line(points = {{20, 0}, {20, 0}, {20, -60}, {100, -60}, {100, -60}}, color = {0, 0, 255}));
  connect(L1.p, C1.p) annotation(
    Line(points = {{-20, 20}, {-20, 20}, {-20, 60}, {-10, 60}, {-10, 60}}, color = {0, 0, 255}));
  connect(MOS1.n, C1.p) annotation(
    Line(points = {{-30, 60}, {-10, 60}}, color = {0, 0, 255}));
  connect(MOS1.p, in_p) annotation(
    Line(points = {{-50, 60}, {-100, 60}}, color = {0, 0, 255}));
  connect(MOS1.fire, G1) annotation(
    Line(points = {{-30, 72}, {-30, 80}, {-46, 80}, {-46, -120}}, color = {255, 0, 255}));
  annotation(
    uses(Modelica(version = "3.2.3")),
  Icon(graphics = {Line(points = {{-100, -100}, {100, 100}}, thickness = 0.5), Rectangle(lineThickness = 0.5, extent = {{-100, 100}, {100, -100}}), Text(lineColor = {0, 0, 255}, extent = {{-150, 150}, {150, 110}}, textString = "%name"), Text(origin = {-42, 32}, extent = {{-22, -28}, {22, 28}}, textString = "DC"), Text(origin = {-42, 32}, extent = {{-22, -28}, {22, 28}}, textString = "DC"), Text(origin = {38, -28}, extent = {{-22, -28}, {22, 28}}, textString = "DC")}, coordinateSystem(initialScale = 0.1)),
  Diagram);
end ZetaBuckBoost;
