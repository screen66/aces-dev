
// ARRI ALEXA IDT for ALEXA linear files
//  with camera EI set to 3200
//  and CCT of adopted white set to 4300K
// Written by v3_IDT_maker.py v0.08 on Wednesday 20 November 2013 by jgoldstone

const float EI = 3200.0;
const float black = 256.0 / 65535.0;
const float exp_factor = 0.18 / (0.01 * (400.0/EI));

void main
(	input varying float rIn,
	input varying float gIn,
	input varying float bIn,
	input varying float aIn,
	output varying float rOut,
	output varying float gOut,
	output varying float bOut,
	output varying float aOut)
{

	// convert to white-balanced, black-subtracted linear values
	float r_lin = (rIn - black) * exp_factor;
	float g_lin = (gIn - black) * exp_factor;
	float b_lin = (bIn - black) * exp_factor;

	// convert to ACES primaries using CCT-dependent matrix
	rOut = r_lin * 0.785819 + g_lin * 0.128108 + b_lin * 0.086073;
	gOut = r_lin * 0.062428 + g_lin * 1.060542 + b_lin * -0.122971;
	bOut = r_lin * 0.039035 + g_lin * -0.303020 + b_lin * 1.263985;
	aOut = 1.0;

}
