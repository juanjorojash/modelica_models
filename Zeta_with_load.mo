model Zeta_with_load
  Modelica.Electrical.PowerConverters.DCDC.Control.SignalPWM pwm(f = 1e3, useConstantDutyCycle = false) annotation(
    Placement(visible = true, transformation(origin = {-8, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-76, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.RampVoltage rampVoltage(V = 4, duration = 0.05, offset = 3, startTime = 6) annotation(
    Placement(visible = true, transformation(origin = {-76, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.LimPID pid(Nd = 10, Ni = 1, Td = 0.5, Ti = 0.008, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.InitPID.InitialState, k = 0.002, limitsAtInit = true, wd = 1, wp = 1, yMax = 0.9, yMin = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-42, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor vswitch annotation(
    Placement(visible = true, transformation(origin = {84, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression setpoint(y = 5) annotation(
    Placement(visible = true, transformation(origin = {-72, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ZetaBuckBoost zetaBuckBoost annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor Cfilter(C = 100e-6, v(start = 0)) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor Rloadswt(R = 1) annotation(
    Placement(visible = true, transformation(origin = {56, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Inductor Lfilter(L = 20e-3) annotation(
    Placement(visible = true, transformation(origin = {20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ground.p, rampVoltage.n) annotation(
    Line(points = {{-76, -2}, {-76, 20}}, color = {0, 0, 255}));
  connect(setpoint.y, pid.u_s) annotation(
    Line(points = {{-61, -66}, {-54, -66}}, color = {0, 0, 127}));
  connect(zetaBuckBoost.in_p, rampVoltage.p) annotation(
    Line(points = {{-20, 36}, {-32, 36}, {-32, 46}, {-58, 46}, {-58, 40}, {-76, 40}}, color = {0, 0, 255}));
  connect(rampVoltage.n, zetaBuckBoost.in_n) annotation(
    Line(points = {{-76, 20}, {-44, 20}, {-44, 14}, {-32, 14}, {-32, 24}, {-20, 24}}, color = {0, 0, 255}));
  connect(pwm.fire, zetaBuckBoost.G1) annotation(
    Line(points = {{-14, -1}, {-14, 18}, {-15, 18}}, color = {255, 0, 255}));
  connect(Cfilter.n, vswitch.n) annotation(
    Line(points = {{30, 20}, {30, 8}, {84, 8}, {84, 20}}, color = {0, 0, 255}));
  connect(zetaBuckBoost.ou_n, Rloadswt.n) annotation(
    Line(points = {{0, 24}, {12, 24}, {12, 8}, {56, 8}, {56, 20}}, color = {0, 0, 255}));
  connect(vswitch.n, Rloadswt.n) annotation(
    Line(points = {{84, 20}, {84, 8}, {56, 8}, {56, 20}}, color = {0, 0, 255}));
  connect(vswitch.p, Rloadswt.p) annotation(
    Line(points = {{84, 40}, {84, 50}, {56, 50}, {56, 40}}, color = {0, 0, 255}));
  connect(pwm.dutyCycle, pid.y) annotation(
    Line(points = {{-20, -12}, {-34, -12}, {-34, -38}, {-20, -38}, {-20, -66}, {-30, -66}, {-30, -66}}, color = {0, 0, 127}));
  connect(zetaBuckBoost.ou_p, Lfilter.p) annotation(
    Line(points = {{0, 36}, {4, 36}, {4, 50}, {10, 50}}, color = {0, 0, 255}));
  connect(Cfilter.p, Lfilter.n) annotation(
    Line(points = {{30, 40}, {30, 50}}, color = {0, 0, 255}));
  connect(Lfilter.n, vswitch.p) annotation(
    Line(points = {{30, 50}, {84, 50}, {84, 40}}, color = {0, 0, 255}));
  connect(vswitch.v, pid.u_m) annotation(
    Line(points = {{74, 30}, {66, 30}, {66, -90}, {-42, -90}, {-42, -78}, {-42, -78}}, color = {0, 0, 127}));
protected
  annotation(
    uses(Modelica(version = "3.2.3")));
end Zeta_with_load;
