function res = GammaGeodesicDistance(shape1,scale1, shape2, scale2)

res = abs(psi(1,shape2)-psi(1,shape1))+abs(shape1.*log(scale1./scale2));