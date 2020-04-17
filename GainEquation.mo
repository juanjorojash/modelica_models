model GainEquation
  extends Modelica.Blocks.Interfaces.SISO;
equation
  y = u/(1-u);
end GainEquation;
