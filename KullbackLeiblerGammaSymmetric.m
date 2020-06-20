function result = KullbackLeiblerGammaSymmetric(a1,b1,a2,b2)

result = (KullbackLeiblerGam(a1,b1,a2,b2)+KullbackLeiblerGam(a2,b2,a1,b1));
