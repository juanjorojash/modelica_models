model VCVvar
  extends Modelica.Electrical.Analog.Interfaces.TwoPort;
  Modelica.Blocks.Interfaces.RealInput gain annotation(
    Placement(visible = true, transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
equation
  v2 = v1*gain;
  i1 = 0;
  annotation(
    defaultComponentName = "vcvvar",
    Documentation(info = "<html>
<p>The linear voltage-controlled voltage source is a TwoPort. The right port voltage v2 is controlled by the left port voltage v1 via</p>
<pre>    v2 = v1 * gain. </pre>
<p>The left port current is zero. Any voltage gain can be chosen.</p>
</html>", revisions = "<html>
<ul>
<li><em> 1998   </em>
     by Christoph Clauss<br> initially implemented<br>
     </li>
</ul>
</html>"),
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}}), Line(points = {{90, 100}, {40, 100}, {40, -100}, {100, -100}}, color = {0, 0, 255}), Ellipse(lineColor = {0, 0, 255}, extent = {{20, 20}, {60, -20}}, endAngle = 360), Line(points = {{-20, 60}, {20, 60}}, color = {0, 0, 255}), Polygon(lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, points = {{20, 60}, {10, 63}, {10, 57}, {20, 60}}), Text(lineColor = {0, 0, 255}, extent = {{-150, 151}, {150, 111}}, textString = "%name"), Line(points = {{-90, 100}, {-40, 100}, {-40, 62}}, color = {0, 0, 255}), Line(points = {{-90, -100}, {-40, -100}, {-40, -60}}, color = {0, 0, 255})}),
    uses(Modelica(version = "3.2.3")));
end VCVvar;
