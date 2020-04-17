model Zetados
  ZetaBuckBoost zetaBuckBoost annotation(
    Placement(visible = true, transformation(origin = {-2, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.PowerConverters.DCDC.Control.SignalPWM signalPWM(constantDutyCycle = 0.25, f = 1e3) annotation(
    Placement(visible = true, transformation(origin = {-2, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 5) annotation(
    Placement(visible = true, transformation(origin = {-74, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(extent = {{-84, -34}, {-64, -14}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 100) annotation(
    Placement(visible = true, transformation(origin = { 50, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation(
    Placement(visible = true, transformation(origin = {76, 6}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
equation
  connect(signalPWM.fire, zetaBuckBoost.G1) annotation(
    Line(points = {{-8, -38}, {-6, -38}, {-6, -2}, {-6, -2}}, color = {255, 0, 255}));
  connect(constantVoltage.p, zetaBuckBoost.in_p) annotation(
    Line(points = {{-74, 16}, {-74, 22}, {-20, 22}, {-20, 16}, {-12, 16}}, color = {0, 0, 255}));
  connect(zetaBuckBoost.ou_p, resistor.p) annotation(
    Line(points = {{8, 16}, {24, 16}, {24, 32}, {50, 32}, {50, 16}, {50, 16}, {50, 16}}, color = {0, 0, 255}));
  connect(zetaBuckBoost.ou_n, resistor.n) annotation(
    Line(points = {{8, 4}, {24, 4}, {24, -10}, {48, -10}, {48, -10}, {50, -10}, {50, -4}, {50, -4}}, color = {0, 0, 255}));
  connect(voltageSensor.p, resistor.p) annotation(
    Line(points = {{76, 16}, {76, 16}, {76, 32}, {50, 32}, {50, 16}, {50, 16}}, color = {0, 0, 255}));
  connect(voltageSensor.n, resistor.n) annotation(
    Line(points = {{76, -4}, {76, -4}, {76, -10}, {50, -10}, {50, -4}, {50, -4}}, color = {0, 0, 255}));
  connect(ground.p, constantVoltage.n) annotation(
    Line(points = {{-74, -14}, {-74, -14}, {-74, -4}, {-74, -4}}, color = {0, 0, 255}));
  connect(constantVoltage.n, zetaBuckBoost.in_n) annotation(
    Line(points = {{-74, -4}, {-28, -4}, {-28, 4}, {-12, 4}, {-12, 4}}, color = {0, 0, 255}));

annotation(
    uses(Modelica(version = "3.2.3")));
end Zetados;
