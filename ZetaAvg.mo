model ZetaAvg
  extends Modelica.Electrical.Analog.Interfaces.TwoPort;
  Modelica.Blocks.Interfaces.RealInput D annotation(
    Placement(visible = true, transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90))); 
  input Real gain(start=1);
equation
  gain = D/(1-D);
  v2 = v1/gain;
  i2 = i1*gain;
annotation(
    uses(Modelica(version = "3.2.3")));
end ZetaAvg;
