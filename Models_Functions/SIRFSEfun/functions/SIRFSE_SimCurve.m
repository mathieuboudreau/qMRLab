function SimCurveResults = SIRFSE_SimCurve(Fit, Prot, FitOpt )

FitOpt.R1map = 0;
FitOpt.R1reqR1f = 0;

xFit = [Fit.F, Fit.kr, Fit.R1f, Fit.R1r, -1*Fit.Sf, Fit.Sr, Fit.M0f];
Fit.table = xFit';

if (all(Prot.td == Prot.td(1)))
    Fit.ti = (0.5*Prot.ti(1):0.001:1.5*Prot.ti(end))';
    Fit.td = Prot.td(1)*ones(length(Fit.ti),1);
else
    Fit.ti = Prot.ti;
    Fit.td = Prot.td;
end
Fit.curve = SIRFSE_fun(xFit,[Fit.ti, Fit.td], FitOpt);

SimCurveResults = Fit;