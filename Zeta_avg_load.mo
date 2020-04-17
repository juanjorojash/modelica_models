model Zeta_avg_load
  ZetaAvg zetaAvg annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 1)  annotation(
    Placement(visible = true, transformation(origin = {46, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-62, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {46, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 5) annotation(
    Placement(visible = true, transformation(origin = {-46, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.RampVoltage rampVoltage1(V = 4, duration = 0.05, offset = 3, startTime = 6) annotation(
    Placement(visible = true, transformation(origin = {-62, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor vavg annotation(
    Placement(visible = true, transformation(origin = {68, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.LimPID pid(Nd = 10, Ni = 1, Td = 0.5, Ti = 0.3, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.InitPID.InitialState, k = 0.5, limitsAtInit = true, wd = 1, wp = 1, yMax = 0.9, yMin = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-14, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ground1.p, resistor.n) annotation(
    Line(points = {{46, 8}, {46, 20}}, color = {0, 0, 255}));
  connect(rampVoltage1.n, ground.p) annotation(
    Line(points = {{-62, 20}, {-62, 8}}, color = {0, 0, 255}));
  connect(rampVoltage1.n, zetaAvg.n1) annotation(
    Line(points = {{-62, 20}, {-20, 20}}, color = {0, 0, 255}));
  connect(rampVoltage1.p, zetaAvg.p1) annotation(
    Line(points = {{-62, 40}, {-20, 40}}, color = {0, 0, 255}));
  connect(resistor.p, vavg.p) annotation(
    Line(points = {{46, 40}, {68, 40}}, color = {0, 0, 255}));
  connect(vavg.n, resistor.n) annotation(
    Line(points = {{68, 20}, {46, 20}}, color = {0, 0, 255}));
  connect(realExpression1.y, pid.u_s) annotation(
    Line(points = {{-34, -26}, {-26, -26}, {-26, -26}, {-26, -26}}, color = {0, 0, 127}));
  connect(pid.u_m, vavg.v) annotation(
    Line(points = {{-14, -38}, {-14, -38}, {-14, -50}, {54, -50}, {54, 30}, {58, 30}, {58, 30}}, color = {0, 0, 127}));
  connect(zetaAvg.D, pid.y) annotation(
    Line(points = {{-10, 18}, {-10, 18}, {-10, -6}, {8, -6}, {8, -26}, {-4, -26}, {-4, -26}, {-2, -26}}, color = {0, 0, 127}));
  connect(zetaAvg.p2, resistor.p) annotation(
    Line(points = {{0, 40}, {46, 40}, {46, 40}, {46, 40}}, color = {0, 0, 255}));
  connect(zetaAvg.n2, resistor.n) annotation(
    Line(points = {{0, 20}, {46, 20}, {46, 20}, {46, 20}}, color = {0, 0, 255}));
  annotation(
    uses(Modelica(version = "3.2.3")));
end Zeta_avg_load;
