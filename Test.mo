model Test
  ZetaAvg zetaAvg annotation(
    Placement(visible = true, transformation(origin = {6, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 10)  annotation(
    Placement(visible = true, transformation(origin = {62, 8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-46, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {62, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID limPID(Nd = 10, Ni = 1, Td = 1e-2, Ti = 1e-1, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.InitPID.InitialState, k = 5e-1, limitsAtInit = true, wd = 0.5, wp = 1, yMax = 0.9, yMin = 0.1) annotation(
    Placement(visible = true, transformation(origin = {0, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 5) annotation(
    Placement(visible = true, transformation(origin = {-30, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.RampVoltage rampVoltage1(V = 4, duration = 0.05, offset = 3, startTime = 6) annotation(
    Placement(visible = true, transformation(origin = {-46, 8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor vavg annotation(
    Placement(visible = true, transformation(origin = {84, 8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(resistor.p, zetaAvg.p2) annotation(
    Line(points = {{62, 18}, {62, 18}, {62, 26}, {16, 26}, {16, 18}, {16, 18}}, color = {0, 0, 255}));
  connect(zetaAvg.n2, resistor.n) annotation(
    Line(points = {{16, -2}, {16, -10}, {62, -10}, {62, -2}}, color = {0, 0, 255}));
  connect(ground1.p, resistor.n) annotation(
    Line(points = {{62, -14}, {62, -14}, {62, -2}, {62, -2}}, color = {0, 0, 255}));
  connect(realExpression1.y, limPID.u_s) annotation(
    Line(points = {{-19, -48}, {-12, -48}}, color = {0, 0, 127}));
  connect(limPID.y, zetaAvg.D) annotation(
    Line(points = {{12, -48}, {24, -48}, {24, -26}, {6, -26}, {6, -4}, {6, -4}}, color = {0, 0, 127}));
  connect(rampVoltage1.n, ground.p) annotation(
    Line(points = {{-46, -2}, {-46, -2}, {-46, -14}, {-46, -14}}, color = {0, 0, 255}));
  connect(rampVoltage1.n, zetaAvg.n1) annotation(
    Line(points = {{-46, -2}, {-4, -2}, {-4, -2}, {-4, -2}}, color = {0, 0, 255}));
  connect(rampVoltage1.p, zetaAvg.p1) annotation(
    Line(points = {{-46, 18}, {-4, 18}, {-4, 18}, {-4, 18}}, color = {0, 0, 255}));
  connect(resistor.p, vavg.p) annotation(
    Line(points = {{62, 18}, {84, 18}, {84, 18}, {84, 18}}, color = {0, 0, 255}));
  connect(vavg.n, resistor.n) annotation(
    Line(points = {{84, -2}, {62, -2}, {62, -2}, {62, -2}}, color = {0, 0, 255}));
  connect(vavg.v, limPID.u_m) annotation(
    Line(points = {{74, 8}, {70, 8}, {70, -72}, {0, -72}, {0, -60}, {0, -60}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")));
end Test;
